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
  List<Transaction> moneyFilteredList = [];
  List<Transaction> filteredList = [];
  List<Transaction> statusFilteredList = [];
  List<bool> selectedStatuses = [false, false, false];

  List<Transaction> completedFilter() {
    return transactionList
        .where((data) => selectedStatuses[0] && data.status == "SETTLED")
        .toList();
  }

  List<Transaction> pendingFilter() {
    return transactionList
        .where((data) => selectedStatuses[1] && data.status == "PENDING")
        .toList();
  }

  List<Transaction> cancelledFilter() {
    return transactionList
        .where((data) => selectedStatuses[2] && data.status == "CANCELLED")
        .toList();
  }

  List<Transaction> moneyInFilter() {
    return transactionList.where((data) {
      if (selectedMoney[0] && data.sourceType == "DEPOSIT" ||
          data.sourceType == "REFUND" ||
          data.sourceType == "TRANSFER") {
        return true;
      }

      return false;
    }).toList();
  }

  List<Transaction> moneyOutFilter() {
    return transactionList.where((data) {
      if (selectedMoney[1] && data.sourceType == "PAYOUT" ||
          data.sourceType == "CHARGE" ||
          data.sourceType == "PAYMENT_ATTEMPT" ||
          data.sourceType == "FEE") {
        return true;
      }

      return false;
    }).toList();
  }

  applyFilter() {
    moneyFilteredList.clear();
    statusFilteredList.clear();
    filteredList.clear();
    moneyFilteredList.addAll(moneyInFilter());
    

    moneyFilteredList.addAll(moneyOutFilter());
  
    statusFilteredList.addAll(completedFilter());
    statusFilteredList.addAll(pendingFilter());
    statusFilteredList.addAll(cancelledFilter());
    Set<Transaction> uniqueData = {};
    uniqueData.addAll(moneyFilteredList);
    uniqueData.addAll(statusFilteredList);
    filteredList.addAll(uniqueData);
    notifyListeners();
  }

  void changeSelection(int index) {
    selectedStatuses[index] = !selectedStatuses[index];
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
    TransactionData transactionData =
        await fetchTransactionList(getAuthTokenModel.idToken);
    if (transactionData.errorFlag == "ERROR") {
      return transactionList;
    }
    transactionList.clear();
    transactionList.addAll(transactionData.data);
    return transactionList;
  }
}
