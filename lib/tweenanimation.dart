import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:tween_animation/animationbuilder.dart';

class TempAnimation extends StatefulWidget {
  const TempAnimation({Key? key}) : super(key: key);

  @override
  _TempAnimationState createState() => _TempAnimationState();
}

class _TempAnimationState extends State<TempAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 5000), vsync: this);
    animation = Tween(begin: 0.0, end: 400.0).animate(controller);
    animation.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tween Animation',
          style: TextStyle(
            fontFamily: 'Poppins-Black',
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(32.0),
            height: animation.value,
            width: animation.value,
            child: const Center(
              child: FlutterLogo(size: 300.0),
            ),
          ),
          ElevatedButton(
              onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => CurveAnimation() )
              ),
              child: Text('Next'))
        ],
      ),
    );
  }
}
