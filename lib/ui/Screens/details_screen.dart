import 'package:flutter/material.dart';
import 'package:movie_app/interfaces/refresher.dart';
class DetailsScreen extends StatefulWidget {
  final _fetcher;
  const DetailsScreen(this._fetcher, {super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> implements Refresher{
  @override
  Widget build(BuildContext context) {
    print("details built");
    return Scaffold(body: SafeArea(child: RefreshIndicator(onRefresh: refresh,child: widget._fetcher,),),);
  }
  
  @override
  Future<void> refresh() async {
    setState(() {});
  }
}
