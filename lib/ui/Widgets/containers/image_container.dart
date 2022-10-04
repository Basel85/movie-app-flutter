import 'package:flutter/material.dart';
import 'package:movie_app/ui/Widgets/loading.dart';
import 'package:movie_app/ui/Widgets/noimage.dart';

class ImageContainer extends StatelessWidget {
  final _imageUrl;
  const ImageContainer(this._imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        height: 400,
        child: _imageUrl != null
            ?Image.network(
                  _imageUrl,
                  fit: BoxFit.cover,
                  width: size.width,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const Loading();
                  },
                )
            : const NoImage());
  }
}
