import 'dart:convert';


class ApiService {
  // localhost
  // static String baseUrl = 'http://10.0.2.2:3000/'; // for emulator
  static String baseUrl = 'http://192.168.1.5:3000/'; // for real device
  static String imagesBaseUrl = 'http://192.168.1.5:3000/';


  static Future<Map<String, dynamic>> signIn(
      {required String email, required String password}) async {
    Uri url = Uri.parse('${baseUrl}users/signIn');
    http.Response response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }

}


