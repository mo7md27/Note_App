import 'package:flutter/material.dart';
import 'package:sql_lite_app/edit_screen/presentation/views/edit_nodes.dart';

class NoteCard extends StatelessWidget {
  final int id;
  final String title;
  final String note;
  final String? color;
  final VoidCallback onDelete;

  const NoteCard({
    super.key,
    required this.id,
    required this.title,
    required this.note,
    required this.onDelete,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(note),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: onDelete,
              icon: const Icon(Icons.delete_outline),
              color: Colors.redAccent,
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditNodes(
                      id: id,
                      title: title,
                      note: note,
                      color: color,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.update_outlined),
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
