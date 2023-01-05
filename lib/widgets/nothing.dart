import 'package:flutter/material.dart';

/// A [Nothing] instance, you can use in your layouts.
const nothing = Nothing();

/// A widget which is not in the layout and does nothing.
/// It is useful when you have to return a widget and can't return null.
class Nothing extends Widget {
  /// Creates a [Nothing] widget.
  const Nothing({Key? key}) : super(key: key);

  @override
  Element createElement() => _NilElement(this);
}

class _NilElement extends Element {
  _NilElement(Nothing widget) : super(widget);

  @override
  void mount(Element? parent, dynamic newSlot) {
    assert(parent is! MultiChildRenderObjectElement, """
        You are using Nil under a MultiChildRenderObjectElement.
        This suggests a possibility that the Nil is not needed or is being used improperly.
        Make sure it can't be replaced with an inline conditional or
        omission of the target widget from a list.
        """);

    super.mount(parent, newSlot);
  }

  @override
  bool get debugDoingBuild => false;

  @override
  void performRebuild() {}
}