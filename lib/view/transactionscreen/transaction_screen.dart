import 'package:flutter/material.dart';
import 'package:marlo_flutter_task/controller/provider/home_provider.dart';
import 'package:marlo_flutter_task/controller/provider/search_provider.dart';
import 'package:marlo_flutter_task/view/homescreen/widgets/loading_listview.dart';
import 'package:marlo_flutter_task/view/homescreen/widgets/transaction_list_widget.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/constants.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/custom_color.dart';
import 'package:marlo_flutter_task/view/transactionscreen/widgets/bottom_sheet.dart';
import 'package:marlo_flutter_task/view/transactionscreen/widgets/button_widget.dart';
import 'package:marlo_flutter_task/view/transactionscreen/widgets/empty_screen.dart';
import 'package:marlo_flutter_task/view/transactionscreen/widgets/filtered_details_container.dart';
import 'package:provider/provider.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimary,
      appBar: AppBar(
        backgroundColor: kprimary,
        actions: const [Icon(Icons.download)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Transactions",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            kHeight30,
            Consumer<SearchProvider>(builder: (context, searchProvider, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: MediaQuery.sizeOf(context).width / 1.25,
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      height: 35.0,
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(12.0)),
                      child: TextFormField(
                        controller: searchProvider.searchController,
                        onChanged: (value) {
                          searchProvider.updateSearchText();
                        },
                        decoration: const InputDecoration(
                            hintText: "Search vessel",
                            suffixIcon: Icon(Icons.search),
                            border: InputBorder.none),
                      )),
                  InkWell(
                    onTap: () {
                      showFilterBottomSheet(context: context);
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width / 12,
                      height: 35.0,
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(12.0)),
                      child: Icon(
                        Icons.filter_alt,
                        color: Colors.grey[600],
                      ),
                    ),
                  )
                ],
              );
            }),
            kHeight30,
            FilteredDetailContainer(),
            Expanded(
              child: Consumer2<SearchProvider, HomeProvider>(
                  builder: (context, searchProvider, homeProvider, _) {
                return homeProvider.transactionList.isEmpty
                    ? const LoadingListView(
                        itemCount: 6,
                      )
                    : homeProvider.selectedMoney[0] ||
                            homeProvider.selectedMoney[1]
                        ? homeProvider.filteredList.isEmpty
                            ? const EmptyScreen()
                            : ListViewWidget(
                                transactionList:
                                    homeProvider.filteredList.isEmpty
                                        ? homeProvider.transactionList
                                        : homeProvider.filteredList,
                                isTranScreen: true)
                        : ListViewWidget(
                            transactionList: homeProvider.filteredList.isEmpty
                                ? homeProvider.transactionList
                                : homeProvider.filteredList,
                            isTranScreen: true);
              }),
            )
          ],
        ),
      ),
    );
  }
}
