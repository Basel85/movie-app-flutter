import 'package:flutter/material.dart';
import 'package:movie_app/ui/Screens/episodes_screen.dart';
import 'package:movie_app/ui/Widgets/cards/season_card.dart';
import 'package:movie_app/data/repositories/episodes_repository.dart';


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
                  onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>EpisodesScreen(EpisodesRepository.fetch(tvId,seasons[index]["season_number"]),seasons[index]["name"]))),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: EdgeInsets.zero,
                    child: SeasonCard(seasons[index]),
                  ),
                )),
          ),
        )
      ]
    );
  }
}
