import 'package:flutter/material.dart';

String lorem =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

class ColorScheme {
  final Color v1100;
  final Color v100;
  final Color v90;
  final Color v80;
  final Color v70;
  final Color v60;
  final Color v50;
  final Color v40;
  final Color v30;
  final Color v20;
  final Color v10;
  final Color v0;
  ColorScheme(this.v1100, this.v100, this.v90, this.v80, this.v70, this.v60, this.v50, this.v40, this.v30, this.v20,
      this.v10, this.v0);
}

class SquareColorScheme {
  final Color v120;
  final Color v110;
  final Color v100;
  final Color v90;
  final Color v80;
  final Color v70;
  final Color v60;
  final Color v50;
  final Color v40;
  final Color v30;
  final Color v20;
  final Color v10;
  final Color v0;

  SquareColorScheme(
    this.v120,
    this.v110,
    this.v100,
    this.v90,
    this.v80,
    this.v70,
    this.v60,
    this.v50,
    this.v40,
    this.v30,
    this.v20,
    this.v10,
    this.v0,
  );
}

// first 2 digits: alpha
// the rest: color code

const squareartPrimary100 = Color(0xff43929A);
const squareartPrimary30 = Color(0xffCCE6E9);
const squareartPrimary40 = Color(0xffD7D7D7);
const squareartPrimary20 = Color(0xffDAEDEF);
const squareartPrimary10 = Color(0xffF5FAFB);
const squareartSecondary100 = Color(0xffDA930E);
const squareartSecondary900 = Color(0xffFEF6E9);

const facebookColor = Color(0xff1877F2);

final ColorScheme squareartNeutral = ColorScheme(
  const Color(0xff170304), // SOLID BLACK
  const Color(0xff0B0202), // squareartNeutral100
  const Color(0xff333333), // squareartNeutral90
  const Color(0xff5D595A), // squareartNeutral80
  const Color(0xff727272), // squareartNeutral70
  const Color(0xff949796), // squareartNeutral60
  const Color(0xffACAEAD), // squareartNeutral50
  const Color(0xffE1E1E1), // squareartNeutral40
  const Color(0xffECECEC), // squareartNeutral30
  const Color(0xffF6F6F6), // squareartNeutral20
  const Color(0xffFCFCFC), // squareartNeutral10
  const Color(0xffFFFFFF), // squareartNeutral0
);

// OTHERS
const squareartGrey1 = Color(0xff333333);
const squareartGrey3 = Color(0xff828282);
const squareartSuccess = Color(0xff5CB85D);
const squareartSuccessSoft = Color(0xffE5F4E5);
const squareartSave = Color(0xff095CAA);
const squareartWarning = Color(0xffFFC400);
const squareartWarningSoft = Color(0xffFFF7D9);
const squareartError = Color(0xffD21A1A);
const squareartError1 = Color.fromARGB(255, 163, 22, 22);
const squareartErrorSoft = Color(0xffFBDDDD);
const squareartTransparent = Color(0xffffffff);

List<BoxShadow> shadowList = [BoxShadow(color: Colors.grey[300]!, blurRadius: 30, offset: const Offset(0, 10))];

final SquareColorScheme squareArtPrimary = SquareColorScheme(
  const Color(0xff020202),
  const Color(0xff1F1F1F),
  const Color(0xff333333),
  const Color(0xff474747),
  const Color(0xff5A5A5A),
  const Color(0xff646464),
  const Color(0xff9D9D9D),
  const Color(0xffB9B9B9),
  const Color(0xffD7D7D7),
  const Color(0xffEBEBEB),
  const Color(0xffF6F6F6),
  const Color(0xffFCFCFC),
  const Color(0xffFFFFFF),
);

final SquareColorScheme squareArtSecondary = SquareColorScheme(
  const Color(0xffC7870D),
  const Color(0xffDA930E),
  const Color(0xffECA00F),
  const Color(0xffF2AF30),
  const Color(0xffF3B643),
  const Color(0xffF4BE55),
  const Color(0xffF7CC7A),
  const Color(0xffF8D38D),
  const Color(0xffF9DA9F),
  const Color(0xffFBE8C4),
  const Color(0xffFCEFD6),
  const Color(0xffFEF6E9),
  const Color(0xffFEF6E9),
);

const squareArtSuccess1 = Color(0xff17960C);
const squareArtSuccess2 = Color(0xffE6F9E5);

const squareArtWawrning1 = Color(0xffDAAB06);
const squareArtWawrning2 = Color(0xffFFFBE7);

const squareArtDanger1 = Color(0xffBD271E);
const squareArtDanger2 = Color(0xffF8E9E9);
const squareArtDanger3 = Color(0xffEC2F23);

const squareArtActionOrange = Color(0xffFFF1E3);
const squareArtActionOrangeDark = Color(0xffFF8D24);
const squareArtActionRed = Color(0xffF8E9E9);
const squareArtActionRedDark = Color(0xffBD271E);

const squareArtActionGreenDark = Color(0xff17960C);
const squareArtActionGreen = Color(0xffE6F9E5);

const squareArtActionYellowDark = Color(0xffDAAB06);
const squareArtActionYellow = Color(0xffFFFBE7);
