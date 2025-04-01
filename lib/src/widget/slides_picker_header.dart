import 'package:flutter/widgets.dart';
import 'package:impaktfull_slides/impaktfull_slides.dart';

class SliderPickerHeader extends StatelessWidget {
  const SliderPickerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        'Widget of the Meetup!',
        style: ImpaktfullUiTheme.of(context).textStyles.onCanvas.display.large,
        textAlign: TextAlign.center,
      ),
    );
  }
}
