import 'package:flutter/material.dart';

class NoResults extends StatelessWidget {
  const NoResults({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: Text(
            "No Results",
            style: Theme.of(context).textTheme.subtitle2,
          )),
    );
  }
}
