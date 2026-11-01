import 'package:flutter/material.dart';
import 'package:portfolio/constants/theme.dart';
import 'package:portfolio/firebase/analytics.dart';
import 'package:portfolio/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

// Update on each Tethxr release.
const _latestVersion = '1.5.3';

const _details = [
  'See who else is around you right now, at a café, an event or on campus.',
  'Start a chat and meet in person.',
  'Your exact location is never shared, and you choose when people can see you.',
  'Chats are private and protected.',
  'Available on iPhone and Android.',
  'Designed, built and launched by me, from scratch.',
];

class Latest extends StatelessWidget {
  const Latest({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final wide = MediaQuery.sizeOf(context).width >= 900;

    final image = ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: const AspectRatio(
        aspectRatio: 1203 / 630,
        child: Imager(
          path: "images/tethxr.jpg",
          altText: "Tethxr, a social app for meeting people in the same physical space.",
        ),
      ),
    );

    final info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Texter("FOUNDER & SOLE DEVELOPER", style: mono(context)),
        const SizedBox(height: 12),
        Texter("Tethxr", style: theme.textTheme.headlineLarge!.copyWith(fontSize: 48)),
        const SizedBox(height: 8),
        Texter("An app that helps you meet the people who are in the same place as you.",
            style: theme.textTheme.bodyLarge!.copyWith(color: theme.colorScheme.onSurfaceVariant)),
        const SizedBox(height: 28),
        Texter(_latestVersion, style: mono(context, size: 24, color: theme.colorScheme.onSurface)),
        Texter("latest version", style: theme.textTheme.bodyMedium!),
        const SizedBox(height: 28),
        Linker(
          name: "Tethxr",
          link: "https://tethxr.com",
          child: FilledButton.icon(
            onPressed: () {
              AnalyticsService.logProjectLaunched("Tethxr");
              launchUrl(Uri.parse("https://tethxr.com"));
            },
            icon: const Icon(Icons.arrow_outward_rounded, size: 18),
            label: const Text("Visit tethxr.com"),
          ),
        ),
      ],
    );

    final list = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final d in _details)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 9, right: 12),
                  child: Icon(Icons.circle, size: 6, color: theme.colorScheme.primary),
                ),
                Expanded(child: Texter(d, style: theme.textTheme.bodyMedium!.copyWith(color: theme.colorScheme.onSurface))),
              ],
            ),
          ),
      ],
    );

    return Section(
      eyebrow: "Latest",
      title: "Built from scratch, shipped solo.",
      child: Panel(
        padding: EdgeInsets.all(wide ? 32 : 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            image,
            SizedBox(height: wide ? 40 : 28),
            wide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: info),
                      const SizedBox(width: 48),
                      Expanded(child: list),
                    ],
                  )
                : Column(children: [info, const SizedBox(height: 28), list]),
          ],
        ),
      ),
    );
  }
}
