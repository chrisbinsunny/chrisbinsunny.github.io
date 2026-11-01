import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Contrast vs surface: content 17.7/18.6:1, secondary 8.4/7.6:1, accent 10.3/5.1:1 (dark/light).
ThemeData buildTheme(Brightness brightness) {
  final dark = brightness == Brightness.dark;
  final scheme = ColorScheme(
    brightness: brightness,
    surface: dark ? const Color(0xff0b0d10) : const Color(0xfffafaf9),
    surfaceContainer: dark ? const Color(0xff15181d) : const Color(0xffffffff),
    onSurface: dark ? const Color(0xfff2f4f7) : const Color(0xff0b0d10),
    onSurfaceVariant: dark ? const Color(0xffa3abb8) : const Color(0xff4a5160),
    primary: dark ? const Color(0xff5dc8f8) : const Color(0xff0a6fb8),
    onPrimary: dark ? const Color(0xff0b0d10) : const Color(0xffffffff),
    outlineVariant: dark ? const Color(0xff262a31) : const Color(0xffe4e6ea),
    outline: dark ? const Color(0xff3a404a) : const Color(0xffc9cdd4),
    secondary: dark ? const Color(0xff5dc8f8) : const Color(0xff0a6fb8),
    onSecondary: dark ? const Color(0xff0b0d10) : const Color(0xffffffff),
    error: const Color(0xffd93025),
    onError: const Color(0xffffffff),
  );
  final text = GoogleFonts.geistTextTheme(
    ThemeData(brightness: brightness).textTheme,
  ).apply(bodyColor: scheme.onSurface, displayColor: scheme.onSurface);

  return ThemeData(
    colorScheme: scheme,
    scaffoldBackgroundColor: scheme.surface,
    textTheme: text.copyWith(
      displayLarge: text.displayLarge!.copyWith(fontSize: 72, fontWeight: FontWeight.w700, letterSpacing: -2, height: 1.05),
      headlineLarge: text.headlineLarge!.copyWith(fontSize: 40, fontWeight: FontWeight.w600, letterSpacing: -1, height: 1.15),
      titleLarge: text.titleLarge!.copyWith(fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: -0.3),
      bodyLarge: text.bodyLarge!.copyWith(fontSize: 17, height: 1.5),
      bodyMedium: text.bodyMedium!.copyWith(fontSize: 15, height: 1.5, color: scheme.onSurfaceVariant),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(44, 48),
        padding: const EdgeInsets.symmetric(horizontal: 22),
        textStyle: GoogleFonts.geist(fontSize: 16, fontWeight: FontWeight.w600),
        shape: const StadiumBorder(),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(44, 48),
        padding: const EdgeInsets.symmetric(horizontal: 22),
        foregroundColor: scheme.onSurface,
        side: BorderSide(color: scheme.outline),
        textStyle: GoogleFonts.geist(fontSize: 16, fontWeight: FontWeight.w600),
        shape: const StadiumBorder(),
      ),
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStatePropertyAll(scheme.outline),
    ),
  );
}

/// Utility face for dates, stats and tags.
TextStyle mono(BuildContext context, {double size = 13, Color? color}) =>
    GoogleFonts.geistMono(
      fontSize: size,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.2,
      color: color ?? Theme.of(context).colorScheme.onSurfaceVariant,
    );
