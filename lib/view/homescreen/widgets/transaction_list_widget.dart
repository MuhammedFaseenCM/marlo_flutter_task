import 'package:flutter/material.dart';
import 'package:marlo_flutter_task/model/transactionlist_model.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/custom_color.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/string_const.dart';

class ListViewWidget extends StatelessWidget {
  final List transactionList;
  final bool isTranScreen;

  const ListViewWidget(
      {super.key, required this.transactionList, this.isTranScreen = false});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactionList.length,
      itemBuilder: (context, index) {
        return Card(
            child: ListTile(
          title: Text(
            isTranScreen ? fetchTitle(transactionList[index]) : "Rent",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: const Text("Sat \u00B7 16 Jul \u00B7 9.00 pm",
              style: TextStyle(fontSize: 13.0)),
          leading: Container(
            width: 45.0,
            height: 45.0,
            decoration: BoxDecoration(
                color: kBlueGreen, borderRadius: BorderRadius.circular(10.0)),
            child: Icon(
              fetchIcon(transactionList[index]),
              color: kWhite,
            ),
          ),
          trailing: Text(
            "\$${transactionList[index].amount}",
            style: TextStyle(
                fontSize: 15.0,
                color: transactionList[index].amount[0].contains("-")
                    ? kBlack
                    : kGreen),
          ),
        ));
      },
    );
  }
}

String fetchTitle(Transaction transactionData) {
  switch (transactionData.sourceType) {
    case "DEPOSIT":
      return title[0];

    case "TRANSFER":
      return title[1];

    case "REFUND":
      return title[2];

    case "PAYOUT":
      return title[3];

    case "CHARGE":
      return title[4];

    case "PAYMENT_ATTEMPT":
      return title[5];

    case "FEE":
      return title[6];

    case "CONVERSION":
      return title[7];
    default:
      return "No title";
  }
}

IconData fetchIcon(Transaction transactionData) {
  IconData icon = Icons.arrow_back;
  switch (transactionData.sourceType) {
    case "DEPOSIT":
      icon = Icons.arrow_outward;
      break;
    case "TRANSFER":
      icon = Icons.arrow_outward;
      break;
    case "REFUND":
      icon = Icons.arrow_outward;
      break;
    case "PAYOUT":
      icon = Icons.arrow_downward;
      break;
    case "CHARGE":
      icon = Icons.arrow_downward;
      break;
    case "PAYMENT_ATTEMPT":
      icon = Icons.arrow_downward;
      break;
    case "FEE":
      icon = Icons.arrow_downward;
      break;
    case "CONVERSION":
      icon = Icons.arrow_outward;
      break;
    default:
  }

  return icon;
}
