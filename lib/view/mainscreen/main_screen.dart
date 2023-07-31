import 'package:flutter/material.dart';
import 'package:marlo_flutter_task/controller/fetch_auth_token.dart';
import 'package:marlo_flutter_task/controller/fetch_transaction_list.dart';
import 'package:marlo_flutter_task/controller/provider/home_provider.dart';
import 'package:marlo_flutter_task/model/get_authtoken_model.dart';
import 'package:marlo_flutter_task/model/transactionlist_model.dart';
import 'package:marlo_flutter_task/view/homescreen/home_screen.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/bottom_nav_bar.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/constants.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/custom_color.dart';
import 'package:marlo_flutter_task/view/otherscreens/chat_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimary,
      bottomNavigationBar: const BottomNavBar(),
      appBar: AppBar(
        backgroundColor: kprimary,
        leading: Container(
          margin: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 5.0),
          decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: Colors.orange[800]!)),
          child: const Center(
              child: Text(
            "JB",
            style: TextStyle(color: kWhite),
          )),
        ),
        actions: const [
          Icon(
            Icons.notifications,
            color: kBlue,
            size: 30.0,
          ),
          kWidth20
        ],
      ),
      body: Consumer<HomeProvider>(
        builder: (context, value, child) {
          return IndexedStack(
            index: value.selectedIndex,
            children: const [
              HomeScreen(),
              DefaultScreen(text: "Loans"),
              DefaultScreen(text: "Contracts"),
              DefaultScreen(text: "Teams"),
              DefaultScreen(text: "Chat"),
            ],
          );
        },
      ),
    );
  }
}
