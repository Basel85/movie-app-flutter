import 'package:flutter/material.dart';
import '../../Screens/details_screen.dart';
import '../../providers/detailedData_provider.dart';
import '../image/imageDesign.dart';

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
                        builder: (_) => MovieDetails(
                            DetailedMovies.fetch(data.id, "movie"))),
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
