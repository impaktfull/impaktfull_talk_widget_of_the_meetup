// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FlutterNavigatorGenerator
// **************************************************************************

// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_slides/impaktfull_slides.dart';

import '../screen/slides_detail_screen.dart';
import '../screen/slides_picker_screen.dart';

mixin BaseNavigator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final arguments = settings.arguments is Map ? (settings.arguments as Map).cast<String, dynamic>() : <String, dynamic>{};
    final settingsUri = Uri.parse(settings.name ?? '');
    final queryParameters = Map.from(settingsUri.queryParameters);
    switch (settingsUri.path) {
      case RouteNames.slidesPickerScreen:
        return ImpaktfullUiDesktopPageRoute<void>(
          builder: (_) => SlidesPickerScreen(),
          settings: settings,
          fullscreenDialog: false,
        );
    }
    final pathSegments = settingsUri.pathSegments;
    if (pathSegments.length == 2) {
      if (pathSegments[0] == 'slides') {
        queryParameters['widgetSlug'] = pathSegments[1];
        return ImpaktfullUiDesktopPageRoute<void>(
          builder: (_) => SlidesDetailScreen(
            widgetSlug: queryParameters['widgetSlug'] ?? arguments['widgetSlug'] as String,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      }
    }
    return null;
  }

  Future<void> goToSlidesDetailScreen({required String widgetSlug}) async => navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.slidesWidgetSlug(widgetSlug: widgetSlug),
        arguments: {'widgetSlug': widgetSlug},
      );
  Future<void> goToSlidesPickerScreen() async => navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.slidesPickerScreen,
        arguments: {},
      );
  void goBack() => navigatorKey.currentState?.pop();
  void goBackWithResult<T>({T? result}) => navigatorKey.currentState?.pop(result);
  void popUntil(bool Function(Route<dynamic>) predicate) => navigatorKey.currentState?.popUntil(predicate);
  void goBackTo(String routeName) => popUntil((route) => route.settings.name?.split('?').first == routeName);
  Future<T?> showCustomDialog<T>({Widget? widget}) async => showDialog<T>(
        context: navigatorKey.currentContext!,
        builder: (_) => widget ?? const SizedBox.shrink(),
      );
  Future<T?> showBottomSheet<T>({Widget? widget}) async => showModalBottomSheet<T>(
        context: navigatorKey.currentContext!,
        builder: (_) => widget ?? const SizedBox.shrink(),
      );
}

class RouteNames {
  /// /
  static const slidesPickerScreen = '/';

  /// /slides/:widgetSlug
  static String slidesWidgetSlug({required String widgetSlug}) => '/slides/$widgetSlug';
}
