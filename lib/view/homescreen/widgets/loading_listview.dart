import 'package:flutter/material.dart';
import 'package:marlo_flutter_task/view/homescreen/widgets/shimmer_widget.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/custom_color.dart';

class LoadingListView extends StatelessWidget {
  final int itemCount;
  const LoadingListView({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return const Card(
              color: kWhite,
              child: ListTile(
                leading: ShimmerWidget.rectangular(
                  height: 50.0,
                  width: 50.0,
                ),
                title: ShimmerWidget.rectangular(
                  height: 10.0,
                  width: 30.0,
                ),
                subtitle: ShimmerWidget.rectangular(
                  height: 10.0,
                  width: 10.0,
                ),
              ));
        });
  }
}
