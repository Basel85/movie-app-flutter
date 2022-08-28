import 'package:flutter/material.dart';
class InfoInsideImage extends StatelessWidget {
  final _title;
  final _Categories;
  final _vote_average;
  final _vote_count;
  InfoInsideImage(this._title,this._Categories,this._vote_average,this._vote_count);
  @override
  Widget build(BuildContext context) {
    String voteCount = _vote_count.toString();
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
                _Categories,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Container(
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                radius: 20,
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            Text(
              "${_vote_average}",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              "(${_vote_count > 1000 ? voteCount[0] + "." + voteCount[1] + voteCount[2] + "K" : _vote_count})",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        )
      ],
    );
  }
}
