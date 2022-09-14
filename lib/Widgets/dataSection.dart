import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/dataListView/dataListView.dart';
 class DataSection extends StatelessWidget {
  late String  categoryName;
  late dynamic  dataDisplaying;
  DataSection(name, obj){
    categoryName=name;
    dataDisplaying = obj;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 24,left: 24,right: 24,bottom: 16),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categoryName,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Text(
                "See all >",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
        dataDisplaying,
      ],
    );
  }
}
