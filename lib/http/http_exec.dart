import 'dart:convert';
import '/commons/constants.dart';
import '/models/http_response.dart';
import 'package:http/http.dart' as http;

class HttpExec {
  String endPoint;

  HttpExec(this.endPoint);

  static getResponse({String endPoint = '', String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers = {
        'Token': token,
      };
    }
    var response = await http.get(Uri.parse(endPoint), headers: headers);
    return validateResponse(response);
  }

  static validateResponse(response) {
    return (response.statusCode >= 200 && response.statusCode < 300)
        ? processCimosReponse(response)
        : returnError();
  }

  static returnError() {
    return HttpResponse(
        status: 500, description: Constant.ERROR_MESSAGE, body: {});
  }

  static processCimosReponse(response) {
    final Map<String, dynamic> r = json.decode(response.body);
    return HttpResponse(
        status: r['response']['status'],
        description: r['response']['description'],
        body: r['response']['body']);
  }
}
