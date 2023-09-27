import 'dart:async';

import 'package:covid_app/views/worldstates_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late final AnimationController _animation =AnimationController(
    duration: const Duration(seconds: 3),vsync: this
  )..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animation.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer( const Duration(seconds: 5), () => Navigator.push(context, MaterialPageRoute(builder: (context)=>WorldStatesScreen())));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedBuilder(
                  animation: _animation,
                  child: Container(
                    height: 200,
                    width: 200,
                    child: const Center(
                      child: Image(image: AssetImage("images/virus.png")),
                    ),
                  ),
                  builder: (BuildContext context , Widget? child){
                    return Transform.rotate(
                      angle: _animation.value * 2.0 * math.pi,
                      child: child,
                    );
                  }
              ),
              SizedBox(height: MediaQuery.of(context).size.height *0.08 ),
              Text("Covid-19\nTracker App",
              textAlign: TextAlign.center,
              style: TextStyle( fontSize: 25,fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}
