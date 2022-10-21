import 'package:flutter/material.dart';
import 'package:movie_app/ui/Widgets/image_network.dart';
import 'package:movie_app/ui/Widgets/noimage.dart';

class ImageContainer extends StatelessWidget {
  final _imageUrl;
  const ImageContainer(this._imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 400,
        child: _imageUrl != null
            ?ImageNetwork(_imageUrl)
            : const NoImage());
  }
}
