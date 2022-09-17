import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import '../../noImage.dart';

class CastCard extends StatelessWidget {
  final _castCount;
  final _data;

  const CastCard(this._castCount,this._data);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.only(bottom: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _castCount,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 24),
            width: 140,
            padding: EdgeInsets.zero,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 210,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: _data[index].profileImage==null?NoImage():Image.network(imageDomain +
                          _data[index].profileImage)),
                ),
                Text(_data[index].originalName,
                    style: Theme.of(context).textTheme.subtitle2,
                    textAlign: TextAlign.center)
              ],
            ),
          );
        },
      ),
    );
  }
}
