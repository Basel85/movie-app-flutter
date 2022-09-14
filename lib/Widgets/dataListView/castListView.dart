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

  @override
  void initState() {
    Provider.of<Casts>(context,listen : false).fetch(widget._id,widget._type).then((casts){
      is_Loading = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> casts = Provider.of<Casts>(context).casts;
    return Container(
      margin: const EdgeInsets.only(left: 24,top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cast",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          const SizedBox(
            height: 16,
          ),
          is_Loading
              ? Loading()
              : casts.isEmpty
                  ? Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        "No Details yet",
                        style: Theme.of(context).textTheme.subtitle2,
                      ))
                  : Builder(builder: (context) {
                      return CastCard(casts.length, casts);
                    })
        ],
      ),
    );
  }
}
