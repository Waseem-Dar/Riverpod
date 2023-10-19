import 'package:flutter/material.dart';
import 'package:new_project/Provider/list.dart';

class CountProvider with ChangeNotifier {
  int _count = 10;
  int get count => _count;
  void addCounting() {
    _count++;
    notifyListeners();
  }
}

//Slider Provider

class SliderProvider with ChangeNotifier {
  double _value = 1.0;
  double get value => _value;
  void setValue(double val) {
    _value = val;
    notifyListeners();
  }
}

//Favorite Provider

class FavoriteProvider with ChangeNotifier {
  final nameList = ["Ali", "Khan", "Kamran", "Jan", "Umar", "Saad"];

  final List _list = [];
  List get list => _list;

  void addIndex(int index) {
    list.add(index);
    notifyListeners();
  }

  void removeIndex(int index) {
    list.remove(index);
    notifyListeners();
  }
}

//Theme Changer

class DarkThemeProvider with ChangeNotifier {
  var _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  void setTheme(themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}

//Fruit Provider

class FruitProvider with ChangeNotifier {
  List fruitList = ItemsList.itemList;


  final List _favorite = [];
  List get favorite => _favorite;



  void addFavorite(int index) {
    favorite.add(index);
    notifyListeners();
  }

  void removeFavorite(int index,) {
    favorite.remove(index);
    notifyListeners();
  }

}
