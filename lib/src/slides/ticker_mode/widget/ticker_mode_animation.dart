import 'package:flutter/material.dart';
import 'package:impaktfull_slides/impaktfull_slides.dart';

class TickerModeAnimation extends StatelessWidget {
  const TickerModeAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: ImpaktfullUiLoadingIndicator(),
      ),
    );
  }
}
