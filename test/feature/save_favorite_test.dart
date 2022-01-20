import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:values_generator/core/services/shared_preferences.dart';

void main() {
  late SharedPrefService shServ;
  late int newFavorite;
  late List<int> listOfFavorites;
  setUp(() {
    shServ = SharedPrefServiceImp();
    newFavorite = 10; //any value can be used
  });
  test("should save a favorite value and get it back and then remove it",
      () async {
    SharedPreferences.setMockInitialValues({});
    var _prefs = await SharedPreferences.getInstance();
    shServ.initiateSharedPref(_prefs);
    shServ.saveToFavorites(newFavorite);
    listOfFavorites = shServ.getFavorites();
    expect(newFavorite, listOfFavorites[listOfFavorites.length - 1]);
    //now try to remove it.
    shServ.removeFromFavorites(newFavorite);
    listOfFavorites = shServ.getFavorites();
    expect(false, listOfFavorites.contains(newFavorite));
  });
}
