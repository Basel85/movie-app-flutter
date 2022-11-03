import 'package:flutter/material.dart';
import 'package:movie_app/ui/Widgets/GridViews/search_data_gridview.dart';
import 'package:movie_app/ui/Widgets/no_results.dart';

class SearchDataBuilder extends StatelessWidget {
  final _data;
  const SearchDataBuilder(this._data,{super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 24,
          ),
          Expanded(
              child: _data.isEmpty
                  ? const NoResults()
                  : SearchDataGridView(_data))
        ]);
  }
}
