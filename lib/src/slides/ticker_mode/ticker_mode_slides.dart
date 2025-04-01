import 'package:flutter/material.dart';
import 'package:impaktfull_slides/impaktfull_slides.dart';
import 'package:impaktfull_talk_slides_widget_of_the_meetup/src/slides/default_slides.dart';
import 'package:impaktfull_talk_slides_widget_of_the_meetup/src/slides/ticker_mode/widget/ticker_mode_animation.dart';
import 'package:impaktfull_talk_slides_widget_of_the_meetup/src/slides/ticker_mode/widget/ticker_mode_other_widgets.dart';

class IntrinsicHeightSlides extends DefaultSlides {
  const IntrinsicHeightSlides()
      : super(
          widgetName: 'TickerMode',
          widgetSlug: 'ticker-mode',
        );

  @override
  DateTime get visibleFrom => DateTime(2025, 3, 31);

  @override
  List<ImpaktfullSlide> buildSlides(
    BuildContext context,
    ImpaktfullSlidesTheme theme,
  ) =>
      [
        ImpaktfullBulletsSlide(
          title: 'Animations!',
          titleHighlight: '!',
          titleOnCard: false,
          bullets: [
            'Animations trigger constant rebuilding',
            'Animations take up CPU',
            'Animations take up battery',
            'Animations can unnecessarily slow down your app',
          ],
          endBuilder: (context) => const Expanded(
            child: ImpaktfullUiAutoLayout.vertical(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                Expanded(
                  child: ImpaktfullSlidesPerformanceOverlayCard(
                    width: double.infinity,
                    height: double.infinity,
                    child: TickerModeAnimation(),
                  ),
                ),
                Expanded(
                  child: ImpaktfullUiCard(
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: ImpaktfullSlidesCodeWidget(
                      code: ImpaktfullSlideCodeData(code: '''
ImpaktfullUiLoadingIndicator()
'''),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ImpaktfullBulletsSlide(
          title: 'What do we need to pause?',
          titleHighlight: 'pause',
          titleOnCard: false,
          bullets: [
            'AnimationControllers',
            'AnimatedBuilder',
            'TickerProvider',
            r"💡 It doesn't pause timers or logic, just animations driven by Ticker!!",
          ],
          endBuilder: (context) => const Expanded(
            child: ImpaktfullUiAutoLayout.vertical(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                Expanded(
                  child: ImpaktfullSlidesPerformanceOverlayCard(
                    width: double.infinity,
                    height: double.infinity,
                    child: TickerMode(
                      enabled: false,
                      child: TickerModeAnimation(),
                    ),
                  ),
                ),
                Expanded(
                  child: ImpaktfullUiCard(
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: ImpaktfullSlidesCodeWidget(
                      code: ImpaktfullSlideCodeData(code: '''
TickerMode(
  enabled: false,
  child: ImpaktfullUiLoadingIndicator(),
)
'''),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const ImpaktfullBulletsSlide(
          title: 'Out of the box',
          titleHighlight: 'box',
          titleOnCard: false,
          splitBulletsAfterAmount: 1,
          bullets: [
            'PageView',
            'TabBarView',
            'Navigator',
          ],
        ),
        ImpaktfullBulletsSlide(
          title: 'Save some CPU cycles & battery',
          titleHighlight: 'Save',
          titleOnCard: false,
          bullets: [
            'Manage active animations',
            'Disable animations on visible screens',
          ],
          endBuilder: (context) => const Expanded(
            child: ImpaktfullUiCard(
              height: double.infinity,
              alignment: Alignment.center,
              child: ImpaktfullSlidesCodeWidget(
                code: ImpaktfullSlideCodeData(
                  code: '''
IndexedStack(
  index: _selectedIndex,
  children: [
    TickerMode(
      enabled: _selectedIndex == 0,
      child: PageWithHeavyAnimation(),
    ),
    TickerMode(
      enabled: _selectedIndex == 1,
      child: AnotherPage(),
    ),
  ],
)
              ''',
                ),
              ),
            ),
          ),
        ),
        ImpaktfullBulletsSlide(
          title: 'Other widgets',
          titleHighlight: 'Other',
          titleOnCard: false,
          bullets: [
            'Offstage\n (removes widget from tree still ticking)',
            'IgnorePointer\n(blocks interaction)',
            'Visibility\n(hides the UI, removes size, stage, animation)',
          ],
          endBuilder: (context) => const Expanded(
            child: ImpaktfullSlidesPerformanceOverlayCard(
              height: double.infinity,
              child: TickerModeOtherWidgets(),
            ),
          ),
        ),
        ImpaktfullBulletsSlide(
          title: 'Use Visibility to manage everything at once!',
          titleHighlight: 'Visibility',
          titleOnCard: false,
          bullets: [
            'The all in one widget:',
            'Offstage',
            'IgnorePointer',
            'Visibility',
          ],
          endBuilder: (context) => const Expanded(
            child: ImpaktfullUiCard(
              height: double.infinity,
              alignment: Alignment.center,
              child: ImpaktfullSlidesCodeWidget(
                code: ImpaktfullSlideCodeData(code: '''
const Visibility({
    super.key,
    required this.child,
    this.replacement = const SizedBox.shrink(),
    this.visible = true,
    this.maintainState = false,
    this.maintainAnimation = false,
    this.maintainSize = false,
    this.maintainSemantics = false,
    this.maintainInteractivity = false,
})
'''),
              ),
            ),
          ),
        ),
      ];
}
