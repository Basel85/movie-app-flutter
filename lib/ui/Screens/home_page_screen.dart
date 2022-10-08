import 'package:flutter/material.dart';
import 'package:movie_app/ui/Widgets/ListViews/homepage_listview.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/providers/theme_mode_provider.dart';
import 'package:movie_app/statics/theme_mode_static.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    print("homePage built");
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
      body:  const SafeArea(
        child: HomePageListView()
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
}
