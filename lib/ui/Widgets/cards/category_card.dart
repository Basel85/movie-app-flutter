import 'package:flutter/material.dart';
import 'package:movie_app/ui/Widgets/image_network.dart';
import 'package:movie_app/ui/Widgets/noimage.dart';

class CategoryCard extends StatelessWidget {
  final _imageUrl;
  final _title;
  final _voteAverage;
  const CategoryCard(this._imageUrl, this._title, this._voteAverage,
      {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 209,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: _imageUrl == null
                  ? const NoImage()
                  : ImageNetwork(_imageUrl)),
        ),
        Text(
          _title,
          style: Theme.of(context).textTheme.subtitle2,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                "1h 37m",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            const Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            Text(
              "$_voteAverage",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        )
      ],
    );
  }
}
