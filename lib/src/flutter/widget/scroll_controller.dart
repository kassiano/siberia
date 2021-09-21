import 'package:flutter/widgets.dart';

extension ScrollControllerExtensions on ScrollController {
  /// Verifies if scroll has reach the end of it.
  bool get hasReachTheEndOfScroll {
    return offset >= position.maxScrollExtent && !position.outOfRange;
  }
}
