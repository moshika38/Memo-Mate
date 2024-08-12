import 'package:flutter/material.dart';
import 'package:memo_mate/kWidgets/alert_massege.dart';
import 'package:memo_mate/kWidgets/popup_windwo.dart';
import 'package:memo_mate/models/category_model.dart';
import 'package:memo_mate/services/cate_services.dart';
import 'package:memo_mate/services/note_services.dart';
import 'package:memo_mate/utils/colors.dart';
import 'package:memo_mate/utils/text_style.dart';
import 'package:memo_mate/widgets/container.dart';

class EditCategoryPage extends StatefulWidget {
  const EditCategoryPage({super.key});

  @override
  State<EditCategoryPage> createState() => _EditCategoryPageState();
}

class _EditCategoryPageState extends State<EditCategoryPage> {
  TextEditingController cateInput = TextEditingController();

  List<CategoryModel> _cateData = [];

  void _refreshCateData() {
    try {
      final data = CateServices.getAllData();
      setState(() {
        _cateData = data;
      });
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  void _deleteData(int id) async {
    await CateServices.deleteData(id);
    _refreshCateData();
  }

//delete note
  void _deleteNotedata(int id) async {
    await NoteServices.deleteData(id);
  }

  @override
  void initState() {
    super.initState();
    _refreshCateData(); // loading page and get all data
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categorys",
                style: AppTextStyle().kTitle,
              ),
              GestureDetector(
                onLongPress: () {
                  print("ok done");
                },
                onTap: () {
                  CoustomPopupWindow().showPopup(context, null, cateInput, "");
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: AppColors().kPrimaryGradient,
                  ),
                  child: Center(
                    child: Icon(Icons.add),
                  ),
                ),
              ),
            ],
          ),

          // list view

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 7), // change height
              ),
              itemCount: _cateData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: AppContainer(
                    width: 0,
                    height: 0,
                    borderRadius: 20,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  _cateData[index].cateName,
                                  style: AppTextStyle().kSubTitle.copyWith(
                                        fontSize: 20,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // call update methord
                              CoustomPopupWindow().showPopup(context, index,
                                  cateInput, _cateData[index].cateName);
                            },
                            icon: Icon(
                              Icons.edit,
                              size: 30,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // call delete methord
                              CoustomAlertMassege.showPopup(
                                context,
                                'Are you sure ?',
                                SizedBox(),
                                () {
                                  _deleteData(index);
                                  _deleteNotedata(index);
                                },
                              );
                            },
                            icon: Icon(
                              Icons.delete,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ], // page end
      ),
    );
  }
}

/*

========================================================================

CoustomPopupWindow().showPopup(context, 1, cateInput);

========================================================================
 */