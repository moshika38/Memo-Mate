import 'package:hive_flutter/hive_flutter.dart';
import 'package:memo_mate/models/user_model.dart';


class UserServices {
  // Declare the box as a static final variable
  static final Box<UserModel> _box = Hive.box<UserModel>('userBox');

  // Check if the database is empty
  static Future<bool> DBisEmpty() async {
    return _box.isEmpty;
  }

  // Save data
  static Future<void> saveData(String uName,) async {
    final data = UserModel(userName: uName,);
    await _box.add( data);
  }

  // Get all data
  static List<UserModel> getAllData() {
    return _box.values.toList();
  }

  // Get single data
  static UserModel? getSingleData(int id) {
    return _box.get(id);
  }

  // Update data
  static Future<void> updateData(int id,String uName ) async {
    final data = UserModel(userName: uName);
    await _box.put(id, data);
  }

  // Delete data
  static Future<void> deleteData(int id) async {
    await _box.delete(id); 
    await _box.clear();
  }
}
