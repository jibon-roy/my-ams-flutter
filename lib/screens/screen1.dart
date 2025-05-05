import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height,
      decoration: BoxDecoration(
        color: Colors.green,
      ),
      child: Center(child: Text("data 12233")),
    );
  }
}
