import 'dart:io';
import 'package:flutter/cupertino.dart';

import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        image: pickedImage,
        title: pickedTitle,
        location: PlaceLocation(latitude: 0, longitude: 0));

    _items.add(newPlace);
    notifyListeners();
  }
}
