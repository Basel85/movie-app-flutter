import 'package:flutter/material.dart';
import 'package:movie_app/Classes/apiUrlSegments.dart';
import 'package:movie_app/Classes/data.dart';
import 'package:movie_app/Classes/fetcher.dart';
import 'package:movie_app/Classes/pageLoading.dart';
import 'package:movie_app/Widgets/card/castCard.dart';
import 'package:movie_app/Widgets/loading.dart';

class CastListView extends StatefulWidget with PageLoading, Data {
  final _id;
  final _type;
  CastListView(this._id, this._type);

  @override
  State<CastListView> createState() => _CastListViewState();
}

class _CastListViewState extends State<CastListView> {
  int castCount = 0; // Number of casts that have a profile image
  int countAvaliableProfileImage(casts) {
    int count = 0;
    for (var cast in casts) {
      if (cast["profile_path"] == null) {
        return count;
      }
      count++;
    }
    return count;
  }

  @override
  void initState() {
    Fetcher("${ApiUrlSegments().domain}/${widget._type}/${widget._id}/credits?api_key=${ApiUrlSegments().api_key}")
        .fetch()
        .then((Value) {
      setState(() {
        widget.dataInAList = Value["cast"];
        castCount = countAvaliableProfileImage(widget.dataInAList);
        widget.is_Loading = false;
      });
    });
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
        widget.is_Loading
            ? Loading()
            : castCount == 0
                ? Container(
                    margin: EdgeInsets.only(bottom: 24),
                    child: Text(
                      "No Details yet",
                      style: Theme.of(context).textTheme.subtitle2,
                    ))
                : Builder(builder: (context) {
                    return CastCard(castCount, widget.dataInAList);
                  })
      ],
    );
  }
}
