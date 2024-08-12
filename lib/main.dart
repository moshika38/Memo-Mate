import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:memo_mate/kWidgets/bottom_app_bar.dart';
import 'package:memo_mate/kWidgets/onbording.dart';
import 'package:memo_mate/models/category_model.dart';
import 'package:memo_mate/models/note_model.dart';
import 'package:memo_mate/models/user_model.dart';
import 'package:memo_mate/screens/edit_category_page.dart';
import 'package:memo_mate/screens/onbording/add_user.dart';
import 'package:memo_mate/screens/onbording/start_page.dart';
import 'package:memo_mate/screens/profile_page.dart';
import 'package:memo_mate/screens/caregory_home_page.dart';
import 'package:memo_mate/screens/view_nodets_page.dart';
import 'package:memo_mate/services/user_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  //user
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>('userBox');

  //category
  Hive.registerAdapter(CategoryModelAdapter());
  await Hive.openBox<CategoryModel>('cateData');

  //note
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('noteData');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData themeMode = ThemeData.dark();
  PageController pageController = PageController();
  bool isUser = false;
  int pageIndex = 1;

  List<UserModel> _userdata = [];

  void _refreshUserData() {
    try {
      final data = UserServices.getAllData();
      setState(() {
        _userdata = data;
        if (_userdata.isEmpty) {
          isUser = true;
        }
      });
    // ignore: empty_catches
    } catch (e) {
     
    }
  }

  @override
  void initState() {
    super.initState();
    _refreshUserData(); 
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const EditCategoryPage(),
      const CategoryByNotePage(),
      const ProfilePage(),
    ];

    // Callback function
    void updateData(int newIndex) {
      setState(() {
        pageIndex = newIndex;
      });
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeMode,
      home: SafeArea(
        child: isUser
            ? CoustomPageView(
                listChild: [
                    StartPage(
                      page: pageController,
                    ),
                    AddUserPage(
                      page: pageController,
                    ),
                  ],
                controller: pageController,
                indicatorAlignment: Alignment.bottomCenter,
                pageCount: 2)
            : Scaffold(
                bottomNavigationBar: k_CoustomBottomAppBar(
                  onTap: updateData,
                ),
                body: pages[pageIndex],
              ),
      ),
    );
  }
}
