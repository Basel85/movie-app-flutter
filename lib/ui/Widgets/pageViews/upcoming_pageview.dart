import 'package:flutter/material.dart';
import 'package:movie_app/data/repositories/detailed_data_repository.dart';
import 'package:movie_app/ui/Widgets/fetchers/details_fetcher.dart';
import '../../Screens/details_screen.dart';
import '../imageEditing/image_editing.dart';

class UpcomingPageView extends StatelessWidget {
  final _pageController;
  final undetailedData;
  const UpcomingPageView(this._pageController, this.undetailedData, {super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: _pageController,
        children: undetailedData
            .map(
              (data) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => DetailsScreen(MovieDetailsFetcher(DetailedMoviesRepository.fetch(data.id, "movie")))),
                  ),
                  child:
                      CarouselImageEditing(data, "Action • Drama • Adventure"),
                );
              },
            )
            .toList()
            .cast<Widget>());
  }
}
