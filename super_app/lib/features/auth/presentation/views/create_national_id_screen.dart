import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:super_app/constants.dart';
import 'package:super_app/core/models/national_id_model.dart';
import 'package:super_app/features/auth/presentation/views/submit_national_id_screen.dart';
import '../../../../core/models/ocr_model.dart';


class CreateNationalIdPage extends StatefulWidget {
  const CreateNationalIdPage({super.key});

  static const String routeName = "CreateNationalIdPage";

  @override
  State<CreateNationalIdPage> createState() => _CreateNationalIdPageState();
}

class _CreateNationalIdPageState extends State<CreateNationalIdPage> {
  XFile? _imageFile;

  String? _base64Image;

  OcrModel? _responseText;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:
      AppBar(
        centerTitle: true,
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      // Image Picker
      floatingActionButton: FloatingActionButton(
        backgroundColor: Constants.primaryGreen,
        onPressed: () {
          _responseText = null;
          setState(() {
            _pickImage();
          });
        },
        child: const Icon(Icons.add_photo_alternate_outlined),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _imageFile != null
            ? Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                'This is your National ID',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
            const Center(
              child: Text(
                'Make Sure the picture is clear',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Container(
              width: 350,
              height: 220,
              color: Colors.white,
              child: Image.file(
                File(_imageFile!.path),
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            _isLoading
                ? const Center(
              child: Text(
                'The Process Might take several minuets',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            )
                : const SizedBox(),
            const SizedBox(
              height: 20,
            ),
            _isLoading
                ? const CircularProgressIndicator() // Show circular progress indicator while loading
                : _responseText == null
                ? Center(
              child: MaterialButton(
                minWidth: 200,
                onPressed: () async {
                  /// ToDo - Extract Image by ML Algorithm ( Using flask API ).
                  // ServerEntity server =
                  //     ServerEntity(localHostServer: "");
                  // BlocProvider.of<ServerBloc>(context).add(
                  //     GetServerLinkEvent(serverEntity: server));
                  _responseText = await _triggerServer(context);
                  log(
                      "The response has been returned is : $_responseText");
                },
                color: Constants.primaryGreen,
                child: const Text(
                  "Extract Image",
                  style: TextStyle(
                      color: Colors.white, fontSize: 20),
                ),
              ),
            )
                : _responseText!.ocrData[0] ==
                "Not Egyptian ID , please try again..."
                ? const Text(
                "This is not a National ID, please upload valid one")
                : (_responseText!.ocrData[0] ==
                "The picture is not clear enough , please take a close , high resolution and clear picture")
                ? const Text(
                "Please take a clear National ID image")
                : Center(
              child: MaterialButton(
                minWidth: 200,
                onPressed: () {
                  /// ToDo - Use Create National ID API.
                  NationalIdModel nationalId =
                  NationalIdModel(
                      firstName:
                      _responseText!.ocrData[0],
                      lastName:
                      _responseText!.ocrData[1],
                      nationalId:
                      _responseText!.ocrData[2],
                      birthday:
                      _responseText!.ocrData[3],
                      address:
                      _responseText!.ocrData[4],
                      gender:
                      _responseText!.ocrData[5],
                      image: _base64Image!,
                      status: "Pending",
                      manuFactorId: "12345");

                  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                    context,
                    settings: RouteSettings(
                        name: SubmitNationalIdScreen.routeName,arguments: nationalId),
                    screen: const SubmitNationalIdScreen(),
                    withNavBar: false,
                    pageTransitionAnimation:
                    PageTransitionAnimation.cupertino,
                  );
                },
                color: Constants.primaryGreen,
                child: const Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        )
            : const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'No image selected',
                textAlign: TextAlign.center,
                style: TextStyle( fontSize: 28, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'Please Take a picture for your National ID Card',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Choose an option',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(
                  Icons.photo_library,
                  color: Colors.orange,
                ),
                title: const Text(
                  'Pick from Gallery',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  final image = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    setState(() {
                      _imageFile = image;
                    });
                    final imageBytes = File(_imageFile!.path).readAsBytesSync();
                    _base64Image = base64Encode(imageBytes);
                  } else {
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.orange),
                title: const Text(
                  'Take a Photo',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  final image =
                  await ImagePicker().pickImage(source: ImageSource.camera);
                  if (image != null) {
                    setState(() {
                      _imageFile = image;
                    });
                    final imageBytes = File(_imageFile!.path).readAsBytesSync();
                    _base64Image = base64Encode(imageBytes);
                  } else {
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<OcrModel> _triggerServer(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    // String baseUrl = "https://10.90.12.51:5000/cashout";
    String baseUrl = "https://ecfa-154-178-30-130.ngrok-free.app/cashout";
    OcrModel res;
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(baseUrl),
    );
    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    request.files.add(
      http.MultipartFile(
        'file',
        _imageFile!.readAsBytes().asStream(),
        await _imageFile!.length(),
        filename: "file",
      ),
    );
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String responseData = await response.stream.bytesToString();
      res = _decodeUnicodeEscape(responseData);
      setState(() {});
    } else {
      String responseData = await response.stream.bytesToString();
      res = _decodeUnicodeEscape(responseData);
      setState(() {});
    }
    setState(() {
      _isLoading = false;
    });
    return res;
  }

  OcrModel _decodeUnicodeEscape(String input) {
    Map<String, dynamic> decodedJson = json.decode(input);
    return OcrModel.fromJson(decodedJson);
  }
}
