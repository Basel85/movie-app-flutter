import 'package:flutter/material.dart';
import 'package:movie_app/Classes/imageUrlSegments.dart';

class CastCard extends StatelessWidget {
  final _castCount;
  final _data;

  const CastCard(this._castCount,this._data);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _castCount,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 24, top: 8),
            width: 100,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(ImageUrlSegments().domain +
                        _data[index]["profile_path"])),
                Text(_data[index]["original_name"],
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