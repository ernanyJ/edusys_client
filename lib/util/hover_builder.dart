import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HoverBuilder extends StatefulWidget {
  const HoverBuilder({
    required this.builder,
    super.key,
  });

  final Widget Function(bool isHovered) builder;

  @override
  HoverBuilderState createState() => HoverBuilderState();
}

class HoverBuilderState extends State<HoverBuilder> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (PointerEnterEvent event) => _onHoverChanged(enabled: true),
      onExit: (PointerExitEvent event) => _onHoverChanged(enabled: false),
      child: widget.builder(_isHovered),
    );
  }

  void _onHoverChanged({required bool enabled}) {
    setState(() {
      _isHovered = enabled;
    });
  }
}
