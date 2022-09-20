import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/loading.dart';
import 'package:movie_app/providers/searchMovies_provider.dart';
import 'package:provider/provider.dart';

import '../Widgets/dataGridView/dataGridView.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with AutomaticKeepAliveClientMixin{
  late TextEditingController _textEditingController;

  @override
  void initState() {
    print("HIss");
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    print("LOLOLO");
    _textEditingController.clear();
    super.dispose();
  }
  String prev = "";
  @override
  Widget build(BuildContext context) {
    // print(prev);
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
                if(value.trim()!=prev.trim()){
                  prev = value;
                  print(prev);
                  Provider.of<MoviesSearch>(context,listen: false).reset(value.trim());
                }
              },
            ),
            Selector<MoviesSearch,String>(
              selector: (context,ms)=>ms.name,
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
                        : FutureBuilder(
                            future: Provider.of<MoviesSearch>(context,
                                    listen: false)
                                .fetch("movie"),
                            builder: (context, snapShot) {
                              if (snapShot.connectionState == ConnectionState.waiting) {
                                return Loading();
                              }
                              return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox(height: 24,),
                                    Expanded(child: DataGridView(snapShot.data))
                                  ] );
                            }));
              },
            )
          ],
        ),
      )),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
