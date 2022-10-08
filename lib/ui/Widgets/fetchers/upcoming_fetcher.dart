import 'package:flutter/material.dart';
import 'package:movie_app/statics/theme_mode_static.dart';
import 'package:movie_app/ui/Widgets/loading.dart';
import 'package:movie_app/ui/Widgets/pageViews/upcoming_pageview.dart';
import 'package:movie_app/ui/Widgets/reload.dart';
import '../../../mixins/data.dart';

class UpcomingFetcher extends StatefulWidget {
  final Future<dynamic> fetch;
  const UpcomingFetcher(this.fetch, {super.key});

  @override
  State<UpcomingFetcher> createState() => _UpcomingFetcherState();
}

class _UpcomingFetcherState extends State<UpcomingFetcher>
    with AutomaticKeepAliveClientMixin, Data {
  late PageController _pageController;
  bool currentMode = false;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print("upcoming rebuilt");
    print(currentMode);
    return FutureBuilder(
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            currentMode = ThemeModeStatic.value;
            return const Loading();
          }
          if (snapShot.hasError) {
            currentMode = ThemeModeStatic.value;
            return Reload(snapShot.error.toString());
          }
          currentMode = ThemeModeStatic.value;
          return SizedBox(
            height: 400,
            child: UpcomingPageView(_pageController, undetailedData),
          );
        },
        future:  widget.fetch.then((value) {
                undetailedData = value as List<dynamic>;
              })
            );
  }

  @override
  bool get wantKeepAlive => true;
}
