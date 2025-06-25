import 'package:flutter/material.dart';
import 'package:sql_lite_app/home_screen/presentation/views/widgets/note_card.dart';

class NotesList extends StatelessWidget {
  final List notes;
  final Function(int) onDelete;

  const NotesList({
    super.key,
    required this.notes,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, i) {
        return NoteCard(
          id: notes[i]['id'],
          title: notes[i]['title'],
          note: notes[i]['note'],
          color: notes[i]['color'],
          onDelete: () => onDelete(notes[i]['id']),
        );
      },
    );
  }
}
