import 'package:flutter/material.dart';
import 'package:movie_app/ui/Widgets/loading.dart';
import 'package:movie_app/ui/Widgets/pageViews/upcoming_pageview.dart';
import 'package:movie_app/ui/Widgets/error_message.dart';
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
    return FutureBuilder(builder: (context, snapShot) {
      if (snapShot.connectionState == ConnectionState.waiting) {
        return const Loading();
      }
      if (snapShot.hasError) {
        return ErrorMessage(snapShot.error.toString());
      }
      return SizedBox(
        height: 400,
        child: UpcomingPageView(_pageController, undetailedData),
      );
    }, future: widget.fetch.then((data) {
      undetailedData = data as List<dynamic>;
    }));
  }

  @override
  bool get wantKeepAlive => true;
}
