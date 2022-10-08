import 'package:flutter/material.dart';
import 'package:movie_app/ui/Widgets/loading.dart';
import 'package:movie_app/ui/Widgets/noimage.dart';

class ImageNetwork extends StatelessWidget {
  final _imageUrl;
  const ImageNetwork(this._imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Image.network(
      _imageUrl,
      fit: BoxFit.cover,
      width: size.width,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return const Loading();
      },
      errorBuilder: (context, error, stackTrace) => const NoImage(),
    );
  }
}
