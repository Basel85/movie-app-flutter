import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/loading.dart';
import 'package:movie_app/mixins/pageLoading.dart';
import 'package:movie_app/providers/episodes_provider.dart';
import 'package:provider/provider.dart';

import '../mixins/Data.dart';

class EpisodesList extends StatefulWidget with Data {
  final tvId;
  final seasonNumber;
  final seasonName;
  EpisodesList(this.tvId,this.seasonNumber,this.seasonName);

  @override
  State<EpisodesList> createState() => _EpisodesListState();
}

class _EpisodesListState extends State<EpisodesList> with PageLoading {
  @override
  void initState() {
    Provider.of<Episodes>(context,listen : false).fetch(widget.tvId,widget.seasonNumber).then((_) => is_Loading = false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    widget.undetailedData = Provider.of<Episodes>(context).episodes;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title : Text(widget.seasonName,style: Theme.of(context).textTheme.headline2,),
        leading: Container(height: 60,width: 60 ,decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),child:Center(child: IconButton(onPressed: () => Navigator.of(context).pop(),icon: Icon(Icons.arrow_back_ios_new_outlined,color: Theme.of(context).textTheme.subtitle2!.color,size: 30,)))),
      ),
      body: is_Loading?Loading():Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
        child: ListView.builder(
            itemCount: widget.undetailedData.length,
            itemBuilder: (context,index)=>Container(
              margin: const EdgeInsets.only(bottom: 24),
              height: 80,
              child: Row(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,children: [
                Container(
                  width: 140,
                  height: 80,
                  child: Stack(
                      children:[
                        Container(width: double.maxFinite,height: double.maxFinite,color: Colors.grey,child: widget.undetailedData[index].image==null?null:Image.network(widget.undetailedData[index].image,),),
                        Container(color: Colors.black.withOpacity(0.5),height: double.maxFinite,width: double.maxFinite,),
                        const Align(alignment: Alignment.center,child: Icon(Icons.play_arrow,color: Colors.red,),)
                      ]
                  ),
                ),
                const SizedBox(width: 8,),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,children: [
                    Text(widget.undetailedData[index].name),
                    const SizedBox(height: 2,),
                    Text(widget.undetailedData[index].airDate),
                  ],),
                ),
              ],),
            ),
        ),
      ),
    );
  }
}
