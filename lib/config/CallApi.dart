import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CallApi {
  // final String url = 'https://simrs-smilingdev.000webhostapp.com/api/v1/';
  final String url = 'http://127.0.0.1:8000/api/v1/';
  final String _url = 'http://127.0.0.1:8000/api/';

  getPublicData(endPoint) async {
    Response response = await http.get(Uri.parse('$url$endPoint'));
    try {
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to load post');
      }
    } catch (e) {
      print(e);
      return 'failed';
    }
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;

    var token = await _getToken();
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders(token));
  }

  _getToken() async {
    var token = await SharedPreferences.getInstance().then((prefs) {
      return prefs.getString('token');
    });

    return token;
  }

  postData(String endPoint, dynamic data) async {
    var fullUrl = _url + endPoint;
    var token = await _getToken();
    return await http.post(
      Uri.parse(fullUrl),
      headers: _setHeaders(token),
      body: jsonEncode(data),
    );
  }

  _setHeaders(token) {
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}
