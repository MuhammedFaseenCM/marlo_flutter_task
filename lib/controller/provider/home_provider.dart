import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:marlo_flutter_task/controller/fetch_auth_token.dart';
import 'package:marlo_flutter_task/controller/fetch_transaction_list.dart';
import 'package:marlo_flutter_task/model/transactionlist_model.dart';

class HomeProvider extends ChangeNotifier {
  int selectedIndex = 0;
  bool isLoading = true;

  bool isSelected = true;
  List<Transaction> transactionList = [];
    List<bool> selectedMoney = [false, false];

  List<bool> selectedStatuses = [false, false, false];

 

  void changeSelection(int index) {
    selectedStatuses[index] = !selectedStatuses[index];
    print(index);
    notifyListeners();
  }

  void changeSelectionMoney(int index) {
    selectedMoney[index] = !selectedMoney[index];
    print(index);
    notifyListeners();
  }

  setSelectedStates(int length) {
    for (var i = 0; i < length; i++) {
      selectedMoney.add(false);
      notifyListeners();
    }
  }

 

  changeLoading() {
    isLoading = isLoading ? false : true;
    notifyListeners();
  }

  changeBarIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Future<List<Transaction>> apiCall({required context}) async {
    var getAuthTokenModel = await fetchAuthToken();
    log(getAuthTokenModel.idToken);
    TransactionData transactionData =
        await fetchTransactionList(getAuthTokenModel.idToken);
    if (transactionData.errorFlag == "ERROR") {
      return transactionList;
    }
    transactionList.addAll(transactionData.data);
    return transactionList;
  }
}
