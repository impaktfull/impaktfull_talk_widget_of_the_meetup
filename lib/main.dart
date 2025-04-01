import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:impaktfull_slides/impaktfull_slides.dart';
import 'package:impaktfull_talk_slides_widget_of_the_meetup/src/navigator/main_navigator.dart';
import 'package:impaktfull_talk_slides_widget_of_the_meetup/src/navigator/main_navigator.navigator.dart';

void main() {
  ImpaktfullSlides.initialize();
  setPathUrlStrategy();
  runApp(const ImpaktfullSlidesApp());
}

class ImpaktfullSlidesApp extends StatelessWidget {
  const ImpaktfullSlidesApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiApp(
      title: 'Widget of the Meetup',
      navigatorKey: MainNavigator.instance.navigatorKey,
      onGenerateRoute: MainNavigator.instance.onGenerateRoute,
      initialRoute: kDebugMode ? RouteNames.slidesWidgetSlug(widgetSlug: 'ticker-mode') : RouteNames.slidesPickerScreen,
    );
  }
}
