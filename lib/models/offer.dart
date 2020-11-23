import 'package:flutter/widgets.dart';

class Offer {
  final String title;
  final String desc;
  final bool isBookmark;
  Offer({
    @required this.title,
    @required this.desc,
    this.isBookmark = false,
  });
}
