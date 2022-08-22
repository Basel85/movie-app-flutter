import 'package:flutter/material.dart';
import 'package:movie_app/Classes/apiUrlSegments.dart';
import 'package:movie_app/Classes/data.dart';
import 'package:movie_app/Classes/fetcher.dart';
import 'package:movie_app/Classes/pageLoading.dart';
import 'package:movie_app/Widgets/castDisplaying.dart';
import 'package:movie_app/Widgets/dataCategory.dart';
import 'package:movie_app/Widgets/dataDisplaying.dart';
import 'package:movie_app/Widgets/infoInsideImage.dart';
import 'package:movie_app/Widgets/loading.dart';
abstract class Details extends StatefulWidget with PageLoading,Data {
   final _id;
   final _imageUrl;
   final _type;
   List<String> Categories=[];
   Details(this._id,this._imageUrl,this._type);
   Widget buildInfoInsideImage(data);
   Widget buildSimilarDisplaying();
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  void initState() {
    Fetcher("${ApiUrlSegments().domain}/${widget._type}/${widget._id}?api_key=${ApiUrlSegments().api_key}").fetch().then((Value){
      setState(() {
        widget.dataInAMap=Value;
        for(var category in widget.dataInAMap["genres"]){
          widget.Categories.add(category["name"]);
        }
        widget.is_Loading=false;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.is_Loading?Loading():ListView(
        children: [
          Container(
            height: 400,
            child: Stack(
              children: [
                Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage("${widget._imageUrl}",),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0,1),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Theme.of(context).colorScheme.background
                        ],
                        stops: [0, 1],
                        begin: AlignmentDirectional(0, -1),
                        end: AlignmentDirectional(0, 1),
                      ),
                    ),
                    child: widget.buildInfoInsideImage(widget.dataInAMap),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: ()=>Navigator.of(context).pop(),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      margin: EdgeInsets.all(8),
                      child: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,size: 20,),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: null,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      margin: EdgeInsets.all(8),
                      child: Icon(Icons.bookmark_border,color: Colors.white,size: 25,),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 8,top: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Story",style: Theme.of(context).textTheme.subtitle2,),
                  SizedBox(height: 8,),
                  Text(widget.dataInAMap["overview"],style: Theme.of(context).textTheme.bodyText1,),
                  SizedBox(height: 24,),
                  Text("Cast",style: Theme.of(context).textTheme.subtitle2,),
                  SizedBox(height: 8,),
                  CastDisplaying(widget._id,widget._type)
                ],
              ),
            ),
          widget.buildSimilarDisplaying()
        ],
      ),
    );
  }
}
class MovieDetails extends Details{
  MovieDetails(super.id, super.imageUrl, super.type);
  @override
  Widget buildInfoInsideImage(data) {
    return InfoInsideImage(data["original_title"],"${data["release_date"]} • $Categories",data["vote_average"],data["vote_count"]);
  }

  @override
  Widget buildSimilarDisplaying() {
    return DataCategory("Similar",new MoviesDisplaying("${ApiUrlSegments().domain}/movie/${_id}/similar?api_key=${ApiUrlSegments().api_key}"));
  }

}
class TVDetails extends Details{
  TVDetails(super.id, super.imageUrl, super.type);
  @override
  Widget buildInfoInsideImage(data) {
    return InfoInsideImage(data["original_name"],"${data["first_air_date"]} • $Categories",data["vote_average"],data["vote_count"]);
  }

  @override
  Widget buildSimilarDisplaying() {
    return DataCategory("Similar",new TvsDisplaying("${ApiUrlSegments().domain}/tv/${_id}/similar?api_key=${ApiUrlSegments().api_key}"));
  }
}
