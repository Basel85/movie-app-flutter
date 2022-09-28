import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/futureBuilder/category_futurebuilder.dart';
import 'package:movie_app/Widgets/futureBuilder/upcoming_futurebuilder.dart';
import 'package:movie_app/Widgets/categorysection.dart';
import 'package:provider/provider.dart';
import '../providers/light&darkModeTheme_provider.dart';
import '../providers/undetailedData_provider.dart';
import '../statics/static.dart';



class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        title: Text("Movie App", style: Theme.of(context).textTheme.subtitle2),
        actions: [
          Switch.adaptive(
            onChanged: (_) {
              Provider.of<Mode>(context, listen: false).changeMode();
            },
            value: ThemeModeStatic.value,
          ),
         ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            UpcomingFutureBuilder(UnDetailedMovies.fetch("movie", "upcoming", null)),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              DataSection(
                  "Now Playing",
                  MoviesCategoryFutureBuilder(
                      UnDetailedMovies.fetch("movie", "now_playing", null))),
              DataSection("On TV",
                  TvsCategoryFutureBuilder(UnDetailedTvs.fetch("tv", "popular", null))),
              DataSection(
                  "Popular Movies",
                  MoviesCategoryFutureBuilder(
                      UnDetailedMovies.fetch("movie", "popular", null))),
            ])
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
