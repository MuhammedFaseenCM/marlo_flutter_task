import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marlo_flutter_task/model/get_authtoken_model.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/string_const.dart';

Future<GetAuthTokenModel> fetchAuthToken() async {
 
  Uri uri = Uri.parse(
      'https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=AIzaSyBFiEDfEaaK6lBtIdxLXspmxGux1TGsCmg');

  
  
  try {
    final response = await http.post(uri, body: body);

    if (response.statusCode == 200) {
      print(' ${response.body}');
      dynamic json = jsonDecode(response.body);
      return GetAuthTokenModel.fromJson(json);
    } else {
      print('Error: ${response.statusCode} - ${response.body}');
      return GetAuthTokenModel.fromJson({});
    }
  } catch (e) {
    print('Error occurred: $e');
    return GetAuthTokenModel.fromJson({});
  }
}
