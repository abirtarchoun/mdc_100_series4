import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'model/product.dart';


// TODO: Add velocity constant (104)
const double _kFlingVelocity = 2.0;

class Backdrop extends StatefulWidget {
  final Category currentCategory;
  final Widget frontLayer;
  final Widget backLayer;
  final Widget frontTitle;
  final Widget backTitle;

  const Backdrop({
    required this.currentCategory,
    required this.frontLayer,
    required this.backLayer,
    required this.frontTitle,
    required this.backTitle,
    Key? key,
  }) : super(key: key);

  @override
  _BackdropState createState() => _BackdropState();
}
// TODO: Add _FrontLayer class (104)
class _FrontLayer extends StatelessWidget {
  // TODO: Add on-tap callback (104)
  const _FrontLayer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 16.0,
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(46.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // TODO: Add a GestureDetector (104)
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
// TODO: Add _BackdropTitle class (104)
// TODO: Add _BackdropState class (104)
// TODO: Add _BackdropState class (104)
class _BackdropState extends State<Backdrop>
    with SingleTickerProviderStateMixin {
  final GlobalKey _backdropKey = GlobalKey(debugLabel: 'Backdrop');

  // TODO: Add AnimationController widget (104)
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      value: 1.0,
      vsync: this,
    );
  }

  // TODO: Add override for didUpdateWidget (104)

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // TODO: Add functions to get and change front layer visibility (104)

  // TODO: Add BuildContext and BoxConstraints parameters to _buildStack (104)
  Widget _buildStack() {
    // TODO: Create a RelativeRectTween Animation (104)

    return Stack(
      key: _backdropKey,
      children: <Widget>[
        // TODO: Wrap backLayer in an ExcludeSemantics widget (104)
        widget.backLayer,
        // TODO: Add a PositionedTransition (104)
        // TODO: Wrap front layer in _FrontLayer (104)
        _FrontLayer(child: widget.frontLayer),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      brightness: Brightness.light,
      elevation: 0.0,
      titleSpacing: 0.0,
      // TODO: Replace leading menu icon with IconButton (104)
      // TODO: Remove leading property (104)
      // TODO: Create title with _BackdropTitle parameter (104)
      leading: const Icon(Icons.menu),
      title: const Text('SHRINE'),
      actions: <Widget>[
        // TODO: Add shortcut to login screen from trailing icons (104)
        IconButton(
          icon: const Icon(
            Icons.search,
            semanticLabel: 'search',
          ),
          onPressed: () {
            // TODO: Add open login (104)
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.tune,
            semanticLabel: 'filter',
          ),
          onPressed: () {
            // TODO: Add open login (104)
          },
        ),
      ],
      backwardsCompatibility: false,
    );
    return Scaffold(
      appBar: appBar,
      // TODO: Return a LayoutBuilder widget (104)
      body: _buildStack(),
    );
  }
}