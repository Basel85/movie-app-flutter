import 'package:flutter/material.dart';
import 'package:movie_app/ui/Widgets/builders/search_data_builder.dart';
import 'package:movie_app/ui/Widgets/loading.dart';
import 'package:movie_app/providers/movies_search_provider.dart';
import 'package:movie_app/ui/Widgets/reload.dart';
import 'package:movie_app/ui/Widgets/welcome_search_screen_widget.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    print("Hello");
    super.initState();
  }

  String prev = "";
  List<dynamic> searchData = [];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print("search built");
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search for movies",
                  hintStyle: Theme.of(context).textTheme.bodyText1,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).textTheme.bodyText1!.color ??
                            Colors.white),
                    borderRadius: BorderRadius.circular(8),
                  )),
              onChanged: (value) {
                if (value.trim() != prev.trim()) {
                  Provider.of<MoviesSearch>(context, listen: false)
                      .reset(value.trim());
                }
              },
            ),
            Selector<MoviesSearch, String>(
              selector: (context, ms) => ms.name,
              builder: (context, name, _) {
                return Expanded(
                    child: name.isEmpty
                        ? const WelcomeSearchScreen()
                        : prev != name
                            ? FutureBuilder(
                                future: Provider.of<MoviesSearch>(context,
                                        listen: false)
                                    .fetch("movie"),
                                builder: (context, snapShot) {
                                  if (snapShot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Loading();
                                  }
                                  if (snapShot.hasError) {
                                    return Reload(snapShot.error.toString());
                                  }
                                  searchData = snapShot.data as List<dynamic>;
                                  prev = name;
                                  return SearchDataBuilder(snapShot.data);
                                })
                            : SearchDataBuilder(searchData));
              },
            )
          ],
        ),
      )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
