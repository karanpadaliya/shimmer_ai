import 'package:flutter/widgets.dart';

bool isTextWidget(Widget w) => w is Text;

bool isImageWidget(Widget w) => w is Image;

bool isAvatar(Widget w) => w.runtimeType.toString().contains('CircleAvatar');
