import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class StorageService {
  static const _fileName = 'storage.json';

  Map<String, dynamic>? _cachedStorage;

  Future<dynamic> get(String key) async {
    final storage = await _loadStorage();

    return storage[key];
  }

  Future<void> remove(String key) async {
    final storage = await _loadStorage();

    storage.remove(key);

    await _saveStorage(storage);
  }

  Future<void> set(String key, dynamic value) async {
    final storage = await _loadStorage();

    storage[key] = value;

    await _saveStorage(storage);
  }

  Future<Map<String, dynamic>> _loadStorage() async {
    if(_cachedStorage != null)  {
      return _cachedStorage ?? {};
    }

    var storage = <String, dynamic>{};

    final storageFile = await _getStorageFile();

    if (!await storageFile.exists()) {
      return storage;
    }

    try {
      final jsonString = await storageFile.readAsString();

      if(jsonString != '') {
        storage = json.decode(jsonString);
      }
    } catch(err) {
      // show the user some error message. Maybe with a toast popup
    }

    _cachedStorage = storage;

    return storage;
  }

  Future<void> _saveStorage(Map<String, dynamic> storage) async {
    final jsonString = json.encode(storage);
    final storageFile = await _getStorageFile();

    if (!await storageFile.exists()) {
      await storageFile.create();
    }

    await storageFile.writeAsString(jsonString);

    _cachedStorage = storage;
  }

  Future<File> _getStorageFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$_fileName');
  }
}
