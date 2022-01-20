import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'initial_values.dart';

abstract class SharedPrefService {
  late SharedPreferences _prefs;

  void initiateSharedPref(SharedPreferences value);

  void saveValue(String value);

  Map<String, dynamic> getValues();

  void saveToFavorites(int newFavorite);

  List<int> getFavorites();

  void removeFromFavorites(int value) {}
}

@Singleton(as: SharedPrefService)
class SharedPrefServiceImp implements SharedPrefService {
  String localValuesKey = "local values";
  String localFavoritesKey = "local favorites Key";

  @override
  Map<String, dynamic> getValues() {
    if (_prefs.containsKey(localValuesKey)) {
      var local = _prefs.getString(localValuesKey);
      Map<String, dynamic> decodedValues = json.decode(local!);
      // print(decodedValues);
      return decodedValues;
    } else {
      return {};
    }
  }

  @override
  void saveValue(String value) {
    Map<String, dynamic> values = {};
    if (_prefs.containsKey(localValuesKey)) {
      var local = _prefs.getString(localValuesKey);
      values = json.decode(local!);
    }
    values[(values.length + 1).toString()] = value;
    // print("values inside save block" + value.toString());

    var encodedValue = json.encode(values);
    _prefs.setString(localValuesKey, encodedValue);
  }

  @override
  late SharedPreferences _prefs;

  @override
  void initiateSharedPref(SharedPreferences value) {
    _prefs = value;
    if (_alreadyInitialized() == false) {
      print("######## initializing the values ########");
      var encodeValues = json.encode(initialValues);
      _prefs.setString(localValuesKey, encodeValues);
      _prefs.setStringList(localFavoritesKey, []);
    }
  }

  @override
  void saveToFavorites(int newFavorite) {
    List<String> favListStr = (_prefs.getStringList(localFavoritesKey) ?? []);
    favListStr.add(newFavorite.toString());
    _prefs.setStringList(localFavoritesKey, favListStr);
  }

  @override
  List<int> getFavorites() {
    List<String> favListStr = (_prefs.getStringList(localFavoritesKey) ?? []);
    List<int> favList = favListStr.map((i) => int.parse(i)).toList();
    // print(favList.toString());
    return favList;
  }

  _alreadyInitialized() {
    return _prefs.containsKey(localValuesKey);
  }

  @override
  void removeFromFavorites(int value) {
    List<String> favListStr = (_prefs.getStringList(localFavoritesKey) ?? []);
    favListStr.remove(value.toString());
    _prefs.setStringList(localFavoritesKey, favListStr);
  }
}
