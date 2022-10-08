import 'package:flutter/material.dart';
import 'package:movie_app/ui/Screens/episodes_screen.dart';
import 'package:movie_app/ui/Widgets/cards/season_card.dart';
import 'package:movie_app/data/repositories/episodes_repository.dart';


class SeasonListView extends StatelessWidget {
  final _tvId;
  final _seasons;
  const SeasonListView(this._tvId,this._seasons, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
                _seasons.length,
                    (index) => GestureDetector(
                  onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>EpisodesScreen(EpisodesRepository.fetch(_tvId,_seasons[index]["season_number"]),_seasons[index]["name"]))),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: EdgeInsets.zero,
                    child: SeasonCard(_seasons[index]),
                  ),
                )),
          );
  }
}
