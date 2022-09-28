import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/ListView/episodes_listview.dart';
import 'package:movie_app/Widgets/container/episode_screen_backbutton_container.dart';
import 'package:movie_app/Widgets/loading.dart';
import '../mixins/data.dart';

class EpisodesScreen extends StatelessWidget with Data {
  final Future<dynamic> fetch;
  final seasonName;
  EpisodesScreen(this.fetch, this.seasonName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            seasonName,
            style: Theme.of(context).textTheme.headline2,
          ),
          leading: const EpisodeScreenBackButtonContainer()
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
