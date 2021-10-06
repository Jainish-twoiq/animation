import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:tween_animation/animatedwidget.dart';

class CurveAnimation extends StatefulWidget {
  const CurveAnimation({Key? key}) : super(key: key);

  @override
  _CurveAnimationState createState() => _CurveAnimationState();
}

class _CurveAnimationState extends State<CurveAnimation>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 10000), vsync: this);
    CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = Tween(begin: 0.0, end: 300.0).animate(curve);

    controller.forward();
  }

  Widget builder(BuildContext context, Widget? child) {
    return SizedBox(
      height: animation.value,
      width: animation.value,
      child: const FlutterLogo(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Curve Animation',
          style: TextStyle(
            fontFamily: 'Poppins-Black',
            fontSize: 18.0,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: AnimatedBuilder(
            animation: animation,
            builder: builder,
          ),
        ),
      ),
    );
  }
}
