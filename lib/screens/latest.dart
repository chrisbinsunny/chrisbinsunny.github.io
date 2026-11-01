import 'package:flutter/material.dart';
import 'package:portfolio/constants/theme.dart';
import 'package:portfolio/firebase/analytics.dart';
import 'package:portfolio/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

const _stats = [
  ('500+', 'users in month one'),
  ('350+', 'chats opened'),
  ('1.0 → 1.5.3', 'in 3 months'),
];

const _details = [
  'Designed, built and launched the app solo from scratch.',
  'Serverless, database-centric Supabase backend (SQL RPCs, Realtime, Auth, Edge Functions) with Firebase.',
  'Nearby-user detection over Wi-Fi, Bluetooth and GPS with opt-in visibility, never sharing exact location.',
  'Envelope-encrypted chat, decrypted in an iOS Notification Service Extension.',
  'Native iOS and Android cameras over Pigeon, making capture near-instant on mid-range Android.',
  'Direct client uploads to AWS S3 through pre-signed URLs.',
  'Radar view, invite flow, new onboarding and age verification.',
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
        Texter("FOUNDER & SOLO DEVELOPER · JUL 2026 – PRESENT", style: mono(context)),
        const SizedBox(height: 12),
        Texter("Tethxr", style: theme.textTheme.headlineLarge!.copyWith(fontSize: 48)),
        const SizedBox(height: 8),
        Texter("A social app for meeting people in the same physical space. iOS and Android.",
            style: theme.textTheme.bodyLarge!.copyWith(color: theme.colorScheme.onSurfaceVariant)),
        const SizedBox(height: 28),
        Wrap(
          spacing: 32,
          runSpacing: 16,
          children: [
            for (final s in _stats)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Texter(s.$1, style: mono(context, size: 24, color: theme.colorScheme.onSurface)),
                  Texter(s.$2, style: theme.textTheme.bodyMedium!),
                ],
              ),
          ],
        ),
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
