import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatTextProvider = Provider((ref) {
  TextEditingController _textEditingController = TextEditingController();
  return _textEditingController;
});