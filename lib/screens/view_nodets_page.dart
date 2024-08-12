import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:memo_mate/models/note_model.dart';
import 'package:memo_mate/services/note_services.dart';
import 'package:memo_mate/utils/colors.dart';
import 'package:memo_mate/utils/text_style.dart';

class ViewNotesPage extends StatefulWidget {
  final String cateNote;
  final int cateId;
  const ViewNotesPage({
    super.key,
    required this.cateNote,
    required this.cateId,
  });

  @override
  State<ViewNotesPage> createState() => _ViewNotesPageState();
}

class _ViewNotesPageState extends State<ViewNotesPage> {
  final TextEditingController _noteController = TextEditingController();

  List<NoteModel> _cateData = [];

  void _refreshCateData() {
    try {
      final data = NoteServices.getAllData();
      setState(() {
        _cateData = data;
        if (_cateData.isNotEmpty) {
          _noteController.text =
              NoteServices.getSingleData(widget.cateId)!.note;
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print('Errors $e');
      }
    }
  }

  Future<void> _updateData() async {
    await NoteServices.updateData(
        widget.cateId, widget.cateNote, _noteController.text);
  }

  Future<void> _addData() async {
    NoteServices.saveData(widget.cateNote, _noteController.text);
    _noteController.text = NoteServices.getSingleData(widget.cateId)!.note;
  }

  @override
  void initState() {
    super.initState();
    _noteController.addListener(() {
      if (_noteController.text.isEmpty) {
        _addData();
      } else {
        _updateData();
      }
    });
    _refreshCateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_sharp),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          widget.cateNote,
          style: AppTextStyle().kTitle.copyWith(color: AppColors().kWhiteColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    
                    onPressed: () {
                      setState(() {
                        _noteController.text = "";
                        NoteServices.updateData(
                            widget.cateId, widget.cateNote, "");
                        _refreshCateData();
                      });
                    },
                    child: Text(
                      "Clear All",
                      style: AppTextStyle().kDescription,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: TextField(
                controller: _noteController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your text here...',
                ),
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
