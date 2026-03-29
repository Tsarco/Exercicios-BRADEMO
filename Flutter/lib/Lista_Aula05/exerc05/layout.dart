import 'package:flutter/material.dart';

class AnchoredOverlay extends StatelessWidget {
  final bool showOverlay;
  final Widget Function(BuildContext, Offset anchor) overlayBuilder;
  final Widget child;

  AnchoredOverlay({
    this.showOverlay = false,
    required this.overlayBuilder,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return OverlayBuilder(
            showOverlay: showOverlay,
            overlayBuilder: (BuildContext overlayContext) {
              // Correção de posicionamento global para o Overlay
              RenderBox box = context.findRenderObject() as RenderBox;
              final center = box.localToGlobal(box.size.center(Offset.zero));

              return overlayBuilder(overlayContext, center);
            },
            child: child,
          );
        },
      ),
    );
  }
}

class OverlayBuilder extends StatefulWidget {
  final bool showOverlay;
  final Widget Function(BuildContext) overlayBuilder; // Removido dynamic
  final Widget child;

  OverlayBuilder({
    this.showOverlay = false,
    required this.overlayBuilder,
    required this.child,
  });

  @override
  _OverlayBuilderState createState() => _OverlayBuilderState();
}

class _OverlayBuilderState extends State<OverlayBuilder> {
  OverlayEntry? overlayEntry; // Correção: Pode ser nulo

  @override
  void initState() {
    super.initState();
    if (widget.showOverlay) {
      WidgetsBinding.instance.addPostFrameCallback((_) => showOverlay());
    }
  }

  @override
  void didUpdateWidget(OverlayBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((_) => syncWidgetAndOverlay());
  }

  @override
  void reassemble() {
    super.reassemble();
    WidgetsBinding.instance.addPostFrameCallback((_) => syncWidgetAndOverlay());
  }

  @override
  void dispose() {
    if (isShowingOverlay()) {
      hideOverlay();
    }
    super.dispose();
  }

  bool isShowingOverlay() => overlayEntry != null;

  void showOverlay() {
    if (overlayEntry == null) {
      overlayEntry = OverlayEntry(builder: widget.overlayBuilder);
      addToOverlay(overlayEntry!);
    }
  }

  void addToOverlay(OverlayEntry entry) {
    Overlay.of(context).insert(entry);
  }

  void hideOverlay() {
    if (overlayEntry != null) {
      overlayEntry!.remove();
      overlayEntry = null;
    }
  }

  void syncWidgetAndOverlay() {
    if (isShowingOverlay() && !widget.showOverlay) {
      hideOverlay();
    } else if (!isShowingOverlay() && widget.showOverlay) {
      showOverlay();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class CenterAbout extends StatelessWidget {
  final Offset position;
  final Widget child;

  CenterAbout({required this.position, required this.child});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: position.dy,
      left: position.dx,
      child: FractionalTranslation(
        translation: const Offset(-0.5, -0.5),
        child: child,
      ),
    );
  }
}
