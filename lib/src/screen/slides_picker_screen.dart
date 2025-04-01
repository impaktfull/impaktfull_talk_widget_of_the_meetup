import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:impaktfull_slides/impaktfull_slides.dart';
import 'package:impaktfull_talk_slides_widget_of_the_meetup/src/slides/default_slides.dart';
import 'package:impaktfull_talk_slides_widget_of_the_meetup/src/slides/ticker_mode/ticker_mode_slides.dart';
import 'package:impaktfull_talk_slides_widget_of_the_meetup/src/widget/slided_picker_item.dart';
import 'package:impaktfull_talk_slides_widget_of_the_meetup/src/widget/slides_picker_header.dart';

@FlutterRoute(
  routeName: '/',
  pageType: ImpaktfullUiDesktopPageRoute,
)
class SlidesPickerScreen extends StatelessWidget {
  static const List<DefaultSlides> slides = [
    IntrinsicHeightSlides(),
  ];

  const SlidesPickerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiScreen(
      child: ImpaktfullUiAutoLayout.vertical(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SliderPickerHeader(),
          Expanded(
            child: ImpaktfullUiGridView.builder(
              padding: const EdgeInsets.all(16),
              items: slides,
              itemBuilder: (context, item, index) => SlidesPickerItem(
                slides: item,
              ),
              crossAxisCount: (context, config) => config.maxWidth ~/ 200,
              noDataLabel: 'No slides found',
            ),
          ),
        ],
      ),
    );
  }
}
