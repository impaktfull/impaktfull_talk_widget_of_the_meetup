import 'package:flutter/material.dart';
import 'package:impaktfull_slides/impaktfull_slides.dart';
import 'package:impaktfull_talk_slides_widget_of_the_meetup/src/slides/ticker_mode/widget/ticker_mode_animation.dart';

enum TickerModeOtherWidgetsType {
  offstage(title: 'Offstage'),
  ignorePointer(title: 'Ignore Pointer'),
  visibility(title: 'Visibility');

  final String title;

  const TickerModeOtherWidgetsType({required this.title});
}

class TickerModeOtherWidgets extends StatefulWidget {
  const TickerModeOtherWidgets({super.key});

  @override
  State<TickerModeOtherWidgets> createState() => _TickerModeOtherWidgetsState();
}

class _TickerModeOtherWidgetsState extends State<TickerModeOtherWidgets> {
  TickerModeOtherWidgetsType _type = TickerModeOtherWidgetsType.offstage;
  var _value = true;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiAutoLayout.vertical(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16,
      children: [
        if (_type == TickerModeOtherWidgetsType.offstage) ...[
          Expanded(
            child: Offstage(
              offstage: !_value,
              child: const TickerModeAnimation(),
            ),
          ),
        ] else if (_type == TickerModeOtherWidgetsType.ignorePointer) ...[
          Expanded(
            child: IgnorePointer(
              ignoring: !_value,
              child: ImpaktfullUiTouchFeedback(
                onTap: _onTap,
                child: const TickerModeAnimation(),
              ),
            ),
          ),
        ] else if (_type == TickerModeOtherWidgetsType.visibility) ...[
          Expanded(
            child: Visibility(
              visible: _value,
              child: const TickerModeAnimation(),
            ),
          ),
        ],
        ImpaktfullUiAutoLayout.horizontal(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            Text(
              '${_getPrefixValue()}: ${_value ? 'yes' : 'no'}',
              style: theme.textStyles.onAccent.text.medium,
            ),
            ImpaktfullUiSwitch(
              value: _value,
              onChanged: _onValueChanged,
            ),
          ],
        ),
        ImpaktfullUiAutoLayout.horizontal(
          spacing: 8,
          children: [
            Expanded(
              child: TickerModeOtherWidgetsListItem(
                type: TickerModeOtherWidgetsType.offstage,
                selectedType: _type,
                onChangedType: _onChangedType,
              ),
            ),
            Expanded(
              child: TickerModeOtherWidgetsListItem(
                type: TickerModeOtherWidgetsType.ignorePointer,
                selectedType: _type,
                onChangedType: _onChangedType,
              ),
            ),
            Expanded(
              child: TickerModeOtherWidgetsListItem(
                type: TickerModeOtherWidgetsType.visibility,
                selectedType: _type,
                onChangedType: _onChangedType,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _onChangedType(TickerModeOtherWidgetsType type) {
    setState(() {
      _type = type;
      _value = true;
    });
  }

  void _onValueChanged(bool value) {
    setState(() {
      _value = value;
    });
  }

  void _onTap() => ImpaktfullUiNotification.show(title: 'Tapped');

  String _getPrefixValue() {
    if (_type == TickerModeOtherWidgetsType.ignorePointer) {
      return 'Allow touch events';
    }
    return 'Show loading';
  }
}

class TickerModeOtherWidgetsListItem extends StatelessWidget {
  final TickerModeOtherWidgetsType type;
  final TickerModeOtherWidgetsType selectedType;
  final ValueChanged<TickerModeOtherWidgetsType> onChangedType;
  const TickerModeOtherWidgetsListItem({
    required this.type,
    required this.selectedType,
    required this.onChangedType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiButton(
      type: selectedType == type ? ImpaktfullUiButtonType.primary : ImpaktfullUiButtonType.secondary,
      size: ImpaktfullUiButtonSize.extraLarge,
      onTap: () => onChangedType(type),
      title: type.title.toUpperCase(),
    );
  }
}
