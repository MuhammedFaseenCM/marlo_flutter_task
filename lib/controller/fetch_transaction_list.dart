import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marlo_flutter_task/model/transactionlist_model.dart';

Future<TransactionData> fetchTransactionList(String token) async {
  Uri uri = Uri.parse(
      'https://asia-southeast1-marlo-bank-dev.cloudfunctions.net/api_dev/v2/airwallex/780e055c-35af-4d3b-ac82-49dff490ed91/transfers');
  Map<String, String> headers = {'authtoken' : token};
  try {
    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      print(response.body);
      dynamic json = jsonDecode(response.body);
      return TransactionData.fromJson(json);
    } else {
      print('Error: ${response.statusCode} - ${response.body}');
      return TransactionData.fromJson({});
    }
  } catch (e) {
    print('Error occurred: $e');
    return TransactionData.fromJson({});
  }
}
