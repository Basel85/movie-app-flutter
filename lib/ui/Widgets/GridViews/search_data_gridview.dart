import 'package:flutter/material.dart';
import 'package:movie_app/data/repositories/detailed_data_repository.dart';
import 'package:movie_app/ui/Screens/details_screen.dart';
import 'package:movie_app/ui/Widgets/cards/category_card.dart';
import 'package:movie_app/ui/Widgets/fetchers/details_fetcher.dart';


class SearchDataGridView extends StatelessWidget {
  final _data;

  const SearchDataGridView(this._data, {super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate:  const SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisSpacing: 16,
        crossAxisSpacing: 24,
        maxCrossAxisExtent: 150,
        childAspectRatio: 0.51
      ),
      primary: true,
      children: List.generate(
          _data.length,
          (index) => GestureDetector(
                child: CategoryCard(_data[index].image, _data[index].title,
                    _data[index].voteAverage),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => DetailsScreen(
                        MovieDetailsFetcher(DetailedMoviesRepository.fetch(_data[index].id,"movie"))))),
              )),
    );
  }
}
