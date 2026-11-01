import 'dart:async';
import 'dart:ui' as ui;

import 'package:blurhashx/blurhashx.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/theme.dart';
import 'package:seo/html/seo_widget.dart';

class Texter extends StatelessWidget {
  const Texter(this.text, {super.key, this.select=true, this.style=const TextStyle(), this.textAlign=TextAlign.start, this.maxLines});

  final TextStyle style;
  final String text;
  final TextAlign textAlign;
  final int? maxLines;
  final bool select;

  @override
  Widget build(BuildContext context) {
    final child = Seo.text(
      text: text,
      child: Text(
        text,
        maxLines: maxLines,
        overflow: maxLines==1?TextOverflow.ellipsis:null,
        textAlign: textAlign,
        style: style,
      ),
    );
    return select ? SelectionArea(child: child) : child;
  }
}

class RichTexter extends StatelessWidget {
  const RichTexter({super.key, required this.child, required this.text});

  final Widget child;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Seo.text(
      text: text,
      child: child,
    );
  }
}

/// BlurHashes generated from the bundled images with blurhashx (4x3 components).
const blurHashes = {
  'images/tethxr.jpg': r'LO9%*VofD%WBj[ofj[ay00WB%Mof',
  'images/blurhashx.png': r'LkOzVzoL00W-?bj[ofju^,ay-;oM',
  'images/flippy.gif': r'LV6c:Nflj[j]MHf6fRf6isayfPay',
  'images/chrishubWeb.jpg': r'LEC#QHoERQrrGdtUwcv~5{PES%#S',
  'images/chrishub.jpg': r'LTCrgHfzD*jZOakDj]jZ0cXA%foL',
  'images/dream.png': r'LK5=-Gt.afR3XUXAayjDH;aIofo#',
  'images/dreamWeb.jpg': r'L23[6}$V5fAQ=%s=EcR$5fJ3w$=Q',
  'images/flutterTalks.jpg': r'LIGd$~tl.9oh4WjvR4f6soWCM^k9',
  'images/flutterTalksWeb.jpg': r'L4688L~q?as,4:4:E1R*xbxbt7of',
};

final _blurCache = <String, Future<ui.Image>>{};
final _blurDecoded = <String, ui.Image>{};

Future<ui.Image> _decodeBlur(String hash) => _blurCache.putIfAbsent(hash, () {
  final completer = Completer<ui.Image>();
  ui.decodeImageFromPixels(BlurHash.decode(hash, width: 32, height: 32), 32, 32,
      ui.PixelFormat.rgba8888, (image) {
    _blurDecoded[hash] = image;
    completer.complete(image);
  });
  return completer.future;
});

class Imager extends StatelessWidget {
  const Imager({super.key,  this.imageFit = BoxFit.cover, required this.altText, required this.path, this.colorBlendMode, this.alignment= Alignment.center});

  final String path, altText;
  final BlendMode? colorBlendMode;
  final Alignment alignment;
  final BoxFit imageFit;

  @override
  Widget build(BuildContext context) {
    final hash = blurHashes[path];
    final fade = MediaQuery.disableAnimationsOf(context) ? Duration.zero : const Duration(milliseconds: 400);
    return Seo.image(
      src: "https://chrisbinsunny.github.io/assets/$path",
      alt: altText,
      child: Semantics(
        label: altText,
        image: true,
        child: Image.asset(
          path,
          fit: imageFit,
          colorBlendMode: colorBlendMode,
          alignment: alignment,
          excludeFromSemantics: true,
          frameBuilder: hash == null ? null : (context, child, frame, sync) {
            // Keep the blur behind cached images too, so contained images never sit on a bare background.
            return Stack(
              fit: StackFit.passthrough,
              children: [
                Positioned.fill(
                  child: FutureBuilder(
                    future: _decodeBlur(hash),
                    initialData: _blurDecoded[hash],
                    builder: (context, snap) => snap.hasData
                        ? RawImage(image: snap.data, fit: BoxFit.cover)
                        : const SizedBox(),
                  ),
                ),
                AnimatedOpacity(opacity: sync || frame != null ? 1 : 0, duration: sync ? Duration.zero : fade, child: child),
              ],
            );
          },
        ),
      ),
    );
  }
}

class Linker extends StatelessWidget {
  const Linker({super.key, required this.name, required this.link, required this.child});

  final String link, name;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Seo.link(
      anchor: name,
      href: link,
      child: child,
    );
  }
}

/// Page section: centred, max 1100 wide, gutters that shrink on phones.
/// Without [eyebrow]/[title] the child places its own [SectionHeading].
class Section extends StatelessWidget {
  const Section({super.key, this.eyebrow, this.title, required this.child});

  final String? eyebrow, title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).width < 600;
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1100),
        padding: EdgeInsets.symmetric(horizontal: compact ? 24 : 32, vertical: compact ? 72 : 112),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[
              SectionHeading(eyebrow: eyebrow!, title: title!),
              const SizedBox(height: 40),
            ],
            child,
          ],
        ),
      ),
    );
  }
}

class SectionHeading extends StatelessWidget {
  const SectionHeading({super.key, required this.eyebrow, required this.title});

  final String eyebrow, title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Texter(eyebrow.toUpperCase(), style: mono(context, color: Theme.of(context).colorScheme.primary)),
        const SizedBox(height: 8),
        Texter(title, style: Theme.of(context).textTheme.headlineLarge!),
      ],
    );
  }
}

/// Raised surface with a hairline border, used for every card on the page.
class Panel extends StatelessWidget {
  const Panel({super.key, required this.child, this.padding = const EdgeInsets.all(24)});

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: padding,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: scheme.surfaceContainer,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: child,
    );
  }
}

extension Stringy on String {
  String get breakWord{
    String breakWord = '';
    for (var element in runes) {
      breakWord += String.fromCharCode(element);
      breakWord +='﻿';
    }
    return breakWord;
  }
}
