import 'package:flutter/material.dart';
import 'package:movie_app/search_delegate.dart';
import 'package:movie_app/ui/Widgets/ListViews/homepage_listview.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/providers/theme_mode_provider.dart';
import 'package:movie_app/statics/theme_mode_static.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
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
          IconButton(
              onPressed: () {
                showSearch(
                    context: context, delegate: MySearchDelegate(context));
              },
              icon: const Icon(
                Icons.search,
                color: Colors.grey,
              ))
        ],
      ),
      body: const SafeArea(child: HomePageListView()),
    );
  }
}
