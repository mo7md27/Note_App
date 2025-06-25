import 'package:flutter/material.dart';

class CustomAppBarAdd extends StatelessWidget {
  const CustomAppBarAdd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Add Notes"),
      backgroundColor: Colors.blueAccent,
      centerTitle: true,
    );
  }
}
