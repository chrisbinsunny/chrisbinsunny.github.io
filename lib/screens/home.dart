import 'package:flutter/material.dart';
import 'package:portfolio/components/contactCard.dart';
import 'package:portfolio/components/navPill.dart';
import 'package:portfolio/constants/theme.dart';
import 'package:portfolio/firebase/analytics.dart';
import 'package:portfolio/widgets/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    final compact = size.width < 600;

    final intro = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Texter("FOUNDER, TETHXR · BENGALURU", style: mono(context, color: theme.colorScheme.primary)),
        const SizedBox(height: 16),
        RichTexter(
          text: "Chrisbin Sunny",
          child: Text(
            "Chrisbin\nSunny",
            style: theme.textTheme.displayLarge!.copyWith(fontSize: compact ? 56 : 88),
          ),
        ),
        const SizedBox(height: 24),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Texter(
            "I build apps for phones, the web, TVs and cars. "
            "From a learning app loved by kids to Tethxr, a social app I made on my own.",
            style: theme.textTheme.bodyLarge!.copyWith(fontSize: 19, color: theme.colorScheme.onSurfaceVariant),
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            FilledButton(
              onPressed: () {
                AnalyticsService.logEvent("contactMeClicked");
                scrollToSection(context, 4);
              },
              child: const Text("Contact Me"),
            ),
            OutlinedButton(
              onPressed: () => scrollToSection(context, 3),
              child: const Text("View Projects"),
            ),
          ],
        ),
      ],
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        // Phones: name fills and centres the first screen; the card follows below.
        if (constraints.maxWidth < 600) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(
                  height: size.height,
                  // leaves room for the bottom tab bar
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 80),
                    child: Align(alignment: Alignment.centerLeft, child: _RiseIn(child: intro)),
                  ),
                ),
                const ContactCard(),
                const SizedBox(height: 48),
              ],
            ),
          );
        }
        return Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 1100, minHeight: size.height),
            padding: const EdgeInsets.fromLTRB(32, 120, 32, 64),
            alignment: Alignment.center,
            child: _RiseIn(
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                runSpacing: 56,
                spacing: 40,
                children: [
                  ConstrainedBox(constraints: const BoxConstraints(maxWidth: 600), child: intro),
                  const ContactCard(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/// The one orchestrated moment: hero rises in on load. Skipped with reduced motion.
class _RiseIn extends StatelessWidget {
  const _RiseIn({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.disableAnimationsOf(context)) return child;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeOutCubic,
      child: child,
      builder: (context, t, child) => Opacity(
        opacity: t,
        child: Transform.translate(offset: Offset(0, 24 * (1 - t)), child: child),
      ),
    );
  }
}
