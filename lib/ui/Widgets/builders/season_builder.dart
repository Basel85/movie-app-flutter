import 'package:flutter/material.dart';
import 'package:movie_app/ui/Widgets/ListViews/season_listview.dart';
class SeasonBuilder extends StatelessWidget {
  final _tvId;
  final _seasons;
  const SeasonBuilder(this._tvId,this._seasons,{super.key});

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
          child: SeasonListView(_tvId, _seasons),
        ),
      ]
    );
  }
}