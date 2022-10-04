import 'package:flutter/material.dart';

class DetailsScreenBackButton extends StatelessWidget {
  const DetailsScreenBackButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          margin: const EdgeInsets.all(8),
          child: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
