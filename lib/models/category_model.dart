import 'package:hive/hive.dart';

part 'category_model.g.dart';

@HiveType(typeId: 1)
class CategoryModel {

  @HiveField(0)
  final String cateName;

  CategoryModel({
    required this.cateName,
  });
}
