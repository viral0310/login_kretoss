import 'package:flutter/material.dart';

titleText({required String title, required BuildContext context}) {
  return Text(
    title,
    style: Theme.of(context).textTheme.titleMedium?.merge(
          const TextStyle(fontWeight: FontWeight.w600),
        ),
  );
}

titleLarge({required BuildContext context, TextStyle? textStyle}) {
  return Theme.of(context).textTheme.titleLarge?.merge(textStyle);
}

titleMedium({required BuildContext context, TextStyle? textStyle}) {
  return Theme.of(context).textTheme.titleMedium?.merge(textStyle);
}

bodySmall({required BuildContext context, TextStyle? textStyle}) {
  return Theme.of(context).textTheme.bodySmall?.merge(textStyle);
}

bodyMedium({required BuildContext context, TextStyle? textStyle}) {
  return Theme.of(context).textTheme.bodyMedium?.merge(textStyle);
}

bodyLarge({required BuildContext context, TextStyle? textStyle}) {
  return Theme.of(context).textTheme.bodyLarge?.merge(textStyle);
}

displayMedium({required BuildContext context, TextStyle? textStyle}) {
  return Theme.of(context).textTheme.displayMedium?.merge(textStyle);
}
