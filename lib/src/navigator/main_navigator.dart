import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:impaktfull_talk_slides_widget_of_the_meetup/src/navigator/main_navigator.navigator.dart';

@flutterNavigator
class MainNavigator with BaseNavigator {
  factory MainNavigator() => instance;

  static final instance = MainNavigator._();

  MainNavigator._();
}
