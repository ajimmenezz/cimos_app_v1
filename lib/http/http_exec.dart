import 'package:http/http.dart' as http;
import '/commons/constants.dart';
import '/models/http_response.dart';
import 'dart:convert';

class HttpExec {
  String endPoint;

  HttpExec(this.endPoint);

  static getResponse(endPoint) async {
    var response = await http.get(Uri.parse(endPoint));
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
    return (r['response']['status'] == 200)
        ? HttpResponse(
            status: r['response']['status'],
            description: r['response']['description'],
            body: r['response']['body'])
        : returnError();
  }
}
