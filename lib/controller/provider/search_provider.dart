import 'package:flutter/material.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/string_const.dart';

class SearchProvider extends ChangeNotifier {
  
final TextEditingController searchController = TextEditingController();
 List<String> filteredTitles = [];


  void updateSearchText() {
    filteredTitles = title
        .where((item) =>
            item.toLowerCase().contains(searchController.text.toLowerCase()))
        .toList();
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  
}