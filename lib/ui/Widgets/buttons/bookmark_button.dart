import 'package:flutter/material.dart';

class BookMarkButton extends StatelessWidget {
  const BookMarkButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: null,
        child: Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          margin: const EdgeInsets.all(8),
          child: const Icon(
            Icons.bookmark_border,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
    );
  }
}
