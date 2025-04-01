import 'package:flutter/widgets.dart';
import 'package:impaktfull_slides/impaktfull_slides.dart';

abstract class DefaultSlides {
  final String widgetName;
  final String widgetSlug;

  const DefaultSlides({
    required this.widgetName,
    required this.widgetSlug,
  });

  DateTime get visibleFrom;

  List<ImpaktfullSlide> buildSlides(BuildContext context, ImpaktfullSlidesTheme theme);
}
