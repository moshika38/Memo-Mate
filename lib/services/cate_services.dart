import 'package:hive_flutter/hive_flutter.dart';
import 'package:memo_mate/models/category_model.dart';



class CateServices {
  // Declare the box as a static final variable
  static final Box<CategoryModel> _box = Hive.box<CategoryModel>('cateData');


  // Get all data
  static List<CategoryModel> getAllData() {
    return _box.values.toList();
  }

 // Save data
  static Future<void> saveData(String cateName,) async {
    final data = CategoryModel(cateName: cateName,);
    await _box.add( data);
  }

  // Get single data
  static CategoryModel? getSingleData(int id) {
    return _box.getAt(id);
  }

  // Update data
  static Future<void> updateData(int key, String cateName) async {
    final data = CategoryModel(cateName: cateName);
    await _box.putAt(key, data);
  }

  // Delete data
  static Future<void> deleteData(int key) async {
    await _box.deleteAt(key);
  }

  static Future<void> celarData() async {
    await _box.clear();
  } 

}
