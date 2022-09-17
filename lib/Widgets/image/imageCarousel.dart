import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_app/Screens/details_screen.dart';
import 'package:movie_app/Widgets/image/imageDesign.dart';
import 'package:movie_app/Widgets/loading.dart';
import 'package:movie_app/mixins/pageLoading.dart';
import 'package:movie_app/providers/undetailedData_provider.dart';
import 'package:provider/provider.dart';
import '../../mixins/Data.dart';
import '../../providers/detailedData_provider.dart';

class UpcomingData extends StatefulWidget {
  final Future<dynamic> fetch;
  UpcomingData(this.fetch);
  @override
  State<UpcomingData> createState() => _UpcomingDataState();
}

class _UpcomingDataState extends State<UpcomingData> with Data,PageLoading {

  @override
  void initState() {
    widget.fetch.then((value){
      setState(() {
        undetailedData=value;
        isLoading=false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loading()
        : CarouselSlider(
            options: CarouselOptions(
              height: 400,
              viewportFraction: 1,
            ),
            items: undetailedData.map(
              (data) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => MovieDetails(
                            DetailedMovies.fetch(data.id,"movie"))),
                  ),
                  child:
                      CarouselImageEditing(data, "Action • Drama • Adventure"),
                );
              },
            ).toList().cast<Widget>());
  }
}
