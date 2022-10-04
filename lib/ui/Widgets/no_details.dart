import 'package:flutter/material.dart';

class NoDetails extends StatelessWidget {
  const NoDetails({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: Text(
            "No Details yet",
            style: Theme.of(context).textTheme.subtitle2,
          )),
    );
  }
}
