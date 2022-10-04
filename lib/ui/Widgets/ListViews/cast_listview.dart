import 'package:flutter/material.dart';
import 'package:movie_app/ui/Widgets/cards/actor_card.dart';

class CastListView extends StatelessWidget {
  final List<dynamic> _actors;
  const CastListView(this._actors, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _actors.length,
      itemBuilder: (context, index) {
        return ActorCard(_actors[index]);
      },
    );
  }
}
