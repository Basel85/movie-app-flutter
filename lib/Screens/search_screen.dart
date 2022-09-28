import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/loading.dart';
import 'package:movie_app/Widgets/noData.dart';
import 'package:movie_app/providers/searchMovies_provider.dart';
import 'package:provider/provider.dart';
import '../Widgets/GridView/category_gridview.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with AutomaticKeepAliveClientMixin {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }
  
  @override
  void dispose() {
    _textEditingController.clear();
    super.dispose();
  }
  
  String prev = "";
  List<dynamic> searchData = [];
  
  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.search,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 64,
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  "Welcome to search movies screen",
                                  style: Theme.of(context).textTheme.headline2,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )
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
                                  searchData = snapShot.data as List<dynamic>;
                                  prev = name;
                                  return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 24,
                                        ),
                                        Expanded(
                                            child: searchData.isEmpty?const NoDetails():DataGridView(snapShot.data))
                                      ]);
                                })
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    Expanded(child: searchData.isEmpty?const NoDetails():DataGridView(searchData))
                                  ]));
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
