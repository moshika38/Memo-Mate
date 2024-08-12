import 'package:hive_flutter/hive_flutter.dart';
import 'package:memo_mate/models/note_model.dart';



class NoteServices {
  // Declare the box as a static final variable
  static final Box<NoteModel> _box = Hive.box<NoteModel>('noteData');


  // Get all data
  static List<NoteModel> getAllData() {
    return _box.values.toList();
  }

 // Save data
  static Future<void> saveData(String byCate,String note) async {
    final data = NoteModel(byCategory: byCate,note: note);
    await _box.add( data);
  }

  // Get single data
  static NoteModel? getSingleData(int id) {
    return _box.getAt(id);
  }

  // Update data
  static Future<void> updateData(int key, String byCate,String note) async {
    final data = NoteModel(byCategory: byCate,note: note);
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
