import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_app/Screens/Details.dart';
import 'package:movie_app/Widgets/image/imageDesign.dart';
import 'package:movie_app/Widgets/loading.dart';
import 'package:movie_app/data/models/detailedMovie.dart';
import 'package:movie_app/data/models/undetailedMovie.dart';
import 'package:movie_app/providers/undetailedData_provider.dart';
import 'package:provider/provider.dart';

class UpcomingData extends StatefulWidget {
  final type;
  final providerWithNoListening;
  final providerWithListening;
  UpcomingData(this.type, this.providerWithNoListening,this.providerWithListening);
  @override
  State<UpcomingData> createState() => _UpcomingDataState();
}

class _UpcomingDataState extends State<UpcomingData> {
  @override
  void initState() {
    widget.providerWithNoListening.fetch(widget.type,"upcoming");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.providerWithListening.is_Loading
        ? Loading()
        : CarouselSlider(
            options: CarouselOptions(
              height: 400,
              viewportFraction: 1,
            ),
            items: widget.providerWithListening.dataList.map(
              (data) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => MovieDetails(
                            Provider.of<DetailedMovies>(context, listen: false),
                            Provider.of<DetailedMovies>(context),
                            data.id)),
                  ),
                  child:
                      CarouselImageEditing(data, "Action • Drama • Adventure"),
                );
              },
            ).toList().cast<Widget>());
  }
}
