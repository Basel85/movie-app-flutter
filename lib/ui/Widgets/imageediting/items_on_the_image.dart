import 'package:flutter/material.dart';
import 'package:movie_app/ui/Widgets/buttons/play_button.dart';
import 'package:movie_app/ui/Widgets/review.dart';
class ItemsOnTheImage extends StatelessWidget {
  final _title;
  final _categories;
  final _voteAverage;
  final _voteCount;
  const ItemsOnTheImage(this._title,this._categories,this._voteAverage,this._voteCount, {super.key});
  @override
  Widget build(BuildContext context) {
    String voteCountString = _voteCount.toString();
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
         _title,
          style: Theme.of(context).textTheme.headline2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                _categories,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            const PlayButton(),
          ],
        ),
        Review(_voteAverage, _voteCount, voteCountString)
      ],
    );
  }
}
