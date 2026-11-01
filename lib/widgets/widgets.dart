import 'package:flutter/material.dart';
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
    return select?
    SelectionArea(
      child: Seo.text(
        text: text,
        child: Text(
          text,
          maxLines: maxLines,
          overflow: maxLines==1?TextOverflow.ellipsis:null,
          textAlign: textAlign,
          style: style.copyWith(
            fontFamily: "Gilroy",
          ),

        ),
      ),
    ):
    Seo.text(
      text: text,
      child: Text(
        text,
        maxLines: maxLines,
        overflow: maxLines==1?TextOverflow.ellipsis:null,
        textAlign: textAlign,
        style: style.copyWith(
          fontFamily: "Gilroy",
        ),
      ),
    );
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

class Imager extends StatelessWidget {
  const Imager({super.key,  this.imageFit = BoxFit.cover, required this.altText, required this.path, this.colorBlendMode, this.alignment= Alignment.center});

  final String path, altText;
  final BlendMode? colorBlendMode;
  final Alignment alignment;
  final BoxFit imageFit;

  @override
  Widget build(BuildContext context) {
    return Seo.image(
      src: "https://chrisbinsunny.github.io/assets/$path",
      alt: altText,
      child: Image.asset(
        path,
          colorBlendMode: colorBlendMode,
        fit: imageFit,
        alignment: alignment,
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

extension Stringy on String {
  String get breakWord{
    String breakWord = '';
    for (var element in runes) {
      breakWord += String.fromCharCode(element);
      breakWord +='\ufeff';
    }
    return breakWord;
  }
}