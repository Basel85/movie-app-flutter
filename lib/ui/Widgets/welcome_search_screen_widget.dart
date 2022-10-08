import 'package:flutter/material.dart';

class WelcomeSearchScreen extends StatelessWidget {
  const WelcomeSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.primary,
            size: 64,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Welcome to search movies screen",
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
