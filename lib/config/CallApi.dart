import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CallApi {
  // final String _url = 'http://127.0.0.1:8000/api/';
  final String _url = 'https://readmeapp.my.id/api/';
  // final String _url = 'http://192.168.250.138:8000/api/';

  Future<http.Response> getData(apiUrl) async {
    String? fullUrl = _url + apiUrl;

    String? token = await _getToken();
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders(token));
  }

  Future<String?> _getToken() async {
    var token = await SharedPreferences.getInstance().then((prefs) {
      return prefs.getString('token');
    });

    return token;
  }

  Future<http.Response> postData(String endPoint, dynamic data) async {
    String? fullUrl = _url + endPoint;
    String? token = await _getToken();
    return await http.post(
      Uri.parse(fullUrl),
      headers: _setHeaders(token),
      body: jsonEncode(data),
    );
  }

  Future<http.Response> postMultipartData(
      String endPoint, data, PickedFile dataFile) async {
    String fullUrl = _url + endPoint;
    String? token = await _getToken();

    File _file = File(dataFile.path);
    print(dataFile.readAsBytes());

    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse(fullUrl));
    request.headers.addAll(_setHeaders(token));
    request.fields.addAll(data);
    request.files.add(await http.MultipartFile(
        'cover', _file.readAsBytes().asStream(), _file.lengthSync(),
        filename: _file.path.split('/').last));

    http.Response response =
        await http.Response.fromStream(await request.send());
    print(response.body);
    return response;
  }

  _setHeaders(String? token) {
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}
