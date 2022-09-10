import 'package:flutter/material.dart';
import 'package:movie_app/Screens/Episodes.dart';
import 'package:movie_app/constants.dart';

class SeasonListView extends StatelessWidget {
  final seasons;
  SeasonListView(this.seasons);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
          seasons.length,
          (index) => GestureDetector(
                onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Episodes(seasons[index]["name"]))),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: EdgeInsets.zero,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: 210,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
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
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                  child: Text(
                                seasons[index]["overview"],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 7,
                                style: Theme.of(context).textTheme.bodyText1,
                              )),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(">",
                            style: Theme.of(context).textTheme.bodyText1),
                      )
                    ],
                  ),
                ),
              )),
    );
  }
}
