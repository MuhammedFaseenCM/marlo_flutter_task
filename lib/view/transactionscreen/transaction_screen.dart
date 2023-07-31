import 'package:flutter/material.dart';
import 'package:marlo_flutter_task/controller/provider/search_provider.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/constants.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/custom_color.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/string_const.dart';
import 'package:marlo_flutter_task/view/transactionscreen/widgets/bottom_sheet.dart';
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
            Expanded(
              child: Consumer<SearchProvider>(builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.filteredTitles.isEmpty
                      ? title.length
                      : value.filteredTitles.length,
                  itemBuilder: (context, index) {
                    return Card(
                        color: kWhite,
                        child: ListTile(
                          title: Text(
                            value.filteredTitles.isEmpty
                                ? title[index]
                                : value.filteredTitles[index],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle:
                              const Text("Sat \u00B7 16 Jul \u00B7 9.00 pm"),
                          leading: Container(
                            width: 45.0,
                            height: 45.0,
                            decoration: BoxDecoration(
                                color: kBlueGreen,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: const Icon(
                              Icons.arrow_outward,
                              color: kWhite,
                            ),
                          ),
                        ));
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}


//  showSearch(context: context, delegate: TitleSearch());