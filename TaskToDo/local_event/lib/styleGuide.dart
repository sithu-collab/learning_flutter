import 'package:flutter/cupertino.dart';

final TextStyle fadedTextStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: Color(0xFFFFFFFF)
);

final TextStyle whiteHeadingTextStyle = TextStyle(
    fontSize: 34.0,
    fontWeight: FontWeight.bold,
    color: Color(0xFFFFFFFF)
);

final TextStyle categoryTextStyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: Color(0xFFFFFFFF)
);

final TextStyle selectedCategoryTextStyle = categoryTextStyle.copyWith(
  color: Color(0xffff4700),
);

final TextStyle eventTitleTextStyle = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Color(0xFFFFFFFF)
);

final TextStyle eventWhiteTitleTextStyle = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: Color(0xFFFFFFFF)
);

final TextStyle eventLocationTextStyle = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Color(0xFF000000)
);

final TextStyle guestTextStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w800,
    color: Color(0xFF000000)
);

final TextStyle punchLine1TextStyle = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w800,
    color: Color(0xFFFF4700)
);

final TextStyle punchLine2TextStyle = punchLine1TextStyle.copyWith(
  color: Color(0xFF000000)
);