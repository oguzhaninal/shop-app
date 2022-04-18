import '../../constants/global/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalManager {
  LocalManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }
  static final LocalManager _instance = LocalManager._init();

  SharedPreferences? _preferences;
  static LocalManager get instance => _instance;
  static Future prefrencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> clearAll() async {
    await _preferences?.clear();
  }

  Future<void> setStringValue(LocalManagerKeys key, String value) async {
    await _preferences?.setString(key.toString(), value);
  }

  Future<void> setBoolValue(LocalManagerKeys key, bool value) async {
    await _preferences?.setBool(key.toString(), value);
  }

  Future<void> setIntValue(LocalManagerKeys key, int value) async {
    await _preferences?.setInt(key.toString(), value);
  }

  String getStringValue(LocalManagerKeys key) => _preferences?.getString(key.toString()) ?? 'Not Found';

  String getLanguageCode() => _preferences?.getString(LocalManagerKeys.languageCode.toString()) ?? 'tr';

  Future<bool> getBoolValue(LocalManagerKeys key) async => _preferences?.getBool(key.toString()) ?? false;

  Future<int> getIntValue(LocalManagerKeys key) async => _preferences?.getInt(key.toString()) ?? -1;
}
