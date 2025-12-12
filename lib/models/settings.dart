import 'package:hive/hive.dart';

part 'settings.g.dart'; // REQUIRED for Hive code generation

@HiveType(typeId: 2)
class Settings extends HiveObject {
  @HiveField(0)
  bool consentGiven;

  Settings({this.consentGiven = false});
}
