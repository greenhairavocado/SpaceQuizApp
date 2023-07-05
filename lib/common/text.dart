import 'package:flutter/material.dart';

Widget text({required String text, TextStyle? style}) {
  return Text(
    text,
    style: style ?? const TextStyle(),
  );
}
