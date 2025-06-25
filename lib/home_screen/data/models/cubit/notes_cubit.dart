import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sql_lite_app/sqldb.dart';
import 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  final Sqldb sqldb;

  NotesCubit(this.sqldb) : super(NotesState.initial());

  Future<void> loadNotes() async {
    emit(state.copyWith(isLoading: true));
    try {
      final data = await sqldb.read('notes');
      emit(state.copyWith(notes: data, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> deleteNote(int id) async {
    try {
      final result = await sqldb.deleteData('DELETE FROM notes WHERE id = $id');
      if (result > 0) {
        final updatedNotes = List<Map<String, dynamic>>.from(state.notes)
          ..removeWhere((note) => note['id'] == id);
        emit(state.copyWith(notes: updatedNotes));
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> addNote(Map<String, dynamic> note) async {
    try {
      await sqldb.insertData(
        'INSERT INTO notes (title, note, color) VALUES ("${note['title']}", "${note['note']}", "${note['color']}")',
      );
      await loadNotes();
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> updateNote(Map<String, dynamic> note) async {
    try {
      await sqldb.updateData(
        'UPDATE notes SET title = "${note['title']}", note = "${note['note']}", color = "${note['color']}" WHERE id = ${note['id']}',
      );
      await loadNotes();
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }
}
