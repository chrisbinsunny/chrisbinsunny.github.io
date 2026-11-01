import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/constants/variables.dart';
import 'package:portfolio/firebase/analytics.dart';
import 'package:portfolio/widgets/functions.dart';

const navItems = [
  ('Home', Icons.home_rounded),
  ('About', Icons.person_rounded),
  ('Latest', Icons.auto_awesome_rounded),
  ('Projects', Icons.grid_view_rounded),
  ('Social', Icons.alternate_email_rounded),
];

void scrollToSection(BuildContext context, int index) {
  Variables.scrollController.position.ensureVisible(
    Variables.keys[index].currentContext!.findRenderObject()!,
    curve: Curves.easeInOut,
    duration: MediaQuery.disableAnimationsOf(context) ? Duration.zero : const Duration(milliseconds: 700),
  );
}

/// Floating glass nav: the only blurred layer on the page. Labels on wide screens, icon+label tabs on phones.
class NavPill extends StatefulWidget {
  const NavPill({super.key, required this.compact});

  final bool compact;

  @override
  State<NavPill> createState() => _NavPillState();
}

class _NavPillState extends State<NavPill> {
  final viewing = ValueNotifier<int>(0);

  void _update() => viewing.value = isVisibleNow(Variables.keys) - 1;

  @override
  void initState() {
    super.initState();
    Variables.scrollController.addListener(_update);
  }

  @override
  void dispose() {
    Variables.scrollController.removeListener(_update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: scheme.surfaceContainer.withValues(alpha: 0.72),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: scheme.outlineVariant),
          ),
          child: ValueListenableBuilder<int>(
            valueListenable: viewing,
            builder: (context, view, _) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var i = 0; i < navItems.length; i++)
                  _NavButton(
                    label: navItems[i].$1,
                    icon: navItems[i].$2,
                    selected: view == i,
                    compact: widget.compact,
                    onTap: () {
                      AnalyticsService.logAppBarButton(navItems[i].$1, type: widget.compact ? "TabBar" : "NavPill");
                      scrollToSection(context, i);
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({required this.label, required this.icon, required this.selected, required this.compact, required this.onTap});

  final String label;
  final IconData icon;
  final bool selected, compact;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final color = selected ? scheme.primary : scheme.onSurfaceVariant;
    return Semantics(
      button: true,
      selected: selected,
      label: label,
      excludeSemantics: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          constraints: BoxConstraints(minHeight: compact ? 52 : 44, minWidth: compact ? 60 : 0),
          padding: EdgeInsets.symmetric(horizontal: compact ? 6 : 16),
          decoration: BoxDecoration(
            color: selected ? scheme.primary.withValues(alpha: 0.14) : null,
            borderRadius: BorderRadius.circular(30),
          ),
          alignment: Alignment.center,
          child: compact
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(icon, size: 22, color: color),
                    Text(label, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: color)),
                  ],
                )
              : Text(label, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: selected ? scheme.onSurface : scheme.onSurfaceVariant)),
        ),
      ),
    );
  }
}
