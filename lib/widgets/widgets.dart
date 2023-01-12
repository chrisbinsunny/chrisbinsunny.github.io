import 'package:flutter/material.dart';
import 'package:seo/html/seo_widget.dart';

class Texter extends StatelessWidget {
  const Texter(this.text, {Key? key, this.select=true, this.style=const TextStyle(), this.textAlign=TextAlign.start, this.maxLines}) : super(key: key);

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
  const RichTexter({Key? key, required this.child, required this.text}) : super(key: key);

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
  const Imager({Key? key,  this.imageFit = BoxFit.cover, required this.altText, required this.path, this.colorBlendMode, this.alignment= Alignment.center}) : super(key: key);

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
  const Linker({Key? key, required this.name, required this.link, required this.child}) : super(key: key);

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