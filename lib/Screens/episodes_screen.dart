import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/loading.dart';
import 'package:movie_app/mixins/pageLoading.dart';
import 'package:movie_app/providers/episodes_provider.dart';
import '../mixins/Data.dart';

class EpisodesList extends StatefulWidget {
  final Future<dynamic> fetch;
  final seasonName;
  EpisodesList(this.fetch,this.seasonName);

  @override
  State<EpisodesList> createState() => _EpisodesListState();
}

class _EpisodesListState extends State<EpisodesList> with PageLoading,Data {
  @override
  void initState() {
    widget.fetch.then((value){
      setState(() {
        isLoading = false;
        undetailedData = value;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
      body: isLoading?Loading():Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
        child: ListView.builder(
            itemCount: undetailedData.length,
            itemBuilder: (context,index)=>Container(
              margin: const EdgeInsets.only(bottom: 24),
              height: 80,
              child: Row(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,children: [
                Container(
                  width: 140,
                  height: 80,
                  child: Stack(
                      children:[
                        Container(width: double.maxFinite,height: double.maxFinite,color: Colors.grey,child: undetailedData[index].image==null?null:Image.network(undetailedData[index].image,),),
                        Container(color: Colors.black.withOpacity(0.5),height: double.maxFinite,width: double.maxFinite,),
                        const Align(alignment: Alignment.center,child: Icon(Icons.play_arrow,color: Colors.red,),)
                      ]
                  ),
                ),
                const SizedBox(width: 8,),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,children: [
                    Text(undetailedData[index].name),
                    const SizedBox(height: 2,),
                    Text(undetailedData[index].airDate),
                  ],),
                ),
              ],),
            ),
        ),
      ),
    );
  }
}
