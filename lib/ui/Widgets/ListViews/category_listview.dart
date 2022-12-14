import 'package:flutter/material.dart';
import 'package:movie_app/data/repositories/detailed_data_repository.dart';
import 'package:movie_app/ui/Screens/details_screen.dart';
import 'package:movie_app/ui/Widgets/fetchers/details_fetcher.dart';
import '../cards/category_card.dart';

abstract class CategoryListView extends StatelessWidget {
  final _data;
  const CategoryListView(this._data,{super.key});
  Widget buildCard(data, context);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int index) =>buildCard(_data[index], context));
  }
}
class MoviesCategoryListView extends CategoryListView {
  const MoviesCategoryListView(super.data, {super.key});

  @override
  Widget buildCard(data, context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              DetailsScreen(MovieDetailsFetcher(DetailedMoviesRepository.fetch(data.id, "movie"))))),
      child: Container(
        width: 140,
        height: 259,
        margin: const EdgeInsets.only(right: 24),
        child: CategoryCard(
          data.image,
          data.title,
          data.voteAverage,
        ),
      ),
    );
  }
}

class TvsCategoryListView extends CategoryListView {
  const TvsCategoryListView(super.data, {super.key});
  @override
  Widget buildCard(data, context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailsScreen(TVDetailsFetcher(DetailedTvsRepository.fetch(data.id, "tv"))))),
      child: Container(
        width: 140,
        height: 259,
        margin: const EdgeInsets.only(right: 24),
        child: CategoryCard(
          data.image,
          data.name,
          data.voteAverage,
        ),
      ),
    );
  }
}
