import 'package:flutter/material.dart';
import 'package:marlo_flutter_task/controller/provider/home_provider.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/string_const.dart';
import 'package:provider/provider.dart';

class TitleSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, query);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (BuildContext ctx, value, Widget? child) {
        return ListView.builder(
          itemBuilder: (ctx, index) {
            //  final data = value.transactionList[index];
            final data = title[index];
            if (data.toLowerCase().contains(query.toLowerCase())) {
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      data,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Divider(),
                ],
              );
            } else {
              return Container();
            }
          },
          itemCount: title.length,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (BuildContext ctx, value, Widget? child) {
        return ListView.builder(
          itemBuilder: (ctx, index) {
            final data = title[index];

            query.replaceAll(" ", "");
            if (data.toLowerCase().contains(query.toLowerCase())) {
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      data,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Divider(),
                ],
              );
            } else {
              return Container();
            }
          },
          itemCount: title.length,
        );
      },
    );
  }
}
