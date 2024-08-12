import 'package:flutter/material.dart';
import 'package:memo_mate/data/cateData.dart';
import 'package:memo_mate/models/category_model.dart';
import 'package:memo_mate/screens/view_nodets_page.dart';
import 'package:memo_mate/services/cate_services.dart';
import 'package:memo_mate/services/note_services.dart';
import 'package:memo_mate/utils/colors.dart';
import 'package:memo_mate/utils/text_style.dart';
import 'package:memo_mate/widgets/container.dart';

class CategoryByNotePage extends StatefulWidget {
  const CategoryByNotePage({super.key});

  @override
  State<CategoryByNotePage> createState() => _CategoryByNotePageState();
}

class _CategoryByNotePageState extends State<CategoryByNotePage> {
  TextEditingController cateInput = TextEditingController();

  List<CategoryModel> _cateData = [];

  void _refreshCateData() {
    try {
      final data = CateServices.getAllData();
      setState(() {
        _cateData = data;
        if (_cateData.isEmpty) {
          _addDefaultData();
          CateServices.celarData();
          NoteServices.celarData();
        }
      });
    } catch (error) {
      
    }
  }

  Future<void> _addDefaultData() async {
    CateServices.saveData(Catedata().cateData[0].cateName);
    _refreshCateData();
  }

  @override
  void initState() {
    _refreshCateData();
    super.initState();
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
                "Notes",
                style: AppTextStyle().kTitle,
              ),
            ],
          ),

          // list view

          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 2.5),
            ),
            itemCount: _cateData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewNotesPage(
                          cateId: index,
                          cateNote: _cateData[index].cateName,
                        ),
                      ),
                    );
                  },
                  child: AppContainer(
                    width: 0,
                    height: 0,
                    borderRadius: 20,
                    child: Center(
                      child: Text(
                        _cateData[index].cateName,
                        style: AppTextStyle().kSubTitle.copyWith(
                              color: AppColors().kWhiteColor,
                            ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ], // page end
      ),
    );
  }
}
