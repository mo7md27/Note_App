import 'package:flutter/material.dart';

Widget buildTextField({
    required TextEditingController controller,
   
    required String hint,
    required IconData icon,
  }) {
    return TextFormField(
      controller: controller,
      validator: (val) {
       
      },
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
        ),
      ),
    );
  }


