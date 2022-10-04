import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/ui/Widgets/loading.dart';
import 'package:movie_app/ui/Widgets/noimage.dart';

class SeasonCard extends StatelessWidget {
  final season;
  const SeasonCard(this.season, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            height: 209,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: season["poster_path"] == null
                    ? const SizedBox(width: 140, child: NoImage())
                    : SizedBox(
                        width: 140,
                        child: Image.network(
                          imageDomain + season["poster_path"],
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return const Loading();
                          },
                        ),
                      ))),
        Expanded(
          child: Container(
            height: 210,
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  season["name"],
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(
                    "${season["episode_count"]} ${season["episode_count"] == 1 ? "episode" : "episodes"}",
                    style: Theme.of(context).textTheme.bodyText1),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  season["overview"],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 7,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
