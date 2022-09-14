import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_app/Screens/details_screen.dart';
import 'package:movie_app/Widgets/image/imageDesign.dart';
import 'package:movie_app/Widgets/loading.dart';
import 'package:movie_app/mixins/pageLoading.dart';
import 'package:provider/provider.dart';
import '../../mixins/Data.dart';
import '../../providers/detailedData_provider.dart';

class UpcomingData extends StatefulWidget with Data {
  final type;
  final providerWithNoListening;
  final providerWithListening;
  UpcomingData(this.type, this.providerWithNoListening,this.providerWithListening);
  @override
  State<UpcomingData> createState() => _UpcomingDataState();
}

class _UpcomingDataState extends State<UpcomingData> with PageLoading {

  @override
  void initState() {
    widget.providerWithNoListening.fetch(widget.type,"upcoming").then((_)=>is_Loading=false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.undetailedData = widget.providerWithListening.dataList;
    return is_Loading
        ? Loading()
        : CarouselSlider(
            options: CarouselOptions(
              height: 400,
              viewportFraction: 1,
            ),
            items: widget.undetailedData.map(
              (data) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => MovieDetails(
                            Provider.of<DetailedMovies>,
                            data.id,"movie")),
                  ),
                  child:
                      CarouselImageEditing(data, "Action • Drama • Adventure"),
                );
              },
            ).toList().cast<Widget>());
  }
}
