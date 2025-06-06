import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_dimensions.dart';

/// Business Card Theme Extension
/// Định nghĩa theme riêng cho business cards
class BusinessCardTheme extends ThemeExtension<BusinessCardTheme> {
  const BusinessCardTheme({
    required this.backgroundColor,
    required this.shadowColor,
    required this.borderColor,
    required this.titleColor,
    required this.subtitleColor,
    required this.iconColor,
    required this.statusActiveColor,
    required this.statusInactiveColor,
    required this.elevation,
    required this.borderRadius,
    required this.padding,
  });

  final Color backgroundColor;
  final Color shadowColor;
  final Color borderColor;
  final Color titleColor;
  final Color subtitleColor;
  final Color iconColor;
  final Color statusActiveColor;
  final Color statusInactiveColor;
  final double elevation;
  final double borderRadius;
  final EdgeInsets padding;

  /// Dark theme cho Business Card
  static const BusinessCardTheme dark = BusinessCardTheme(
    backgroundColor: AppColors.cardDark,
    shadowColor: Colors.black26,
    borderColor: AppColors.outlineVariant,
    titleColor: AppColors.onSurfaceDark,
    subtitleColor: AppColors.onSurfaceVariantDark,
    iconColor: AppColors.businessAccent,
    statusActiveColor: AppColors.statusActive,
    statusInactiveColor: AppColors.statusInactive,
    elevation: AppDimensions.cardElevation,
    borderRadius: AppDimensions.cardRadius,
    padding: EdgeInsets.all(AppDimensions.cardPadding),
  );

  @override
  BusinessCardTheme copyWith({
    Color? backgroundColor,
    Color? shadowColor,
    Color? borderColor,
    Color? titleColor,
    Color? subtitleColor,
    Color? iconColor,
    Color? statusActiveColor,
    Color? statusInactiveColor,
    double? elevation,
    double? borderRadius,
    EdgeInsets? padding,
  }) {
    return BusinessCardTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      shadowColor: shadowColor ?? this.shadowColor,
      borderColor: borderColor ?? this.borderColor,
      titleColor: titleColor ?? this.titleColor,
      subtitleColor: subtitleColor ?? this.subtitleColor,
      iconColor: iconColor ?? this.iconColor,
      statusActiveColor: statusActiveColor ?? this.statusActiveColor,
      statusInactiveColor: statusInactiveColor ?? this.statusInactiveColor,
      elevation: elevation ?? this.elevation,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
    );
  }

  @override
  BusinessCardTheme lerp(BusinessCardTheme? other, double t) {
    if (other is! BusinessCardTheme) {
      return this;
    }
    return BusinessCardTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      titleColor: Color.lerp(titleColor, other.titleColor, t)!,
      subtitleColor: Color.lerp(subtitleColor, other.subtitleColor, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      statusActiveColor: Color.lerp(statusActiveColor, other.statusActiveColor, t)!,
      statusInactiveColor: Color.lerp(statusInactiveColor, other.statusInactiveColor, t)!,
      elevation: lerpDouble(elevation, other.elevation, t)!,
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t)!,
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
    );
  }
}

/// Status Indicator Theme Extension
/// Định nghĩa theme cho status indicators
class StatusIndicatorTheme extends ThemeExtension<StatusIndicatorTheme> {
  const StatusIndicatorTheme({
    required this.activeColor,
    required this.inactiveColor,
    required this.pendingColor,
    required this.successColor,
    required this.warningColor,
    required this.errorColor,
    required this.textStyle,
    required this.size,
    required this.borderRadius,
  });

  final Color activeColor;
  final Color inactiveColor;
  final Color pendingColor;
  final Color successColor;
  final Color warningColor;
  final Color errorColor;
  final TextStyle textStyle;
  final Size size;
  final double borderRadius;

  /// Dark theme cho Status Indicator
  static const StatusIndicatorTheme dark = StatusIndicatorTheme(
    activeColor: AppColors.statusActive,
    inactiveColor: AppColors.statusInactive,
    pendingColor: AppColors.statusPending,
    successColor: AppColors.success,
    warningColor: AppColors.warning,
    errorColor: AppColors.error,
    textStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
    ),
    size: Size(80, 24),
    borderRadius: AppDimensions.radiusS,
  );

  @override
  StatusIndicatorTheme copyWith({
    Color? activeColor,
    Color? inactiveColor,
    Color? pendingColor,
    Color? successColor,
    Color? warningColor,
    Color? errorColor,
    TextStyle? textStyle,
    Size? size,
    double? borderRadius,
  }) {
    return StatusIndicatorTheme(
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      pendingColor: pendingColor ?? this.pendingColor,
      successColor: successColor ?? this.successColor,
      warningColor: warningColor ?? this.warningColor,
      errorColor: errorColor ?? this.errorColor,
      textStyle: textStyle ?? this.textStyle,
      size: size ?? this.size,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  StatusIndicatorTheme lerp(StatusIndicatorTheme? other, double t) {
    if (other is! StatusIndicatorTheme) {
      return this;
    }
    return StatusIndicatorTheme(
      activeColor: Color.lerp(activeColor, other.activeColor, t)!,
      inactiveColor: Color.lerp(inactiveColor, other.inactiveColor, t)!,
      pendingColor: Color.lerp(pendingColor, other.pendingColor, t)!,
      successColor: Color.lerp(successColor, other.successColor, t)!,
      warningColor: Color.lerp(warningColor, other.warningColor, t)!,
      errorColor: Color.lerp(errorColor, other.errorColor, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      size: Size.lerp(size, other.size, t)!,
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t)!,
    );
  }
}

/// Navigation Theme Extension
/// Định nghĩa theme cho navigation components
class NavigationTheme extends ThemeExtension<NavigationTheme> {
  const NavigationTheme({
    required this.backgroundColor,
    required this.selectedColor,
    required this.unselectedColor,
    required this.indicatorColor,
    required this.dividerColor,
    required this.elevation,
    required this.selectedTextStyle,
    required this.unselectedTextStyle,
  });

  final Color backgroundColor;
  final Color selectedColor;
  final Color unselectedColor;
  final Color indicatorColor;
  final Color dividerColor;
  final double elevation;
  final TextStyle selectedTextStyle;
  final TextStyle unselectedTextStyle;

  /// Dark theme cho Navigation
  static const NavigationTheme dark = NavigationTheme(
    backgroundColor: AppColors.surfaceDark,
    selectedColor: AppColors.primary,
    unselectedColor: AppColors.onSurfaceVariantDark,
    indicatorColor: AppColors.primary,
    dividerColor: AppColors.outlineVariant,
    elevation: AppDimensions.elevationM,
    selectedTextStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: AppColors.primary,
    ),
    unselectedTextStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.onSurfaceVariantDark,
    ),
  );

  @override
  NavigationTheme copyWith({
    Color? backgroundColor,
    Color? selectedColor,
    Color? unselectedColor,
    Color? indicatorColor,
    Color? dividerColor,
    double? elevation,
    TextStyle? selectedTextStyle,
    TextStyle? unselectedTextStyle,
  }) {
    return NavigationTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      selectedColor: selectedColor ?? this.selectedColor,
      unselectedColor: unselectedColor ?? this.unselectedColor,
      indicatorColor: indicatorColor ?? this.indicatorColor,
      dividerColor: dividerColor ?? this.dividerColor,
      elevation: elevation ?? this.elevation,
      selectedTextStyle: selectedTextStyle ?? this.selectedTextStyle,
      unselectedTextStyle: unselectedTextStyle ?? this.unselectedTextStyle,
    );
  }

  @override
  NavigationTheme lerp(NavigationTheme? other, double t) {
    if (other is! NavigationTheme) {
      return this;
    }
    return NavigationTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      selectedColor: Color.lerp(selectedColor, other.selectedColor, t)!,
      unselectedColor: Color.lerp(unselectedColor, other.unselectedColor, t)!,
      indicatorColor: Color.lerp(indicatorColor, other.indicatorColor, t)!,
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t)!,
      elevation: lerpDouble(elevation, other.elevation, t)!,
      selectedTextStyle: TextStyle.lerp(selectedTextStyle, other.selectedTextStyle, t)!,
      unselectedTextStyle: TextStyle.lerp(unselectedTextStyle, other.unselectedTextStyle, t)!,
    );
  }
}

/// Form Theme Extension
/// Định nghĩa theme cho form components
class FormTheme extends ThemeExtension<FormTheme> {
  const FormTheme({
    required this.backgroundColor,
    required this.borderColor,
    required this.focusedBorderColor,
    required this.errorBorderColor,
    required this.labelColor,
    required this.hintColor,
    required this.errorColor,
    required this.borderRadius,
    required this.padding,
  });

  final Color backgroundColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final Color labelColor;
  final Color hintColor;
  final Color errorColor;
  final double borderRadius;
  final EdgeInsets padding;

  /// Dark theme cho Form
  static const FormTheme dark = FormTheme(
    backgroundColor: AppColors.surfaceVariantDark,
    borderColor: AppColors.outline,
    focusedBorderColor: AppColors.primary,
    errorBorderColor: AppColors.error,
    labelColor: AppColors.onSurfaceVariantDark,
    hintColor: AppColors.onSurfaceVariantDark,
    errorColor: AppColors.error,
    borderRadius: AppDimensions.inputRadius,
    padding: EdgeInsets.all(AppDimensions.inputPadding),
  );

  @override
  FormTheme copyWith({
    Color? backgroundColor,
    Color? borderColor,
    Color? focusedBorderColor,
    Color? errorBorderColor,
    Color? labelColor,
    Color? hintColor,
    Color? errorColor,
    double? borderRadius,
    EdgeInsets? padding,
  }) {
    return FormTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      focusedBorderColor: focusedBorderColor ?? this.focusedBorderColor,
      errorBorderColor: errorBorderColor ?? this.errorBorderColor,
      labelColor: labelColor ?? this.labelColor,
      hintColor: hintColor ?? this.hintColor,
      errorColor: errorColor ?? this.errorColor,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
    );
  }

  @override
  FormTheme lerp(FormTheme? other, double t) {
    if (other is! FormTheme) {
      return this;
    }
    return FormTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      focusedBorderColor: Color.lerp(focusedBorderColor, other.focusedBorderColor, t)!,
      errorBorderColor: Color.lerp(errorBorderColor, other.errorBorderColor, t)!,
      labelColor: Color.lerp(labelColor, other.labelColor, t)!,
      hintColor: Color.lerp(hintColor, other.hintColor, t)!,
      errorColor: Color.lerp(errorColor, other.errorColor, t)!,
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t)!,
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
    );
  }
}

/// Helper function to get double lerp
double lerpDouble(double a, double b, double t) {
  return a + (b - a) * t;
} 