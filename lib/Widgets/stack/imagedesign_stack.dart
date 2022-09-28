import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/align/backbutton_align.dart';
import 'package:movie_app/Widgets/align/bookmark_align.dart';
import 'package:movie_app/Widgets/container/image_container.dart';
import 'package:movie_app/Widgets/column/infoinsideimage_column.dart';

abstract class ImageEditingStack extends StatelessWidget {
  final _data;
  final _genres;
  Widget buildInfoOnTheImage();
  const ImageEditingStack(this._data, this._genres, {super.key});
  Widget linearGradientCreation(context) {
    return Stack(
      children: [
        Align(
          alignment: const AlignmentDirectional(0, 1),
          child: Container(
            width: double.infinity,
            height: 200,
            padding:
                const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Theme.of(context).colorScheme.background
                ],
                stops: const [0, 1],
                begin: const AlignmentDirectional(0, -1),
                end: const AlignmentDirectional(0, 1),
              ),
            ),
            child: buildInfoOnTheImage(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageContainer(_data.image),
        linearGradientCreation(context),
        const BackButtonAlign(),
        const BookMarkAlign(),
      ],
    );
  }
}

class MovieImageEditingStack extends ImageEditingStack {
  const MovieImageEditingStack(super.data, super.genres, {super.key});

  @override
  Widget buildInfoOnTheImage() {
    return InfoInsideImageColumn(_data.title, "${_data.releaseDate} • $_genres",
        _data.voteAverage, _data.voteCount);
  }
}

class TvImageEditingStack extends ImageEditingStack {
  const TvImageEditingStack(super.data, super.genres, {super.key});

  @override
  Widget buildInfoOnTheImage() {
    return InfoInsideImageColumn(
        _data.name,
        "${_data.firstAirDate} • $_genres • ${_data.seasons.length} ${_data.seasons.length == 1 ? "season" : "seasons"}",
        _data.voteAverage,
        _data.voteCount);
  }
}

class CarouselImageEditingStack extends ImageEditingStack {
  const CarouselImageEditingStack(super.data, super.genres, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageContainer(_data.image),
        linearGradientCreation(context),
      ],
    );
  }

  @override
  Widget buildInfoOnTheImage() {
    return InfoInsideImageColumn(
        _data.title, "$_genres", _data.voteAverage, _data.voteCount);
  }
}
