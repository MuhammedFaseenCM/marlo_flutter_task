import 'package:flutter/material.dart';
import 'package:marlo_flutter_task/controller/provider/home_provider.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/constants.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/custom_color.dart';
import 'package:marlo_flutter_task/view/transactionscreen/widgets/button_widget.dart';
import 'package:provider/provider.dart';

class StatusesContainer extends StatelessWidget {
  final String title;
  final int buttonLength;
  final List<String> buttonText;
  const StatusesContainer(
      {super.key,
      required this.title,
      required this.buttonLength,
      required this.buttonText});

    @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: 100.0,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: kWhite),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          kHeight10,
          Row(
            children: List.generate(
                buttonLength,
                (index) =>
                    Consumer<HomeProvider>(builder: (context, homeProvider, _) {
                      return InkWell(
                          onTap: () {
                            final homeProvider = Provider.of<HomeProvider>(
                                context,
                                listen: false);
                         
                            homeProvider.changeSelection(index);
                          },
                          child: ButtonWidget(
                            text: buttonText[index],
                            isSelected: Provider.of<HomeProvider>(context,
                                    listen: false)
                                .selectedStatuses[index],
                          ));
                    })),
          )
        ],
      ),
    );
  }
}