import 'package:flutter/material.dart';

class Episodes extends StatefulWidget {
  final seasonName;
  Episodes(this.seasonName);

  @override
  State<Episodes> createState() => _EpisodesState();
}

class _EpisodesState extends State<Episodes> {
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
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
        child: ListView(
            children: [
                 Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
                    Container(
                      width: 150,
                      height: 100,
                      child: Stack(
                        children:[
                             Container(width: double.maxFinite,height: double.maxFinite,color: Colors.grey,),
                             Align(alignment: Alignment.center,child: Icon(Icons.play_arrow,color: Colors.red,),)
                        ]
                      ),
                    ),
                    SizedBox(width: 8,),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,children: [
                      Text("Name"),
                      Text("OverView"),
                      Text("AirDate"),
                    ],),
                 ],)
            ],
        ),
      ),
    );
  }
}
