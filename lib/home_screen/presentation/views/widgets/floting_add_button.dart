import 'package:flutter/material.dart';

class FloatingAddButton extends StatelessWidget {
  const FloatingAddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      backgroundColor: Colors.blueAccent,
      onPressed: () {
        Navigator.of(context).pushNamed("addnotes");
      },
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}
