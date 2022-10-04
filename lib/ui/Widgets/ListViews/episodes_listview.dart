import 'package:flutter/material.dart';

class EpisodesListView extends StatelessWidget {
  final data;
  const EpisodesListView(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    print(data);
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.only(bottom: 24),
        height: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 140,
              height: 80,
              child: Stack(children: [
                Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  color: Colors.grey,
                  child: data[index].image == null
                      ? null
                      : Image.network(
                          data[index].image,
                        ),
                ),
                Container(
                  color: Colors.black.withOpacity(0.5),
                  height: double.maxFinite,
                  width: double.maxFinite,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.red,
                  ),
                )
              ]),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(data[index].name,maxLines: 2,overflow: TextOverflow.ellipsis,),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(data[index].airDate),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
