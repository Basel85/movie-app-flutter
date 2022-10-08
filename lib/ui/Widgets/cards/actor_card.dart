import 'package:flutter/material.dart';
import 'package:movie_app/constants/string_constants.dart';
import 'package:movie_app/ui/Widgets/image_network.dart';
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
                    : ImageNetwork(imageDomain + _actor.profileImage)),
          ),
          Text(_actor.originalName,
              style: Theme.of(context).textTheme.subtitle2,
              textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
