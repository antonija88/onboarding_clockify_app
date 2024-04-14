import 'package:flutter/material.dart';

abstract class AppSizes {
  static const double bodyHorizontalPadding = 16;
  static const double spacingSectionSm = 10;
  static const double spacingGridMd = 16;
  static const double spacingGridSm = 12;
  static const double spacingSM = 2;
  static const double spacingXSm = 4;
  static const double spacingXxSm = 6;
  static const double spacingXxxSm = 8;
  static const double spacingMd = 10;
  static const double spacingXMd = 12;
  static const double spacingXxMd = 16;
  static const double spacingLg = 24;
  static const double spacingXl = 28;
  static const double spacingXLg = 32;
  static const double spacingXxLg = 48;
  static const double spacingXxxLg = 64;
  static const double spacingBig = 128;
  static const double smallBorderRadius = 4;
  static const double normalBorderRadius = 8;
  static const double mediumBorderRadius = 16;
  static const double maxBorderRadius = 100;
  static const double tinyIconSize = 12;
  static const double smallIconSize = 16;
  static const double compactIconSize = 20;
  static const double normalIconSize = 24;
  static const double smallRoundedButtonSize = 36;
  static const double bigRoundedButtonSize = 56;
  static const double smallButtonWidth = 112;
  static const double smallButtonHeight = 40;
  static const double normalButtonHeight = 50;
  static const double pharmacyLogoWidth = 240;
  static const double pharmacyLogoHeight = 80;
  static const double apofinderMarkerSize = 54;
  static const double apofinderMinZoom = 12;
  static const double apofinderStaticMapHeight = 280;
  static const double bottomSheetTopOffset = 60;
  static const double searchAppBarHeight = 68;
  static const double searchAppBarHeightWithFilters = 152;
  static const double sectionSpacingDefault = 24;

  // ROUNDNESS
  static const double roundnessBox = 4;
  static const double roundnessLabels = 2;
  static const double extraSmallBorderRadius = 2;
  static const BorderRadius roundnessBottomSheet = BorderRadius.only(
    topRight: Radius.circular(16),
    topLeft: Radius.circular(16),
  );
  static const double onboardingImageSize = 180;
  static const Size progressDotsInactiveSize = Size(12, 6);
  static const Size progressDotsActiveSize = Size(22, 6);
  static const Size carouselDotsInactiveSize = Size(10, 4);
  static const Size carouselDotsActiveSize = Size(22, 4);

  // LIST
  static const double listItemSpacings = 6;
}
