import 'package:flutter/material.dart';
import 'package:memo_mate/kWidgets/alert_massege.dart';
import 'package:memo_mate/kWidgets/container_button.dart';
import 'package:memo_mate/kWidgets/input_feild.dart';
import 'package:memo_mate/models/user_model.dart';
import 'package:memo_mate/services/cate_services.dart';
import 'package:memo_mate/services/note_services.dart';
import 'package:memo_mate/services/user_services.dart';
import 'package:memo_mate/utils/colors.dart';
import 'package:memo_mate/utils/text_style.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController userUpdateController = TextEditingController();

  bool isEdit = false;
  var height = 0.25;

  List<UserModel> _userdata = [];

  void _refreshUserData() {
    try {
      final data = UserServices.getAllData();
      setState(() {
        _userdata = data;
      });
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  Future<void> _updateData(int id) async {
    if (userUpdateController.text.isNotEmpty) {
      await UserServices.updateData(
        id,
        userUpdateController.text,
      );
      setState(() {
        isEdit = false;
        height = 0.25;
        userUpdateController.text = "";
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text("Invalid user name"),
        ),
      );
    }
    _refreshUserData();
  }

//dlete data

  void _deleteData(int id) async {
    await UserServices.deleteData(id);
    await CateServices.celarData();
    await NoteServices.celarData();
    _refreshUserData();
  }

  @override
  void initState() {
    super.initState();
    _refreshUserData(); // loading page and get all data
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Profile",
            style: AppTextStyle().kTitle,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * height,
          ),
          Center(
            child: Column(
              children: [
                Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: AppColors().kGrey,
                      width: 5,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image(
                      image: AssetImage("assets/user.png"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _userdata.isNotEmpty ? _userdata[0].userName : "",
                      style: AppTextStyle()
                          .kTitle
                          .copyWith(color: AppColors().kWhiteColor),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isEdit = true;
                          height = 0.1;
                        });
                      },
                      icon: Icon(Icons.edit_document),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),

                // edit tap
                Visibility(
                  visible: isEdit,
                  child: Column(
                    children: [
                      CoustomInputWidget(
                        controller: userUpdateController,
                        width: MediaQuery.of(context).size.width * 0.8,
                        inputTextColor: AppColors().kwhiteBgColor,
                        borderRadius: 100,
                        heigth: 22,
                        backGroundColor: AppColors().cardBgColor,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          _updateData(0);
                        },
                        child: CoustomButoon(
                          width: MediaQuery.of(context).size.width * 0.4,
                          gradient: AppColors().kPrimaryGradient,
                          text: "Change",
                          borderRadius: 100,
                          bgColor: AppColors().cardBgColor,
                          textColors: AppColors().kWhiteColor,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
                // log out
                GestureDetector(
                  onTap: () {
                    CoustomAlertMassege.showPopup(
                      context,
                      'Are you sure ?',
                      Text("Warning ! All content are clear"),
                      () => _deleteData(0),
                    );
                  },
                  child: CoustomButoon(
                    width: MediaQuery.of(context).size.width * 0.4,
                    gradient: AppColors().kPrimaryGradient,
                    text: "Log out",
                    borderRadius: 100,
                    bgColor: AppColors().cardBgColor,
                    textColors: AppColors().kWhiteColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
