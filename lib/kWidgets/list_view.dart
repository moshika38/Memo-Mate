import 'package:flutter/material.dart';


class CosutomListViewBuilder extends StatefulWidget {
  final double itemCount;
  final Widget returnEliment;
  final int? crossAxisCount;

  final double childAspectRatio;
  const CosutomListViewBuilder({
    super.key,
    required this.itemCount,
    required this.returnEliment, required this.childAspectRatio,   this.crossAxisCount,
  });

  @override
  State<CosutomListViewBuilder> createState() =>
      _CosutomListViewBuilderState();
}

class _CosutomListViewBuilderState extends State<CosutomListViewBuilder> {
  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      shrinkWrap: true,
      
      physics:const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount??1,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / widget.childAspectRatio),
      ),
      itemCount: widget.itemCount.toInt(),
      itemBuilder: (context, index) {
        return widget.returnEliment;
      },
    );
  }
}
