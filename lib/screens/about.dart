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

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Section(
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 48,
        runSpacing: 48,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionHeading(eyebrow: "About", title: "Engineer, speaker, builder."),
                const SizedBox(height: 24),
                Texter(
                  "I've loved programming since I was a teenager, and today I make apps that people use every day.\n\n"
                  "At Kutuki, I helped build a learning app for kids that runs on phones, tablets, TVs and even cars. "
                  "Now I'm the founder and only developer of Tethxr, an app that helps you meet people around you.\n\n"
                  "I also share free tools with other developers, and I enjoy teaching. I've given talks and workshops "
                  "on Flutter and won a few hackathons along the way.",
                  style: theme.textTheme.bodyLarge!,
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
