import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/noimage.dart';

class ImageContainer extends StatelessWidget {
  final _imageUrl;
  const ImageContainer(this._imageUrl,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        width: double.infinity,
        decoration: _imageUrl != null
            ? BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    _imageUrl,
                  ),
                ),
              )
            : null,
        child: _imageUrl != null ? null : const NoImage());
  }
}
