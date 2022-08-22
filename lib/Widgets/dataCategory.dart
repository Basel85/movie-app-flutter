import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/dataDisplaying.dart';
 class DataCategory extends StatelessWidget {
  late String  categoryName;
  late DataDisplaying  dataDisplaying;
  DataCategory(name, obj){
    categoryName=name;
    dataDisplaying = obj;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8,top: 24),
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
