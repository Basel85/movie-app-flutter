import 'package:flutter/material.dart';

class StoryBuilder extends StatelessWidget {
  final _data;
  const StoryBuilder(this._data,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, top: 24, right: 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Story",
          style: Theme.of(context).textTheme.subtitle2,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          _data.overview,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ]),
    );
  }
}
