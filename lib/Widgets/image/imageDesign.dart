import 'package:flutter/material.dart';
import 'package:movie_app/Classes/imageUrlSegments.dart';
import 'package:movie_app/Widgets/image/infoInsideImage.dart';

abstract class ImageEditing extends StatelessWidget {
  final _data;
  final _Categories;
  Widget buildInfoInsideImage();
  Widget buildImageDesign(context) {
    return Stack(
      children: [
        Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.red,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                ImageUrlSegments().domain + _data["poster_path"],
              ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0, 1),
          child: Container(
            width: double.infinity,
            height: 200,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Theme.of(context).colorScheme.background
                ],
                stops: [0, 1],
                begin: AlignmentDirectional(0, -1),
                end: AlignmentDirectional(0, 1),
              ),
            ),
            child: buildInfoInsideImage(),
          ),
        ),
      ],
    );
  }
  ImageEditing(this._data, this._Categories);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildImageDesign(context),
        Align(
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              margin: const EdgeInsets.all(8),
              child: const Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: null,
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              margin: const EdgeInsets.all(8),
              child: const Icon(
                Icons.bookmark_border,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MovieImageEditing extends ImageEditing {
  MovieImageEditing(super.data, super.Categories);
  @override
  Widget buildInfoInsideImage() {
    return InfoInsideImage(
        _data["original_title"],
        "${_data["release_date"]} • $_Categories",
        _data["vote_average"],
        _data["vote_count"]);
  }
}

class TvImageEditing extends ImageEditing {
  TvImageEditing(super.data, super.Categories);

  @override
  Widget buildInfoInsideImage() {
    return InfoInsideImage(
        _data["original_name"],
        "${_data["first_air_date"]} • $_Categories • ${_data["number_of_seasons"]} ${_data["number_of_seasons"] == 1 ? "season" : "seasons"}",
        _data["vote_average"],
        _data["vote_count"]);
  }
}

class CarouselImageEditing extends ImageEditing{
  CarouselImageEditing(super.data, super.Categories);

  @override
  Widget build(BuildContext context) {
    return super.buildImageDesign(context);
  }
  
  @override
  Widget buildInfoInsideImage() {
    return InfoInsideImage(
        _data["original_title"],
        "$_Categories",
        _data["vote_average"],
        _data["vote_count"]);
  }
}
