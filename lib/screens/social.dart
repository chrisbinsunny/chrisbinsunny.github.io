import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants/theme.dart';
import 'package:portfolio/firebase/analytics.dart';
import 'package:portfolio/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

const _links = [
  ('Email', 'chrisbinofficial@gmail.com', 'mailto:chrisbinofficial@gmail.com', FontAwesomeIcons.solidEnvelope),
  ('GitHub', 'chrisbinsunny', 'https://github.com/chrisbinsunny', FontAwesomeIcons.github),
  ('LinkedIn', 'chrisbinsunny', 'https://linkedin.com/in/chrisbinsunny', FontAwesomeIcons.linkedin),
  ('Twitter', 'chrisbinsunny', 'https://twitter.com/chrisbinsunny', FontAwesomeIcons.xTwitter),
  ('Instagram', 'binary.ghost', 'https://instagram.com/binary.ghost', FontAwesomeIcons.instagram),
  ('Location', 'Bengaluru, India', 'https://maps.google.com/?q=Bengaluru,India', FontAwesomeIcons.locationDot),
];

class Social extends StatelessWidget {
  const Social({super.key});

  Future<void> _open(BuildContext context, String topic, String link) async {
    AnalyticsService.logContact(topic);
    final messenger = ScaffoldMessenger.of(context);
    final opened = await launchUrl(Uri.parse(link)).catchError((_) => false);
    if (!opened) {
      final text = link.replaceFirst("mailto:", "");
      await Clipboard.setData(ClipboardData(text: text));
      messenger.showSnackBar(SnackBar(content: Text("$topic copied: $text")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Section(
      eyebrow: "Social",
      title: "Let's talk.",
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 640),
        child: Panel(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              for (var i = 0; i < _links.length; i++) ...[
                if (i > 0) Divider(height: 1, indent: 64, color: scheme.outlineVariant),
                Linker(
                  name: _links[i].$1,
                  link: _links[i].$3,
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: () => _open(context, _links[i].$1, _links[i].$3),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(minHeight: 60),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              SizedBox(width: 28, child: FaIcon(_links[i].$4, size: 20, color: scheme.primary)),
                              const SizedBox(width: 16),
                              SizedBox(
                                width: 90,
                                child: Text(_links[i].$1, style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600)),
                              ),
                              Expanded(
                                child: Text(_links[i].$2, overflow: TextOverflow.ellipsis, style: mono(context, size: 14)),
                              ),
                              Icon(Icons.arrow_outward_rounded, size: 18, color: scheme.onSurfaceVariant),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
