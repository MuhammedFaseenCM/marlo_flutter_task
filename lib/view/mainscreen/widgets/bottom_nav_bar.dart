import 'package:flutter/material.dart';
import 'package:marlo_flutter_task/controller/provider/home_provider.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/custom_color.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    var homeController = Provider.of<HomeProvider>(context);
    return BottomNavigationBar(
        currentIndex: homeController.selectedIndex,
        selectedItemColor: kBlack,
        unselectedItemColor: kBlack,
        onTap: homeController.changeBarIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.backpack_outlined), label: "Loans"),
          BottomNavigationBarItem(
              icon: Icon(Icons.note_add_outlined), label: "Contracts"),
          BottomNavigationBarItem(
              icon: Icon(Icons.groups_3_outlined), label: "Teams"),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outlined), label: "Chat"),
        ]);
  }
}
