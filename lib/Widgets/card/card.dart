import 'package:flutter/material.dart';
import 'package:movie_app/noImage.dart';

class WorkCard extends StatelessWidget {
  final _imageUrl;
  final _title;
  final _vote_average;
  WorkCard(this._imageUrl,this._title,this._vote_average);
  @override
  Widget build(BuildContext context) {
    return Container(
       color: Colors.green,
        width: 140,
        margin: const EdgeInsets.only(left: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 210,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: _imageUrl==null?NoImage():Image.network(
                    _imageUrl,
                  )),
            ),
            Text(_title,
                style: Theme.of(context).textTheme.subtitle2,overflow: TextOverflow.ellipsis,),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "1h 37m",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Text(
                  "${_vote_average}",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            )
          ],
        ),
    );
  }
}
