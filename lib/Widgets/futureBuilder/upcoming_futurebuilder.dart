import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/loading.dart';
import 'package:movie_app/Widgets/pageView/upcoming_pageview.dart';
import '../../mixins/data.dart';

class UpcomingFutureBuilder extends StatefulWidget {
  final Future<dynamic> fetch;
  const UpcomingFutureBuilder(this.fetch, {super.key});

  @override
  State<UpcomingFutureBuilder> createState() => _UpcomingFutureBuilderState();
}

class _UpcomingFutureBuilderState extends State<UpcomingFutureBuilder>
    with AutomaticKeepAliveClientMixin,Data {
  late PageController _pageController;
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
    return FutureBuilder(
        builder: (context, snapShot) {
          if (snapShot.connectionState==ConnectionState.waiting) {
            return const Loading();
          }
          return SizedBox(
            height: 400,
            child: UpcomingPageView(_pageController,undetailedData),
          );
        },
        future: undetailedData.isEmpty
        ? widget.fetch.then((value) {
            undetailedData = value as List<dynamic>;
          })
        : null);
  }

  @override
  bool get wantKeepAlive => true;
}
