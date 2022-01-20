import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:values_generator/core/services/shared_preferences.dart';

void main() {
  late SharedPrefService shServ;
  late Map<String, dynamic> values;
  late String testValue1;
  late String testValue2;
  late String localValuesKey;
  setUp(() {
    shServ = SharedPrefServiceImp();
    localValuesKey = "local values";
    testValue1 = "this is a test value 1";
    testValue2 = "this is a test value 2";
  });
  test("should save a value and then get it back", () async {
    SharedPreferences.setMockInitialValues({});
    var _prefs = await SharedPreferences.getInstance();
    shServ.initiateSharedPref(_prefs);
    shServ.saveValue(testValue1);
    values = shServ.getValues();
    expect(testValue1, values[values.length.toString()]);
    shServ.saveValue(testValue2);
    values = shServ.getValues();
    expect(testValue2,values[values.length.toString()]);
  });
}
