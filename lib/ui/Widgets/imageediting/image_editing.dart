import 'package:flutter/material.dart';
import 'package:movie_app/ui/Widgets/buttons/backbuttons/details_screen_backbutton.dart';
import 'package:movie_app/ui/Widgets/buttons/bookmark_button.dart';
import 'package:movie_app/ui/Widgets/containers/image_container.dart';
import 'package:movie_app/ui/Widgets/imageEditing/items_on_the_image.dart';

abstract class ImageEditing extends StatelessWidget {
  final _data;
  final _genres;
  Widget buildItemsOnTheImage();
  const ImageEditing(this._data, this._genres, {super.key});
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
            child: buildItemsOnTheImage(),
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
        const DetailsScreenBackButton(),
        const BookMarkButton(),
      ],
    );
  }
}

class MovieImageEditing extends ImageEditing {
  const MovieImageEditing(super.data, super.genres, {super.key});

  @override
  Widget buildItemsOnTheImage() {
    return ItemsOnTheImage(_data.title, "${_data.releaseDate} • $_genres",
        _data.voteAverage, _data.voteCount);
  }
}

class TvImageEditing extends ImageEditing {
  const TvImageEditing(super.data, super.genres, {super.key});

  @override
  Widget buildItemsOnTheImage() {
    return ItemsOnTheImage(
        _data.name,
        "${_data.firstAirDate} • $_genres • ${_data.numberOfSeasons == 0 ? "No seasons" : _data.numberOfSeasons == 1 ? "season" : "${_data.numberOfSeasons} seasons"}",
        _data.voteAverage,
        _data.voteCount);
  }
}

class CarouselImageEditing extends ImageEditing {
  const CarouselImageEditing(super.data, super.genres, {super.key});

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
  Widget buildItemsOnTheImage() {
    return ItemsOnTheImage(
        _data.title, "$_genres", _data.voteAverage, _data.voteCount);
  }
}
