import 'package:flutter/material.dart';

class PlayButtonCicularAvatar extends StatelessWidget {
  const PlayButtonCicularAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      radius: 20,
      child: const Icon(
        Icons.play_arrow,
        color: Colors.white,
      ),
    );
  }
}
