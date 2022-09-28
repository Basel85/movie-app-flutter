import 'package:flutter/material.dart';
import 'package:movie_app/Screens/details_screen.dart';
import 'package:movie_app/Widgets/card/category_card.dart';

import '../../providers/detailedData_provider.dart';

class DataGridView extends StatelessWidget {
  final _data;

  const DataGridView(this._data, {super.key});

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
                    MaterialPageRoute(builder: (_) => MovieDetails(
                        DetailedMovies.fetch(_data[index].id,"movie")))),
              )),
    );
  }
}
