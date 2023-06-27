import 'package:flutter/material.dart';

import '../Colors/Colors.dart';

textFiledDecoration(String label) {
  return InputDecoration(
    label: Text(
      label,
      style: const TextStyle(color: grey1),
    ),
    border: InputBorder.none,
  );
}

textFiledContainer({required Widget textField}) {
  return Container(
    decoration: BoxDecoration(
      color: textFiledColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(10),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: textField,
  );
}
