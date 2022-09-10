import 'package:flutter/material.dart';
import 'package:movie_app/mixins/pageLoading.dart';
import 'package:movie_app/Widgets/card/castCard.dart';
import 'package:movie_app/Widgets/loading.dart';
import 'package:provider/provider.dart';

import '../../data/models/cast.dart';

class CastListView extends StatefulWidget with PageLoading {
  final _id;
  final _type;
  CastListView(this._id, this._type);

  @override
  State<CastListView> createState() => _CastListViewState();
}

class _CastListViewState extends State<CastListView> {

  @override
  void initState() {
    Provider.of<Casts>(context,listen : false).fetch(widget._id,widget._type);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Cast",
          style: Theme.of(context).textTheme.subtitle2,
        ),
        SizedBox(
          height: 8,
        ),
        Provider.of<Casts>(context).is_Loading
            ? Loading()
            : Provider.of<Casts>(context).castCount == 0
                ? Container(
                    margin: EdgeInsets.only(bottom: 24),
                    child: Text(
                      "No Details yet",
                      style: Theme.of(context).textTheme.subtitle2,
                    ))
                : Builder(builder: (context) {
                    return CastCard(Provider.of<Casts>(context,listen: false).castCount, Provider.of<Casts>(context,listen: false).casts);
                  })
      ],
    );
  }
}
