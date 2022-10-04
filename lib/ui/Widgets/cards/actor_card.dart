import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/ui/Widgets/loading.dart';
import '../noimage.dart';

class ActorCard extends StatelessWidget {
  final _actor;
  const ActorCard(this._actor,{super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 24),
      width: 140,
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 209,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: _actor.profileImage == null
                    ? const NoImage()
                    : Image.network(
                        imageDomain + _actor.profileImage,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return const Loading();
                        },
                      )),
          ),
          Text(_actor.originalName,
              style: Theme.of(context).textTheme.subtitle2,
              textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
