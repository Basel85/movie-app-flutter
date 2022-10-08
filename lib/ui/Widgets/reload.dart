import 'package:flutter/material.dart';

class Reload extends StatelessWidget {
  final _errorMessage;
  const Reload(this._errorMessage, {super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        width: size.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(_errorMessage),
              const ElevatedButton(onPressed: null, child: Text("Reload")),
            ]),
      ),
    );
  }
}
