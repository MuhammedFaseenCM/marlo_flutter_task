import 'package:flutter/material.dart';
import 'package:marlo_flutter_task/controller/provider/home_provider.dart';
import 'package:marlo_flutter_task/view/transactionscreen/widgets/button_widget.dart';
import 'package:provider/provider.dart';

class FilteredDetailContainer extends StatelessWidget {
  const FilteredDetailContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return homeProvider.filteredList.isNotEmpty
            ? SizedBox(
                height: 40.0,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      homeProvider.selectedStatuses[0]
                          ? ButtonWidget(
                              text: "Completed",
                              isSelected: true,
                              function: () {
                                homeProvider.selectedStatuses[0] = false;
                                homeProvider.applyFilter();
                              },
                              isTscreen: true)
                          : const SizedBox(),
                      homeProvider.selectedStatuses[1]
                          ?  ButtonWidget(
                              text: "Pending",
                              isSelected: true,
                              function: () {
                                homeProvider.selectedStatuses[1] = false;
                                homeProvider.applyFilter();
                              },
                              isTscreen: true)
                          : const SizedBox(),
                      homeProvider.selectedStatuses[2]
                          ?  ButtonWidget(
                              text: "Cancelled",
                              function: () {
                                homeProvider.selectedStatuses[2] = false;
                                homeProvider.applyFilter();
                              },
                              isSelected: true,
                              isTscreen: true)
                          : const SizedBox(),
                      homeProvider.selectedMoney[0]
                          ?  ButtonWidget(
                              text: "Money in",
                              isSelected: true,
                              function: () {
                                homeProvider.selectedMoney[0] = false;
                                homeProvider.applyFilter();
                              },
                              isTscreen: true)
                          : const SizedBox(),
                      homeProvider.selectedMoney[1]
                          ?  ButtonWidget(
                              text: "Money out",
                              isSelected: true,
                              function: () {
                                homeProvider.selectedMoney[1] = false;
                                homeProvider.applyFilter();
                              },
                              isTscreen: true)
                          : const SizedBox(),
                    ],
                  ),
                ),
              )
            : const SizedBox();
      },
    );
  }
}
