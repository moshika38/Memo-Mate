import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CoustomPageView extends StatefulWidget {
  final List<Widget> listChild;
  final PageController controller;

  final Alignment? indicatorAlignment;
  final double? indicatorPadding;
  final double pageCount;

  final Color? dotColor;
  final Color? activeColor;
  final double? dotWidth;
  final double? dotHeigth;
  final double? dotSpaceing;

  const CoustomPageView({
    super.key,
    required this.listChild,
    required this.controller,
    required this.indicatorAlignment,
    this.indicatorPadding,
    required this.pageCount,
    this.dotColor,
    this.activeColor,
    this.dotWidth,
    this.dotHeigth,
    this.dotSpaceing,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CoustomPageViewState createState() => _CoustomPageViewState();
}

class _CoustomPageViewState extends State<CoustomPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: widget.controller,
            children: widget.listChild,
          ),
          Align(
            alignment: widget.indicatorAlignment ?? Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(widget.indicatorPadding ?? 15),
              child: SmoothPageIndicator(
                controller: widget.controller,
                count: widget.pageCount.toInt(), // Number of pages
                effect: WormEffect(
                  activeDotColor: widget.activeColor ?? Colors.blue,
                  dotColor: widget.dotColor ?? Colors.grey,
                  dotHeight: widget.dotHeigth ?? 10,
                  dotWidth: widget.dotWidth ?? 10,
                  spacing: widget.dotSpaceing ?? 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
