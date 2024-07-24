import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import '../models/user_model.dart';
import 'package:image/image.dart' as img;

class ApiService {
  static String createNewUserBaseUrl = 'https://super-app-backend.onrender.com/users/createNewUser';
  static String loginBaseUrl = 'https://super-app-backend.onrender.com/users/signIn';

  static String scanQrCodeBaseUrl = 'https://super-app-backend.onrender.com/accessControl/addAccessControlEntry';

  static Future<Map<String, dynamic>> createNewUser({required UserModel userModel}) async {
    final Dio dio = Dio();

    // Assuming userModel.nid!.image is a base64 encoded string
    final String base64Image = userModel.nid!.image!;
    final img.Image? originalImage = img.decodeImage(base64Decode(base64Image));

    if (originalImage != null) {
      final img.Image resizedImage = img.copyResize(originalImage, width: 300); // resize to a smaller size
      final String compressedImage = base64Encode(img.encodeJpg(resizedImage, quality: 85)); // compress the image
      userModel.nid!.image = compressedImage;
    }

    final Map<String, dynamic> data = {
      "organizationId": "663ccdd279e1d547f516ae12",
      "organizationName": "Al Ahly Momken",
      "userStatus": true,
      "businessUserId": 123456,
      "username": userModel.userName,
      "userPassword": userModel.userPassword,
      "userMobileNumber": userModel.mobileNumber,
      "userEmail": userModel.userEmail,
      "userNationalID": {
        "firstName": userModel.nid!.firstName,
        "lastName": userModel.nid!.lastName,
        "address": userModel.nid!.address,
        "nationalID": userModel.nid!.nationalId,
        "status": "Pending",
        "gender": userModel.nid!.gender,
        "birthdate": userModel.nid!.birthday,
        "manuFactorId": userModel.nid!.manuFactorId,
        "image": userModel.nid!.image
      },
      "permission": {
        "superAdmin": false,
        "organizationAdmin": false,
        "merchant": false,
        "serviceAgent": false,
        "fieldAgent": false,
        "inventoryWorker": false,
        "consumer": true
      }
    };

    final Response response = await dio.post(
      createNewUserBaseUrl,
      data: data,
    );
    return response.data;
  }

  static Future<Map<String, dynamic>> login({required String userEmail, required String userPass, required String userNID}) async {
    final Dio dio = Dio();
    final Map<String, dynamic> data = {"userEmail": userEmail, "userPassword": userPass, "nationalID": userNID};
    final Response response = await dio.post(
      loginBaseUrl,
      data: data,
      options: Options(validateStatus: (status) {
        return status! < 500; // Accept responses with status codes less than 500
      }),
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('${response.data['message']}');
    }
  }

  static Future<Map<String, dynamic>> scanQrCode({required String agentId, required String consumerId}) async {
    final Dio dio = Dio();
    final Map<String, dynamic> data = {"agentId": agentId, "consumerId": consumerId};
    log("hena");
    final Response response = await dio.post(
      scanQrCodeBaseUrl,
      data: data,
    );
    return response.data;
  }
}
