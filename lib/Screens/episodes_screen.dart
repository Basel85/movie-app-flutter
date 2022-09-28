import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/ListView/episodes_listview.dart';
import 'package:movie_app/Widgets/loading.dart';
import '../mixins/data.dart';

class EpisodesList extends StatelessWidget with Data {
  final Future<dynamic> fetch;
  final seasonName;
  EpisodesList(this.fetch, this.seasonName, {super.key});

  @override
  Widget build(BuildContext context) {
    print("x");
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            seasonName,
            style: Theme.of(context).textTheme.headline2,
          ),
          leading: Container(
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
                      )))),
        ),
        body: FutureBuilder(
          builder: ((context, snapshot) {
            if (!snapshot.hasData) {
              return const Loading();
            }
            undetailedData = snapshot.data as List<dynamic>;
            return Container(
                margin: const EdgeInsets.only(left: 24, right: 24),
                child: EpisodesListView(undetailedData));
          }),
          future: fetch,
        ));
  }
}
