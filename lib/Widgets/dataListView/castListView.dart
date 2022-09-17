import 'package:flutter/material.dart';
import 'package:movie_app/mixins/pageLoading.dart';
import 'package:movie_app/Widgets/card/castCard.dart';
import 'package:movie_app/Widgets/loading.dart';
import 'package:provider/provider.dart';
import '../../providers/casts_provider.dart';

class CastListView extends StatefulWidget {
  final Future<dynamic> fetch;
  CastListView(this.fetch);

  @override
  State<CastListView> createState() => _CastListViewState();
}

class _CastListViewState extends State<CastListView> with PageLoading {
  List<dynamic> casts = [];
  @override
  void initState() {
    widget.fetch.then((value){
      setState(() {
        casts = value;
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(left: 24,top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cast",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          const SizedBox(
            height: 16,
          ),
          isLoading
              ? Loading()
              : casts.isEmpty
                  ? Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        "No Details yet",
                        style: Theme.of(context).textTheme.subtitle2,
                      ))
                  : Builder(builder: (context) {
                      return CastCard(casts.length, casts);
                    })
        ],
      ),
    );
  }
}
