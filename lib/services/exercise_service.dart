class ExerciseService {
  final completedItems = <String>[];

  final failedToSubmitItem = <String>[];

  Future completeExerciseItem(String exerciseItem) async {
    try {
      // submit completion to server
    } catch (err) {
      failedToSubmitItem.add(exerciseItem);
    }
  }
}
