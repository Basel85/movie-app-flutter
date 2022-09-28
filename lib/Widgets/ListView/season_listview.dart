import 'package:flutter/material.dart';
import 'package:movie_app/Screens/episodes_screen.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/Widgets/noimage.dart';
import 'package:movie_app/providers/episodes_provider.dart';

class SeasonListView extends StatelessWidget {
  final tvId;
  final seasons;
  const SeasonListView(this.tvId,this.seasons, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(margin: const EdgeInsets.only(left: 24,top: 24),child: Text("Seasons",style: Theme.of(context).textTheme.subtitle2,)),
        const SizedBox(height: 16,),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
                seasons.length,
                    (index) => GestureDetector(
                  onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>EpisodesScreen(Episodes.fetch(tvId,seasons[index]["season_number"]),seasons[index]["name"]))),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: EdgeInsets.zero,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 210,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: seasons[index]["poster_path"]==null? SizedBox(width: 140,child: NoImage()):Image.network(
                                  imageDomain +
                                      seasons[index]["poster_path"],
                                ))),
                        Expanded(
                          child: Container(
                            height: 210,
                            padding:
                            const EdgeInsets.only(top: 8, left: 8, right: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  seasons[index]["name"],
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                Text(
                                    "${seasons[index]["episode_count"]} ${seasons[index]["episode_count"] == 1 ? "episode" : "episodes"}",
                                    style: Theme.of(context).textTheme.bodyText1),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  seasons[index]["overview"],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 7,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        )
      ]
    );
  }
}
