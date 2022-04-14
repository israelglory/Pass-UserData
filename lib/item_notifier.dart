// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_data/datamodel.dart';


class ItemNotifier extends ChangeNotifier {
  SharedPreferences? sharedPreferences;

  List<Item> itemList = [];

  addItem(String itemName) async {
    Item item = Item(itemName);
    itemList.add(item);
    saveDataToLocalStorage();
  void initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadDataFromLocalStorage();
    notifyListeners();
  }
  // Save Data - Shared Preferences
  void saveDataToLocalStorage() {
    List<String>? spList = itemList.map((item) => json.encode(item.toMap())).toList();
    sharedPreferences!.setStringList('list',spList);
  }
  // Load Data - Shared Preferences
  void loadDataFromLocalStorage() {
    List<String>? spList = sharedPreferences!.getStringList('list');
    if (spList != null) {
      itemList =
          spList.map((item) => Item.fromMap(json.decode(item))).toList();
    }
    notifyListeners();
  }

}