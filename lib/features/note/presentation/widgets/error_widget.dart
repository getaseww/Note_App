import 'package:flutter/material.dart';

class FailurWidget extends StatelessWidget {
  const FailurWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Card(child: const Text("Something went wrong")),
      ),
    );
  }
}
