import 'package:flutter/material.dart';
import 'package:portfolio/constants/theme.dart';
import 'package:portfolio/firebase/analytics.dart';
import 'package:portfolio/widgets/projectView.dart';
import 'package:portfolio/widgets/widgets.dart';

const _packages = [
  ProjectDetails(
    name: "blurhashx",
    kind: "pub.dev package",
    image: "images/blurhashx.png",
    imageFit: BoxFit.contain,
    altText: "blurhashx example showing images and their BlurHash placeholders.",
    desc: "A high-performance Flutter BlurHash package, built to fix slow placeholders in Tethxr.\n"
        "Cut encoding to 5–8 ms (~250x faster) using Flutter's native Skia decoder.\n"
        "Linear-light downsampling, a separable 2D DCT and sRGB/cosine lookup tables.\n"
        "encodeAsync runs on a background isolate with zero-copy transfer.\n"
        "Matches the official BlurHash spec; 160/160 pub points, 600+ downloads.\n"
        "The image placeholders on this site are drawn with it.",
    github: "https://github.com/chrisbinsunny/blurhashx",
    link: "https://pub.dev/packages/blurhashx",
  ),
  ProjectDetails(
    name: "Flippy",
    kind: "pub.dev package",
    image: "images/flippy.gif",
    imageFit: BoxFit.contain,
    altText: "Flippy demo of a card being dragged to flip.",
    desc: "A Flutter package for 3D card-flip widgets.\n"
        "Drag to flip, with a controller for flipping from code.\n"
        "Supports flips from all sides with shadows.\n"
        "The contact card on this site flips the same way.",
    github: "https://github.com/chrisbinsunny/flippy",
    link: "https://pub.dev/packages/flippy",
  ),
];

const _webApps = [
  ProjectDetails(
    name: "ChrisHub",
    kind: "Flutter Web",
    image: "images/chrishub.jpg",
    detailImage: "images/chrishubWeb.jpg",
    altText: "Home screen of ChrisHub, Chrisbin's MacBook Pro.",
    desc: "A portfolio website built as a web simulation of macOS Big Sur.\n"
        "Recreated Terminal, Safari, Messages, VS Code and Spotify.\n"
        "Create and delete folders, change brightness, wallpaper and more.\n"
        "Provider for state and Hive as the local database.\n"
        "Tech stack: Flutter, Firebase, Hive.",
    github: "https://github.com/chrisbinsunny/chrishub",
    link: "https://chrisbinsunny.github.io/chrishub",
  ),
  ProjectDetails(
    name: "DREAM",
    kind: "Flutter Web",
    image: "images/dream.png",
    detailImage: "images/dreamWeb.jpg",
    imageFit: BoxFit.contain,
    altText: "Home screen of DREAM colour finder and gradient maker.",
    desc: "A web tool that pulls colours from images and screenshots.\n"
        "Gradient builder for website backgrounds.\n"
        "CSS code copying and sharing.\n"
        "Tech stack: Flutter, Provider.",
    github: "https://github.com/chrisbinsunny/dream",
    link: "https://chrisbinsunny.github.io/dream",
  ),
  ProjectDetails(
    name: "Flutter Talks",
    kind: "Flutter Web",
    image: "images/flutterTalks.jpg",
    detailImage: "images/flutterTalksWeb.jpg",
    altText: "Home screen of Flutter Talks by Chrisbin Sunny.",
    desc: "A presentation website shown at the intro session of workshops.\n"
        "Intro to Flutter slides, controlled with the arrow keys.\n"
        "Every slide has its own link.\n"
        "Tech stack: Flutter, Provider.",
    github: "https://github.com/chrisbinsunny/Flutter-Talks",
    link: "https://chrisbinsunny.github.io/Flutter-Talks",
  ),
];

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      eyebrow: "Projects",
      title: "Open source work.",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Texter("FLUTTER PACKAGES", style: mono(context)),
          const SizedBox(height: 16),
          Wrap(spacing: 24, runSpacing: 24, children: [for (final p in _packages) ProjectItem(details: p)]),
          const SizedBox(height: 56),
          Texter("WEB APPS", style: mono(context)),
          const SizedBox(height: 16),
          Wrap(spacing: 24, runSpacing: 24, children: [for (final p in _webApps) ProjectItem(details: p)]),
        ],
      ),
    );
  }
}

class ProjectItem extends StatelessWidget {
  const ProjectItem({super.key, required this.details});

  final ProjectDetails details;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.sizeOf(context).width < 600 ? MediaQuery.sizeOf(context).width - 48 : 320.0;
    return SizedBox(
      width: width,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            AnalyticsService.logProject(details.name);
            showDialog(
              context: context,
              builder: (context) => ProjectView(details: details),
            );
          },
          child: Panel(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 10,
                  child: ColoredBox(
                    color: theme.colorScheme.surface,
                    child: Imager(
                      path: details.image,
                      altText: details.altText,
                      imageFit: details.imageFit,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Texter(details.name, select: false, style: theme.textTheme.titleLarge!),
                            const SizedBox(height: 2),
                            Texter(details.kind, select: false, style: mono(context)),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_rounded, color: theme.colorScheme.onSurfaceVariant),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectDetails {
  final String name, kind, image, altText, desc, github, link;
  final String? detailImage;
  final BoxFit imageFit;

  const ProjectDetails({
    required this.name,
    required this.kind,
    required this.image,
    this.detailImage,
    this.imageFit = BoxFit.cover,
    required this.altText,
    required this.desc,
    required this.github,
    required this.link,
  });
}
