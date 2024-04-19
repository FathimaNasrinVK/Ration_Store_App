import 'package:flutter/material.dart';

class tile_controller with ChangeNotifier{
  var selectedTileIndices = [];
  List<Map<String, dynamic>> collection = [];
  void clearCollectiion(){
    collection.clear();
    selectedTileIndices.clear();
    notifyListeners();
  }
  void toggleTile(String name) {
    if (selectedTileIndices.contains(name)) {
      selectedTileIndices.remove(name);// Deselect if already selected
    } else {
      selectedTileIndices.add(name);
    }
    notifyListeners();
  }
  void togglenamelist( item, String name ){
    if (collection.contains(item)){
      collection.removeWhere((item) => item['Name'] == name);
    }
    else{
      collection.add(item);
    }
    notifyListeners();
  }
}