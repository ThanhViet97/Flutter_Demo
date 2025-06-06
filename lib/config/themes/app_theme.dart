import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'theme_extensions.dart';

/// Cấu hình theme chính cho ứng dụng
/// Tuân thủ Material Design 3 và business requirements
class AppTheme {
  AppTheme._();

  /// Dark Theme cho Business App
  static ThemeData get darkTheme {
    const colorScheme = ColorScheme.dark(
      brightness: Brightness.dark,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      tertiary: AppColors.businessAccent,
      onTertiary: AppColors.onPrimary,
      error: AppColors.error,
      onError: AppColors.onError,
      errorContainer: AppColors.errorContainer,
      onErrorContainer: AppColors.onErrorContainer,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.onSurfaceDark,
      surfaceContainerHighest: AppColors.surfaceVariantDark,
      onSurfaceVariant: AppColors.onSurfaceVariantDark,
      outline: AppColors.outline,
      outlineVariant: AppColors.outlineVariant,
      surfaceTint: AppColors.surfaceTint,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      brightness: Brightness.dark,

      // ==================== VISUAL DENSITY ====================
      visualDensity: VisualDensity.adaptivePlatformDensity,

      // ==================== CUSTOM THEME EXTENSIONS ====================
      extensions: const <ThemeExtension<dynamic>>[
        BusinessCardTheme.dark,
        StatusIndicatorTheme.dark,
        NavigationTheme.dark,
        FormTheme.dark,
      ],

      // ==================== TYPOGRAPHY ====================
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.displayLarge,
        displayMedium: AppTextStyles.displayMedium,
        displaySmall: AppTextStyles.displaySmall,
        headlineLarge: AppTextStyles.headlineLarge,
        headlineMedium: AppTextStyles.headlineMedium,
        headlineSmall: AppTextStyles.headlineSmall,
        titleLarge: AppTextStyles.titleLarge,
        titleMedium: AppTextStyles.titleMedium,
        titleSmall: AppTextStyles.titleSmall,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodySmall,
        labelLarge: AppTextStyles.labelLarge,
        labelMedium: AppTextStyles.labelMedium,
        labelSmall: AppTextStyles.labelSmall,
      ),

      // ==================== APP BAR THEME ====================
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 1,
        backgroundColor: AppColors.surfaceDark,
        foregroundColor: AppColors.onSurfaceDark,
        surfaceTintColor: AppColors.primary,
        titleTextStyle: AppTextStyles.titleLarge,
        toolbarTextStyle: AppTextStyles.bodyMedium,
        iconTheme: IconThemeData(
          color: AppColors.onSurfaceDark,
          size: 24,
        ),
        actionsIconTheme: IconThemeData(
          color: AppColors.onSurfaceDark,
          size: 24,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),

      // ==================== SCAFFOLD THEME ====================
      scaffoldBackgroundColor: AppColors.backgroundDark,

      // ==================== CARD THEME ====================
      cardTheme: CardThemeData(
        color: AppColors.cardDark,
        surfaceTintColor: AppColors.surfaceTint,
        elevation: 2,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        clipBehavior: Clip.antiAlias,
      ),

      // ==================== ELEVATED BUTTON THEME ====================
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          elevation: 2,
          shadowColor: Colors.black.withOpacity(0.2),
          surfaceTintColor: AppColors.primary,
          textStyle: AppTextStyles.labelLarge,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: const Size(64, 40),
        ),
      ),

      // ==================== OUTLINED BUTTON THEME ====================
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: AppTextStyles.labelLarge,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          side: const BorderSide(
            color: AppColors.outline,
            width: 1,
          ),
          minimumSize: const Size(64, 40),
        ),
      ),

      // ==================== TEXT BUTTON THEME ====================
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: AppTextStyles.labelLarge,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: const Size(64, 40),
        ),
      ),

      // ==================== FLOATING ACTION BUTTON THEME ====================
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        elevation: 6,
        highlightElevation: 8,
        splashColor: AppColors.primaryVariant,
        shape: CircleBorder(),
      ),

      // ==================== INPUT DECORATION THEME ====================
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceVariantDark,
        hintStyle: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.onSurfaceVariantDark,
        ),
        labelStyle: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.onSurfaceVariantDark,
        ),
        errorStyle: AppTextStyles.errorText,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.outline,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.outline,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 2,
          ),
        ),
      ),

      // ==================== BOTTOM NAVIGATION BAR THEME ====================
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.surfaceDark,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.onSurfaceVariantDark,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        selectedLabelStyle: AppTextStyles.labelSmall,
        unselectedLabelStyle: AppTextStyles.labelSmall,
      ),

      // ==================== NAVIGATION BAR THEME ====================
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.surfaceDark,
        indicatorColor: AppColors.primary.withOpacity(0.12),
        elevation: 3,
        labelTextStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppTextStyles.labelSmall.copyWith(
              color: AppColors.primary,
            );
          }
          return AppTextStyles.labelSmall.copyWith(
            color: AppColors.onSurfaceVariantDark,
          );
        }),
        iconTheme: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return const IconThemeData(
              color: AppColors.primary,
              size: 24,
            );
          }
          return const IconThemeData(
            color: AppColors.onSurfaceVariantDark,
            size: 24,
          );
        }),
      ),

      // ==================== DRAWER THEME ====================
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.surfaceDark,
        surfaceTintColor: AppColors.surfaceTint,
        elevation: 16,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
      ),

      // ==================== LIST TILE THEME ====================
      listTileTheme: const ListTileThemeData(
        tileColor: Colors.transparent,
        selectedTileColor: AppColors.primary,
        selectedColor: AppColors.onPrimary,
        textColor: AppColors.onSurfaceDark,
        iconColor: AppColors.onSurfaceVariantDark,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        titleTextStyle: AppTextStyles.titleMedium,
        subtitleTextStyle: AppTextStyles.bodyMedium,
        leadingAndTrailingTextStyle: AppTextStyles.labelMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),

      // ==================== DIVIDER THEME ====================
      dividerTheme: const DividerThemeData(
        color: AppColors.outlineVariant,
        thickness: 1,
        space: 1,
      ),

      // ==================== ICON THEME ====================
      iconTheme: const IconThemeData(
        color: AppColors.onSurfaceDark,
        size: 24,
      ),
      primaryIconTheme: const IconThemeData(
        color: AppColors.primary,
        size: 24,
      ),

      // ==================== CHIP THEME ====================
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surfaceVariantDark,
        disabledColor: AppColors.onSurfaceVariantDark.withOpacity(0.12),
        selectedColor: AppColors.primary,
        secondarySelectedColor: AppColors.secondary,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        labelStyle: AppTextStyles.labelMedium,
        secondaryLabelStyle: AppTextStyles.labelMedium,
        brightness: Brightness.dark,
        elevation: 0,
        pressElevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      // ==================== DIALOG THEME ====================
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.surfaceDark,
        surfaceTintColor: AppColors.surfaceTint,
        elevation: 24,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        titleTextStyle: AppTextStyles.headlineSmall,
        contentTextStyle: AppTextStyles.bodyMedium,
      ),

      // ==================== BOTTOM SHEET THEME ====================
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.surfaceDark,
        surfaceTintColor: AppColors.surfaceTint,
        modalBackgroundColor: AppColors.surfaceDark,
        elevation: 8,
        modalElevation: 16,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        clipBehavior: Clip.antiAlias,
      ),

      // ==================== SNACK BAR THEME ====================
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.surfaceVariantDark,
        contentTextStyle: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.onSurfaceDark,
        ),
        actionTextColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      // ==================== PROGRESS INDICATOR THEME ====================
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
        linearTrackColor: AppColors.outlineVariant,
        circularTrackColor: AppColors.outlineVariant,
      ),

      // ==================== SWITCH THEME ====================
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.primary;
          }
          return AppColors.outline;
        }),
        trackColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.primary.withOpacity(0.5);
          }
          return AppColors.outlineVariant;
        }),
      ),

      // ==================== CHECKBOX THEME ====================
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.primary;
          }
          return Colors.transparent;
        }),
        checkColor: MaterialStateProperty.all(AppColors.onPrimary),
        side: const BorderSide(
          color: AppColors.outline,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),

      // ==================== RADIO THEME ====================
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.primary;
          }
          return AppColors.outline;
        }),
      ),

      // ==================== SLIDER THEME ====================
      sliderTheme: const SliderThemeData(
        activeTrackColor: AppColors.primary,
        inactiveTrackColor: AppColors.outlineVariant,
        thumbColor: AppColors.primary,
        overlayColor: AppColors.primary,
        valueIndicatorColor: AppColors.primary,
        valueIndicatorTextStyle: AppTextStyles.labelSmall,
      ),

      // ==================== TAB BAR THEME ====================
      tabBarTheme: const TabBarThemeData(
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.onSurfaceVariantDark,
        indicatorColor: AppColors.primary,
        labelStyle: AppTextStyles.titleSmall,
        unselectedLabelStyle: AppTextStyles.titleSmall,
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
      ),

      // ==================== TOOLTIP THEME ====================
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: AppColors.surfaceVariantDark,
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: AppTextStyles.bodySmall.copyWith(
          color: AppColors.onSurfaceDark,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
      ),
    );
  }

  /// System UI Overlay Style cho Dark Theme
  static const SystemUiOverlayStyle darkSystemUiOverlayStyle = 
      SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: AppColors.backgroundDark,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarDividerColor: Colors.transparent,
  );
} 