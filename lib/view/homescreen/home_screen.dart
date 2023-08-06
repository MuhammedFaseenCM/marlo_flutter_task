import 'package:flutter/material.dart';
import 'package:marlo_flutter_task/controller/provider/home_provider.dart';
import 'package:marlo_flutter_task/view/homescreen/widgets/country_container.dart';
import 'package:marlo_flutter_task/view/homescreen/widgets/loading_listview.dart';
import 'package:marlo_flutter_task/view/homescreen/widgets/todo_container.dart';
import 'package:marlo_flutter_task/view/homescreen/widgets/transaction_list_widget.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/constants.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/custom_color.dart';
import 'package:marlo_flutter_task/view/transactionscreen/transaction_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
         refreshScreen(context);
    });
    return RefreshIndicator(
      onRefresh: () {
        return refreshScreen(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kHeight20,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(
                          3,
                          (index) => CountryContainer(
                                image: flags[index],
                                amount: amountList[index],
                                currency: currencies[index],
                              ))),
                ),
                kHeight30,
                const Text(
                  "To do \u00B7 4",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
                kHeight20,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ToDoContainer(
                        colors: purpleGradient,
                        icon: Icons.document_scanner_outlined,
                        iconColor: Colors.purple[800]!,
                        bgColor: Colors.purple[100]!,
                        text: "Verify you business\ndocuments",
                      ),
                      ToDoContainer(
                        colors: yellowGradient,
                        icon: Icons.mobile_screen_share_outlined,
                        iconColor: Colors.yellow[800]!,
                        bgColor: Colors.orange[100]!,
                        text: "Verify your identity\n",
                      ),
                      ToDoContainer(
                        colors: blueGradient,
                        icon: Icons.document_scanner_outlined,
                        bgColor: Colors.blue[100]!,
                        iconColor: Colors.black,
                        text: "Optimize \n business ",
                      )
                    ],
                  ),
                ),
                kHeight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "All transactions",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TransactionScreen(),
                              ));
                        },
                        child: const Text("See all"))
                  ],
                ),
                Expanded(
                  child: Consumer<HomeProvider>(
                    builder: (context, value, child) {
                      return value.transactionList.isEmpty
                          ? const LoadingListView(
                              itemCount: 6,
                            )
                          : ListViewWidget(
                              transactionList: value.transactionList);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

refreshScreen(context) {
  final homeProvider = Provider.of<HomeProvider>(context, listen: false);

  homeProvider
      .apiCall(context: context)
      .then((value) => homeProvider.changeLoading());
}
