import "Package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_riverpod/legacy.dart";

import "../models/settings.dart";
import "../services/storage_service.dart";

// a simple state notifier that exposes settings and updates hive when changed

class SettingsNotifier extends StateNotifier<Settings> {
  final StorageService _storage;

  SettingsNotifier(this._storage) : super(_storage.getSettings());
  // meaning of previous line: initialize state with settings from Hive via StorageService
  // super calls the constructor of StateNotifier with initial state if no state is provided

  Future<void> setConsent(bool v) async {
    state.consentGiven = v;
    // save to HIve via StorageService
    await _storage.saveSettings(state);
    // update state so UI can react
    state = state;
  }
}
