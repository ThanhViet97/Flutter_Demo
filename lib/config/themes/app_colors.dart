import 'package:flutter/material.dart';

/// Định nghĩa màu sắc cho ứng dụng
/// Tuân thủ Material Design 3 và business theme requirements
class AppColors {
  AppColors._();

  // ==================== PRIMARY COLORS ====================
  /// Màu chính của app - Professional Blue
  static const Color primary = Color(0xFF1976D2);
  static const Color primaryVariant = Color(0xFF0D47A1);
  static const Color onPrimary = Color(0xFFFFFFFF);

  // ==================== SECONDARY COLORS ====================
  /// Màu phụ - Accent Teal
  static const Color secondary = Color(0xFF00BCD4);
  static const Color secondaryVariant = Color(0xFF00838F);
  static const Color onSecondary = Color(0xFF000000);

  // ==================== DARK THEME COLORS ====================
  /// Background colors for dark theme
  static const Color backgroundDark = Color(0xFF0A0E13);
  static const Color surfaceDark = Color(0xFF1A1F25);
  static const Color surfaceVariantDark = Color(0xFF2A2F35);
  
  /// Card and elevated surfaces
  static const Color cardDark = Color(0xFF1E242A);
  static const Color elevatedSurfaceDark = Color(0xFF2C3239);

  /// Text colors for dark theme
  static const Color onBackgroundDark = Color(0xFFE8EAED);
  static const Color onSurfaceDark = Color(0xFFE8EAED);
  static const Color onSurfaceVariantDark = Color(0xFFBDC1C6);

  // ==================== ERROR COLORS ====================
  static const Color error = Color(0xFFCF6679);
  static const Color onError = Color(0xFF000000);
  static const Color errorContainer = Color(0xFF93000A);
  static const Color onErrorContainer = Color(0xFFFFDAD6);

  // ==================== SUCCESS COLORS ====================
  static const Color success = Color(0xFF4CAF50);
  static const Color onSuccess = Color(0xFFFFFFFF);
  static const Color successContainer = Color(0xFF2E7D32);
  static const Color onSuccessContainer = Color(0xFFC8E6C9);

  // ==================== WARNING COLORS ====================
  static const Color warning = Color(0xFFFF9800);
  static const Color onWarning = Color(0xFF000000);
  static const Color warningContainer = Color(0xFFF57C00);
  static const Color onWarningContainer = Color(0xFFFFE0B2);

  // ==================== NEUTRAL COLORS ====================
  /// Shades of gray for borders, dividers, disabled states
  static const Color outline = Color(0xFF79747E);
  static const Color outlineVariant = Color(0xFF49454F);
  static const Color surfaceTint = primary;

  // ==================== BUSINESS SPECIFIC COLORS ====================
  /// Professional colors for business applications
  static const Color businessAccent = Color(0xFF6C63FF);
  static const Color businessSecondary = Color(0xFF8B5CF6);
  static const Color businessNeutral = Color(0xFF6B7280);

  /// Status colors
  static const Color statusActive = Color(0xFF10B981);
  static const Color statusInactive = Color(0xFF6B7280);
  static const Color statusPending = Color(0xFFF59E0B);

  // ==================== GRADIENT COLORS ====================
  /// Gradient colors for modern UI elements
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF1976D2),
      Color(0xFF1565C0),
    ],
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF00BCD4),
      Color(0xFF0097A7),
    ],
  );

  static const LinearGradient businessGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF6C63FF),
      Color(0xFF8B5CF6),
    ],
  );

  // ==================== HELPER METHODS ====================
  /// Get color with opacity
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }

  /// Get contrasting text color for a background
  static Color getContrastingTextColor(Color backgroundColor) {
    return backgroundColor.computeLuminance() > 0.5 
        ? Colors.black 
        : Colors.white;
  }
} 