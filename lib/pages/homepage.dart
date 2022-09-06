import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  double _buttonRadius = 100;

  final Tween<double> _backgroundScale = Tween<double>(begin: 0.0, end: 1.0);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animations")),
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _pageBackground(),
            _circularAnimationButton(),
          ],
        ),
      ),
    );
  }

  Widget _pageBackground() {
    return TweenAnimationBuilder(
      curve: Curves.easeInOutBack,
      tween: _backgroundScale,
      duration: const Duration(seconds: 2),
      builder: ((_context, double _scale, _child) {
        return Transform.scale(
          scale: _scale,
          child: _child,
        );
      }),
      child: Container(
        color: Color.fromARGB(194, 48, 119, 50),
      ),
    );
  }

  Widget _circularAnimationButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _buttonRadius += _buttonRadius == 200 ? -100 : 100;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 3),
          curve: Curves.bounceInOut,
          height: _buttonRadius,
          width: _buttonRadius,
          decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(_buttonRadius)),
          child: const Center(
            child: Text(
              "Click Here",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
