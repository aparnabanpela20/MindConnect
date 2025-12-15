import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_riverpod/legacy.dart";
import "package:mind_connect/providers/service_providers.dart";
import "../models/quiz_result.dart";
import "../services/storage_service.dart";

// QuizState hold the current answers (a map of question IDs to selected answers)
class QuizState {
  final Map<int, int> answers; // questionID -> answerID
  QuizState({Map<int, int>? answers})
    : answers = Map.from(answers ?? {}); // initialize with empty map if null
  // meaning of previous line: create a new map from the provided answers or an empty map if none provided
  int get total =>
      answers.values.fold(0, (a, b) => a + b); // sum of all selected answer IDs
  //a = accumulator, b = current value
  // fold iterates over all values in answers and applies the function to accumulate a single result
  // why total is needed: to calculate quiz score based on selected answers
  // and how calculation works: each answerID represents a score, summing them gives total score
  // according to a score range, we can determine the quiz result
}

//difference between quiz state and quiz notifier:
// QuizState holds the data (current answers) while QuizNotifier manages and updates that data

class QuizNotifier extends StateNotifier<QuizState> {
  final StorageService _storage;

  QuizNotifier(this._storage) : super(QuizState());

  void answerQuestion(int index, int score) {
    final newMap = Map<int, int>.from(state.answers);
    newMap[index] = score;
    state = QuizState(answers: newMap);
  }

  Future<void> submit() async {
    final total = state.total;
    final result = QuizResult(
      score: total,
      answers: state.answers.values.toList(),
    );
    await _storage.addQuizResult(result);
    state = QuizState(); // reset state after submission
  }
}

final quizNotifierProvider = StateNotifierProvider<QuizNotifier, QuizState>((
  ref,
) {
  final storage = ref.read(storageServiceProvider);
  return QuizNotifier(storage);
});
