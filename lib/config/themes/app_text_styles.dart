import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Định nghĩa text styles cho ứng dụng
/// Tuân thủ Material Design 3 Typography Scale
class AppTextStyles {
  AppTextStyles._();

  // ==================== FONT FAMILIES ====================
  static const String primaryFont = 'SF Pro Display';
  static const String secondaryFont = 'SF Pro Text';
  static const String monoFont = 'SF Mono';

  // ==================== DISPLAY STYLES ====================
  /// Display Large - Used for hero text
  static const TextStyle displayLarge = TextStyle(
    fontSize: 57,
    fontWeight: FontWeight.w400,
    height: 1.12,
    letterSpacing: -0.25,
    color: AppColors.onBackgroundDark,
    fontFamily: primaryFont,
  );

  /// Display Medium - Used for section headers
  static const TextStyle displayMedium = TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.w400,
    height: 1.16,
    letterSpacing: 0,
    color: AppColors.onBackgroundDark,
    fontFamily: primaryFont,
  );

  /// Display Small - Used for sub-headers
  static const TextStyle displaySmall = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    height: 1.22,
    letterSpacing: 0,
    color: AppColors.onBackgroundDark,
    fontFamily: primaryFont,
  );

  // ==================== HEADLINE STYLES ====================
  /// Headline Large - Used for main page titles
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    height: 1.25,
    letterSpacing: 0,
    color: AppColors.onBackgroundDark,
    fontFamily: primaryFont,
  );

  /// Headline Medium - Used for card titles
  static const TextStyle headlineMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    height: 1.29,
    letterSpacing: 0,
    color: AppColors.onBackgroundDark,
    fontFamily: primaryFont,
  );

  /// Headline Small - Used for small section headers
  static const TextStyle headlineSmall = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    height: 1.33,
    letterSpacing: 0,
    color: AppColors.onBackgroundDark,
    fontFamily: primaryFont,
  );

  // ==================== TITLE STYLES ====================
  /// Title Large - Used for app bar titles
  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    height: 1.27,
    letterSpacing: 0,
    color: AppColors.onBackgroundDark,
    fontFamily: primaryFont,
  );

  /// Title Medium - Used for list item titles
  static const TextStyle titleMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.50,
    letterSpacing: 0.15,
    color: AppColors.onBackgroundDark,
    fontFamily: secondaryFont,
  );

  /// Title Small - Used for small component titles
  static const TextStyle titleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.43,
    letterSpacing: 0.1,
    color: AppColors.onBackgroundDark,
    fontFamily: secondaryFont,
  );

  // ==================== BODY STYLES ====================
  /// Body Large - Used for main content text
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.50,
    letterSpacing: 0.5,
    color: AppColors.onBackgroundDark,
    fontFamily: secondaryFont,
  );

  /// Body Medium - Used for secondary content
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.43,
    letterSpacing: 0.25,
    color: AppColors.onBackgroundDark,
    fontFamily: secondaryFont,
  );

  /// Body Small - Used for captions and small text
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.33,
    letterSpacing: 0.4,
    color: AppColors.onSurfaceVariantDark,
    fontFamily: secondaryFont,
  );

  // ==================== LABEL STYLES ====================
  /// Label Large - Used for button text
  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.43,
    letterSpacing: 0.1,
    color: AppColors.onBackgroundDark,
    fontFamily: secondaryFont,
  );

  /// Label Medium - Used for form labels
  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.33,
    letterSpacing: 0.5,
    color: AppColors.onBackgroundDark,
    fontFamily: secondaryFont,
  );

  /// Label Small - Used for helper text
  static const TextStyle labelSmall = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    height: 1.45,
    letterSpacing: 0.5,
    color: AppColors.onSurfaceVariantDark,
    fontFamily: secondaryFont,
  );

  // ==================== BUSINESS SPECIFIC STYLES ====================
  /// Business Card Title
  static const TextStyle businessCardTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 1.44,
    letterSpacing: 0,
    color: AppColors.onBackgroundDark,
    fontFamily: primaryFont,
  );

  /// Business Card Subtitle
  static const TextStyle businessCardSubtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.43,
    letterSpacing: 0.1,
    color: AppColors.onSurfaceVariantDark,
    fontFamily: secondaryFont,
  );

  /// Business Status Text
  static const TextStyle businessStatus = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    height: 1.33,
    letterSpacing: 0.8,
    color: AppColors.businessAccent,
    fontFamily: secondaryFont,
  );

  // ==================== SPECIAL STYLES ====================
  /// Code Text - Used for displaying code
  static const TextStyle codeText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.43,
    letterSpacing: 0,
    color: AppColors.businessAccent,
    fontFamily: monoFont,
    backgroundColor: AppColors.surfaceVariantDark,
  );

  /// Error Text
  static const TextStyle errorText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.33,
    letterSpacing: 0.4,
    color: AppColors.error,
    fontFamily: secondaryFont,
  );

  /// Success Text
  static const TextStyle successText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.33,
    letterSpacing: 0.4,
    color: AppColors.success,
    fontFamily: secondaryFont,
  );

  /// Warning Text
  static const TextStyle warningText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.33,
    letterSpacing: 0.4,
    color: AppColors.warning,
    fontFamily: secondaryFont,
  );

  // ==================== HELPER METHODS ====================
  /// Get text style with custom color
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  /// Get text style with custom font weight
  static TextStyle withWeight(TextStyle style, FontWeight weight) {
    return style.copyWith(fontWeight: weight);
  }

  /// Get text style with custom font size
  static TextStyle withSize(TextStyle style, double size) {
    return style.copyWith(fontSize: size);
  }
} 