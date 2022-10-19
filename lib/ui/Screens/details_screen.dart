import 'package:flutter/material.dart';
class DetailsScreen extends StatefulWidget {
  final _fetcher;
  const DetailsScreen(this._fetcher, {super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child:widget._fetcher,),);
  }
}
