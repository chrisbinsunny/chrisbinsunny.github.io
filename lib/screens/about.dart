import 'package:flutter/material.dart';
import 'package:portfolio/constants/theme.dart';
import 'package:portfolio/widgets/widgets.dart';

const _skills = {
  'Languages': ['Dart', 'C', 'C++', 'Python', 'Go', 'SQL'],
  'Mobile & Frameworks': ['Flutter', 'GetX', 'Provider', 'BLoC', 'Pigeon', 'Isolates', 'Lottie'],
  'Databases': ['PostgreSQL', 'Isar', 'Hive', 'Drift', 'SQLite'],
  'Backend & Cloud': ['Supabase', 'Firebase', 'AWS S3'],
  'Payments & Tools': ['RevenueCat', 'Razorpay', 'PayU', 'Play Billing', 'App Store Billing', 'Git'],
};

const _talks = [
  '1st Prize, Amazon Alexa Use Case Competition, KSUM',
  '2nd Prize (Maker\'s Tribe), Hack19 Flutter International Hackathon',
  'Finalist, HackDelhi Ultrahack \'19',
  'Published paper: "Cabby – The Ride Sharing Platform"',
  '7 workshops and 9+ talks on Flutter and programming',
];

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Section(
      eyebrow: "About",
      title: "Engineer, speaker, builder.",
      child: Wrap(
        spacing: 48,
        runSpacing: 48,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Texter(
                  "Programming has been my passion since I was a teenager. Today I'm a Frontend Engineer at Kutuki, "
                  "keeping a kids' learning app with 5M+ downloads 99.6% crash-free across Android, iOS, Auto and TV, "
                  "and the founder of Tethxr.\n\n"
                  "I also maintain open source Flutter packages like blurhashx and Flippy, and I love making technology "
                  "accessible through talks and workshops.",
                  style: theme.textTheme.bodyLarge!,
                ),
                const SizedBox(height: 32),
                Texter("TALKS & AWARDS", style: mono(context)),
                const SizedBox(height: 12),
                for (final t in _talks)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 9, right: 12),
                          child: Icon(Icons.circle, size: 6, color: theme.colorScheme.primary),
                        ),
                        Expanded(child: Texter(t, style: theme.textTheme.bodyMedium!)),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 460),
            child: Panel(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final e in _skills.entries) ...[
                    Texter(e.key.toUpperCase(), style: mono(context)),
                    const SizedBox(height: 10),
                    Wrap(spacing: 8, runSpacing: 8, children: [for (final s in e.value) _Chip(s)]),
                    if (e.key != _skills.keys.last) const SizedBox(height: 22),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Texter(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: scheme.onSurface)),
    );
  }
}
