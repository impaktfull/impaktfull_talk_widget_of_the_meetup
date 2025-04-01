import 'package:flutter/material.dart';
import 'package:impaktfull_slides/impaktfull_slides.dart';
import 'package:impaktfull_talk_slides_widget_of_the_meetup/src/navigator/main_navigator.dart';
import 'package:impaktfull_talk_slides_widget_of_the_meetup/src/slides/default_slides.dart';

class SlidesPickerItem extends StatelessWidget {
  final DefaultSlides slides;

  const SlidesPickerItem({
    required this.slides,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiCard(
      onTap: _onTap,
      child: Center(
        child: Text(
          slides.widgetName,
          style: theme.textStyles.onCard.display.extraSmall,
        ),
      ),
    );
  }

  void _onTap() => MainNavigator.instance.goToSlidesDetailScreen(
        widgetSlug: slides.widgetSlug,
      );
}
