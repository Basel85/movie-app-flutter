import 'package:flutter/material.dart';
class WorkCard extends StatelessWidget {
  final _imageUrl;
  final _title;
  final _vote_average;
  final dataDetails;
  WorkCard(this._imageUrl,this._title,this._vote_average,this.dataDetails);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => dataDetails)),
      child: Container(
        width: 150,
        margin: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  _imageUrl,
                )),
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
      ),
    );
  }
}
