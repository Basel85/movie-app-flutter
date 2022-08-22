import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/Classes/apiUrlSegments.dart';
import 'package:movie_app/Classes/data.dart';
import 'package:movie_app/Classes/fetcher.dart';
import 'package:movie_app/Classes/imageUrlSegments.dart';
import 'package:movie_app/Classes/pageLoading.dart';
import 'package:movie_app/Widgets/loading.dart';
import 'dart:convert';
class CastDisplaying extends StatefulWidget with PageLoading,Data {
  final _id;
  final _type;
  CastDisplaying(this._id,this._type);

  @override
  State<CastDisplaying> createState() => _CastDisplayingState();
}

class _CastDisplayingState extends State<CastDisplaying> {
  int castCount=0; // Number of casts that have a profile image
  int countAvaliableProfileImage(casts){
    int count=0;
    for(var cast in casts){
      if(cast["profile_path"]==null){
        return count;
      }
      count++;
    }
    return count;
  }
  @override
  void initState() {
    Fetcher("${ApiUrlSegments().domain}/${widget._type}/${widget._id}/credits?api_key=${ApiUrlSegments().api_key}").fetch().then((Value) {
      setState(() {
        widget.dataInAList=Value["cast"];
        castCount=countAvaliableProfileImage(widget.dataInAList);
        widget.is_Loading=false;
      });
    } );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return widget.is_Loading?Loading():castCount==0?Container(margin: EdgeInsets.only(bottom: 24),child: Text("No Details yet",style: Theme.of(context).textTheme.subtitle2,)):Builder(
      builder: (context) {
        return Container(
         height: 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: castCount,
            itemBuilder: (context,index) {
              return Container(
              margin: EdgeInsets.only(right: 24,top: 8),
              width: 100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.network(ImageUrlSegments().domain+widget.dataInAList[index]["profile_path"])),
                  Text(widget.dataInAList[index]["original_name"],style: Theme.of(context).textTheme.subtitle2,textAlign: TextAlign.center)
                ],
              ),
            );
            },
          ),
        );
      }
    );
  }
}
