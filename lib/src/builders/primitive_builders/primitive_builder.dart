import 'package:flutter/material.dart';
import 'package:flutter_json_view/src/theme/json_view_theme.dart';
import 'package:flutter_json_view/src/widgets/widgets.dart';

class PrimitiveBuilder extends StatelessWidget {
  const PrimitiveBuilder(
    this.jsonObj, {
    Key? key,
    required JsonViewTheme jsonViewTheme,
  })  : _jsonViewTheme = jsonViewTheme,
        super(key: key);

  final dynamic jsonObj;
  final JsonViewTheme _jsonViewTheme;

  @override
  Widget build(BuildContext context) {
    return _renderJsonWidgets(context);
  }

  Widget _renderJsonWidgets(BuildContext context) {
    if (jsonObj is int) {
      return PrimitiveJsonItem(
        jsonObj: jsonObj,
        textStyle: _jsonViewTheme.intStyle,
      );
    } else if (jsonObj is double) {
      return PrimitiveJsonItem(
        jsonObj: jsonObj,
        textStyle: _jsonViewTheme.doubleStyle,
      );
    } else if (jsonObj is String) {
      return PrimitiveJsonItem(
        jsonObj: '"$jsonObj"',
        textStyle: _jsonViewTheme.stringStyle,
      );
    } else if (jsonObj is bool) {
      return PrimitiveJsonItem(
        jsonObj: jsonObj,
        textStyle: _jsonViewTheme.boolStyle,
      );
    } else if (jsonObj == null) {
      return PrimitiveJsonItem(
        jsonObj: jsonObj,
        textStyle: _jsonViewTheme.boolStyle,
      );
    }
    return _jsonViewTheme.errorBuilder?.call(context, jsonObj) ??
        const Text('error');
  }
}
