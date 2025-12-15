import "package:hive/hive.dart";
import "../models/thought.dart";
import "../models/quiz_result.dart";
import "../models/settings.dart";

class StorageService {
  // box getters
  //What does Box mean in Hive?
  // A Box in Hive is similar to a table in a traditional database. It is a container for storing objects of a specific type.
  //Syntax: Hive.box<Type>("boxName")
  Box<Thought> get thoughtBox =>
      Hive.box<Thought>("thoughtBox"); // open box named "thoughtBox"
  Box<QuizResult> get quizBox =>
      Hive.box<QuizResult>("quizHistoryBox"); // open box named "quizHistoryBox"
  Box<Settings> get settingsBox =>
      Hive.box<Settings>("settingsBox"); // open box named "settingsBox"

  // Thought helpers
  Thought? getLatestThought() => thoughtBox.get("latest"); // get latest thought
  // latest is a user defined key to store the latest thought
  //get can return null if no value is found for the given key
  //get can be used to retrieve values from the box using a key
  //the key can be of any type, but it is recommended to use a String or int for better performance
  //get can also recieve previously stored default value as second parameter
  Future<void> saveLatestThought(Thought t) async =>
      await thoughtBox.put("latest", t); // save latest thought
  // put is used to store values in the box with a given key

  // Quiz helpers
  Future<void> addQuizResult(QuizResult r) async => await quizBox.add(r);
  List<QuizResult> getAllQuizResults() =>
      quizBox.values.toList().cast<QuizResult>(); // get all quiz results
  // stores all values in the box as an iterable
  // cast to List<QuizResult> for easier usage

  // Settings helpers
  Settings getSettings() {
    final s = settingsBox.get("appSettings");
    if (s == null) {
      // if no settings found, return default settings
      final defaultS = Settings(consentGiven: false);
      settingsBox.put("appSettings", defaultS);
      return defaultS;
    }
    return s;
  }

  Future<void> saveSettings(Settings s) async {
    await settingsBox.put("appSettings", s);
  }
}
