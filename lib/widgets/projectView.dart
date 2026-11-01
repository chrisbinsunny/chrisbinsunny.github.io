import 'package:flutter/material.dart';
import 'package:portfolio/constants/theme.dart';
import 'package:portfolio/firebase/analytics.dart';
import 'package:portfolio/screens/projects.dart';
import 'package:portfolio/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

/// Project detail panel. Closes with the close button, Esc, or a tap outside.
class ProjectView extends StatelessWidget {
  const ProjectView({super.key, required this.details});

  final ProjectDetails details;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final wide = MediaQuery.sizeOf(context).width >= 900;
    final isPackage = details.link.contains("pub.dev");

    final image = ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: ColoredBox(
        color: scheme.surface,
        child: AspectRatio(
          aspectRatio: 16 / 10,
          child: Imager(
            path: details.detailImage ?? details.image,
            altText: details.altText,
            imageFit: details.imageFit,
          ),
        ),
      ),
    );

    final info = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Texter(details.kind.toUpperCase(), style: mono(context, color: scheme.primary)),
        const SizedBox(height: 6),
        Texter(details.name, style: theme.textTheme.headlineLarge!.copyWith(fontSize: 32)),
        const SizedBox(height: 16),
        for (final line in details.desc.split("\n"))
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 9, right: 12),
                  child: Icon(Icons.circle, size: 6, color: scheme.primary),
                ),
                Expanded(child: Texter(line, style: theme.textTheme.bodyMedium!.copyWith(color: scheme.onSurface))),
              ],
            ),
          ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            Linker(
              name: details.name,
              link: details.link,
              child: FilledButton.icon(
                onPressed: () {
                  AnalyticsService.logProjectLaunched(details.name);
                  launchUrl(Uri.parse(details.link));
                },
                icon: const Icon(Icons.arrow_outward_rounded, size: 18),
                label: Text(isPackage ? "View on pub.dev" : "Launch Project"),
              ),
            ),
            Linker(
              name: "${details.name} GitHub",
              link: details.github,
              child: OutlinedButton(
                onPressed: () {
                  AnalyticsService.logProjectGitLaunched(details.name);
                  launchUrl(Uri.parse(details.github));
                },
                child: const Text("View on GitHub"),
              ),
            ),
          ],
        ),
      ],
    );

    return Dialog(
      backgroundColor: scheme.surfaceContainer,
      surfaceTintColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: scheme.outlineVariant),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 960),
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(24, wide ? 32 : 64, 24, 24),
              child: wide
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 5, child: image),
                        const SizedBox(width: 32),
                        Expanded(flex: 4, child: info),
                      ],
                    )
                  : Column(mainAxisSize: MainAxisSize.min, children: [image, const SizedBox(height: 24), info]),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                tooltip: "Close",
                icon: const Icon(Icons.close_rounded),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
