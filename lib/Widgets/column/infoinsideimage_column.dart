import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/CircularAvatar/playbutton_circularavatar.dart';
import 'package:movie_app/Widgets/row/review_row.dart';
class InfoInsideImageColumn extends StatelessWidget {
  final _title;
  final _categories;
  final _voteAverage;
  final _voteCount;
  const InfoInsideImageColumn(this._title,this._categories,this._voteAverage,this._voteCount, {super.key});
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
            const PlayButtonCicularAvatar(),
          ],
        ),
        ReviewRow(_voteAverage, _voteCount, voteCountString)
      ],
    );
  }
}
