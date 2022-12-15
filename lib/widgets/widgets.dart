import 'package:flutter/material.dart';
import 'package:seo/html/seo_widget.dart';

class Texter extends StatelessWidget {
  const Texter({Key? key, this.textStyle, this.text=""}) : super(key: key);

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


class Imager extends StatelessWidget {
  const Imager({Key? key, this.textStyle, this.path=""}) : super(key: key);

  final TextStyle? textStyle;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Seo.image(
      src: "https://chrisbinsunny.github.io/$path",
      child: Image.asset(
        path,
      ),
    );
  }
}