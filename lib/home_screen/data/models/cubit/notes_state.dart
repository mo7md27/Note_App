import 'package:equatable/equatable.dart';

class NotesState extends Equatable {
  final List<Map<String, dynamic>> notes;
  final bool isLoading;
  final String? errorMessage;

  const NotesState({
    required this.notes,
    required this.isLoading,
    this.errorMessage,
  });

  factory NotesState.initial() {
    return const NotesState(
      notes: [],
      isLoading: true,
      errorMessage: null,
    );
  }

  NotesState copyWith({
    List<Map<String, dynamic>>? notes,
    bool? isLoading,
    String? errorMessage,
  }) {
    return NotesState(
      notes: notes ?? this.notes,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [notes, isLoading, errorMessage];
}
