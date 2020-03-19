import 'package:http/http.dart' as http;
import 'package:rmrcloud/values.dart';

Future<http.Response> loginService (Map<String, String> headers, Map<String, String> body) async {
  try {
    var response = await http.post(
        BASE_URL + API_TOKEN, headers: headers, body: body);
    return response;
  } catch(error) {
    return null;
  }
}

Future<http.Response> forgetPasswordService (Map<String, String> headers) async {
  return await http.post(BASE_URL+API_FORGET_PASSWORD, headers: headers);
}

Future<http.Response> userByEmailService (Map<String, String> headers) async {
  return await http.get(BASE_URL+API_GET_USER_BY_EMAIL, headers: headers);
}

Future<http.Response> companyListService (Map<String, String> headers) async {
  return await http.get(BASE_URL+API_GET_COMPANY_LIST, headers: headers);
}

Future<http.Response> clockInService (Map<String, String> headers) async {
  return await http.post(BASE_URL+API_POST_CLOCK_IN, headers: headers);
}

Future<http.Response> clockOutService (Map<String, String> headers) async {
  return await http.post(BASE_URL+API_POST_CLOCK_OUT, headers: headers);
}

Future<http.Response> historyService (Map<String, String> headers) async {
  return await http.get(BASE_URL+API_GET_HISTORY, headers: headers);
}