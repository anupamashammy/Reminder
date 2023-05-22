
import 'package:flutter/material.dart';
import '../widgets/clock_view.dart';
import 'animation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
   @override
  void initState() {
    super.initState();
    _navigatehome();
  }
_navigatehome() async {
  await Future.delayed(const Duration(seconds: 10));

  // ignore: use_build_context_synchronously
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) =>const Animation_Page() ,
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color:const Color.fromARGB(255, 4, 4, 4),
        child:const ClockView(),
        
      ),
    );
  }
}