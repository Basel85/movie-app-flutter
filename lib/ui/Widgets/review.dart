import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  final _voteAverage;
  final _voteCount;
  final _voteCountString;
  const Review(this._voteAverage,this._voteCount,this._voteCountString,{super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        Text(
          "$_voteAverage",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Text(
          "(${_voteCount > 1000 ? "${_voteCountString[0]}.${_voteCountString[1]}${_voteCountString[2]}K" : _voteCount})",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
