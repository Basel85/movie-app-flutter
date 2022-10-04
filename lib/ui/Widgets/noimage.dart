import 'package:flutter/material.dart';
class NoImage extends StatelessWidget {
  const NoImage({super.key});
  @override
  Widget build(BuildContext context) {
    return  Container(color: Colors.grey,height: 209,child: const Center(child: Text("NO Image"),),);
  }
}
