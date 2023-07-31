import 'package:flutter/material.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/constants.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/custom_color.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/string_const.dart';
import 'package:marlo_flutter_task/view/transactionscreen/widgets/amount_container.dart';
import 'package:marlo_flutter_task/view/transactionscreen/widgets/apply_button.dart';
import 'package:marlo_flutter_task/view/transactionscreen/widgets/checkbox_widget.dart';
import 'package:marlo_flutter_task/view/transactionscreen/widgets/filter_container.dart';
import 'package:marlo_flutter_task/view/transactionscreen/widgets/statuses_container.dart';

showFilterBottomSheet({required context}) {
  showModalBottomSheet(
    isScrollControlled: true,
    isDismissible: false,
    backgroundColor: kprimary,
    context: context,
    builder: (context) {
      return SizedBox(
        height: MediaQuery.sizeOf(context).height / 1.1,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                kHeight30,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Filter",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                    TextButton(onPressed: () {}, child: const Text("Clear")),
                  ],
                ),
                kHeight20,
                FilterContainerWidget(
                    title: "Money in and out \u00B7 2",
                    buttonLength: money.length,
                    buttonText: money),
                kHeight30,
                StatusesContainer(
                    title: "Statuses \u00B7 3",
                    buttonLength: statuses.length,
                    buttonText: statuses),
                kHeight30,
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: kWhite, borderRadius: BorderRadius.circular(10.0)),
                  // width: MediaQuery.sizeOf(context).width,
                  height: 350.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (value) {
                              value! ? false : true;
                            },
                          ),
                          kWidth10,
                          const Text(
                            "Currencies \u00B7 167",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      kHeight20,
                      CheckBoxWidget(
                          countryCode: "USD",
                          flag: flags[1],
                          moneyType: "United States Dollar"),
                      CheckBoxWidget(
                          flag: flags[2],
                          countryCode: "CAD",
                          moneyType: "Canadian Dollar"),
                      CheckBoxWidget(
                          flag: flags[0],
                          countryCode: "GBP",
                          moneyType: "British Pound"),
                      kHeight20,
                      Text(
                        "See all accounts",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: kBlue, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                kHeight20,
                Container(
                  padding: const EdgeInsets.all(10.0),
                  height: 100.0,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), color: kWhite),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Amount",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AmountContainer(text: "Minimum", amount: 0),
                          AmountContainer(text: "Maximum", amount: 5000)
                        ],
                      )
                    ],
                  ),
                ),
                kHeight20,
                const ApplyCancelButton(apply: false),
                kHeight10,
                const ApplyCancelButton(apply: true)
              ],
            ),
          ),
        ),
      );
    },
  );
}
