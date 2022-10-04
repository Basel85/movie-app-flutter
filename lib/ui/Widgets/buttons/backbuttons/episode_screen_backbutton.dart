import 'package:flutter/material.dart';

class EpisodeScreenBackButton extends StatelessWidget {
  const EpisodeScreenBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Theme.of(context).textTheme.subtitle2!.color,
                  size: 30,
                ))));
  }
}
