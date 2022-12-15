import 'package:flutter/material.dart';
import 'package:seo/html/seo_widget.dart';

class Texter extends StatelessWidget {
  const Texter({Key? key, this.textStyle, required this.text}) : super(key: key);

  final TextStyle? textStyle;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Seo.text(
      text: text,
      child: Text(
        text,
        style: textStyle,
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
  const Imager({Key? key, required this.altText, required this.path, this.colorBlendMode}) : super(key: key);

  final String path, altText;
  final BlendMode? colorBlendMode;

  @override
  Widget build(BuildContext context) {
    return Seo.image(
      src: "https://chrisbinsunny.github.io/$path",
      alt: altText,
      child: Image.asset(
        path,
          colorBlendMode: colorBlendMode
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
      child: Image.asset(
        link,
      ),
    );
  }
}