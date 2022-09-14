import 'package:flutter/material.dart';
import 'package:movie_app/mixins/pageLoading.dart';
import 'package:movie_app/Widgets/card/castCard.dart';
import 'package:movie_app/Widgets/loading.dart';
import 'package:provider/provider.dart';
import '../../providers/casts_provider.dart';

class CastListView extends StatefulWidget with PageLoading {
  final _id;
  final _type;
  CastListView(this._id, this._type);

  @override
  State<CastListView> createState() => _CastListViewState();
}

class _CastListViewState extends State<CastListView> with PageLoading {
  int castCount = 0;

  int countAvaliableProfileImage(casts) {
    int count = 0;
    for (var cast in casts) {
      if (cast.profileImage == null) {
        return count;
      }
      count++;
    }
    return count;
  }

  @override
  void initState() {
    Provider.of<Casts>(context,listen : false).fetch(widget._id,widget._type).then((casts){
      is_Loading = false;
      castCount = countAvaliableProfileImage(casts);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> casts = Provider.of<Casts>(context).casts;
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
        is_Loading
            ? Loading()
            : castCount == 0
                ? Container(
                    margin: EdgeInsets.only(bottom: 24),
                    child: Text(
                      "No Details yet",
                      style: Theme.of(context).textTheme.subtitle2,
                    ))
                : Builder(builder: (context) {
                    return CastCard(castCount, casts);
                  })
      ],
    );
  }
}
