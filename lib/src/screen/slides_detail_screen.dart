import 'package:flutter/widgets.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:impaktfull_slides/impaktfull_slides.dart';
import 'package:impaktfull_talk_slides_widget_of_the_meetup/src/screen/slides_picker_screen.dart';

@FlutterRoute(
  routeName: 'slides/:widgetSlug',
  pageType: ImpaktfullUiDesktopPageRoute,
)
class SlidesDetailScreen extends StatelessWidget {
  final String widgetSlug;

  const SlidesDetailScreen({
    required this.widgetSlug,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final slides = SlidesPickerScreen.slides.firstOrNullWhere((element) => element.widgetSlug == widgetSlug);
    if (slides == null) {
      return ImpaktfullUiCard(
        alignment: Alignment.center,
        child: Text(
          'Widget not found',
          style: ImpaktfullUiTheme.of(context).textStyles.onCard.display.large,
        ),
      );
    }
    return ImpaktfullSlidesDeck(
      title: 'Widget of the Meetup',
      slides: (context, theme) => [
        ImpaktfullTitleSlide(
          title: 'Widget of the Meetup',
          titleHighlight: 'Meetup',
          subtitle: slides.widgetName,
        ),
        ...slides.buildSlides(context, theme),
        const ImpaktfullTitleCardSlide(
          title: 'Any questions?',
          text: 'Just shoot!',
          textHighlight: 'shoot',
        ),
      ],
    );
  }
}
