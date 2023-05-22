import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({super.key});

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
@override
  void initState() {
   Timer.periodic(const Duration(seconds: 1), (timer) {
   //setState(() {});
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Transform.rotate(
           angle:-pi /2, 
           child: CustomPaint(
           painter:ClockPainter() ,
           ),
            
      ),
    );
  }
}

class ClockPainter extends CustomPainter{

  var dateTime = DateTime.now();
  
//60 sec -360, 1 sec - 6degree

// 12 hours - 360 , 1 hour 30 degrees , 1 min -0.5 degrees


  @override
  void paint(Canvas canvas, Size size) {
     var centerX = size.width /2;
     var centerY = size.height /2;
     var center  = Offset(centerX, centerY);
     var radius  = min(centerX, centerY);
     
     
     
     
     var fillbrush = Paint()
     ..color = const Color.fromARGB(255, 3, 29, 80);
     
     
     var outlineBrush = Paint()
     ..color = const Color(0xFFEAECFF)
     ..style = PaintingStyle.stroke
     ..strokeWidth = 16;


  
     var centerfillbrush = Paint()
     ..color = const Color(0xFFEAECFF);



     var secondhandbrush =Paint()
     ..color = Colors.orange[300]!
     ..style = PaintingStyle.stroke
     ..strokeCap =StrokeCap.round
     ..strokeWidth = 5;



     var minihandbrush =Paint()
     ..shader      =const RadialGradient(colors:[Color(0xff748ef6), Color(0xff77ddff)],
      ).createShader(Rect.fromCircle(
        center: center,
        radius: radius
        ))
     ..style       = PaintingStyle.stroke
     ..strokeCap = StrokeCap.round
     ..strokeWidth = 8;

    

     var hourhandbrush =Paint()
     ..shader      =const RadialGradient(
      colors:[Color(0xffea74ab), Color(0xFFC279FB)
      ])
         .createShader(Rect.fromCircle(
         center: center,
         radius: radius
         ))
     ..style = PaintingStyle.stroke
     ..strokeCap = StrokeCap.round
     ..strokeWidth = 12;



      var dashBrush = Paint()
      ..color = const Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    
     canvas.drawCircle(center, radius -40, fillbrush);
     canvas.drawCircle(center, radius -40, outlineBrush);
   


     var hourHandX = centerX + 60* cos((dateTime.hour * 30 + dateTime.minute * 0.5 )* pi /180);
     var hourHandY = centerX + 60* sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi /180); 
        canvas.drawLine(center, Offset(hourHandX, hourHandY), hourhandbrush);



     var miniHandX = centerX +80* cos(dateTime.minute * 6 * pi /180);
     var miniHandY = centerX +80* sin(dateTime.minute * 6 * pi /180); 
        canvas.drawLine(center, Offset(miniHandX, miniHandY), minihandbrush);


     var secHandX = centerX +80* cos(dateTime.second * 6 * pi /180);
     var secHandY = centerX +80* sin(dateTime.second * 6 * pi /180);  
       canvas.drawLine(center, Offset(secHandX, secHandY), secondhandbrush);

       canvas.drawCircle(center, 16, centerfillbrush);

     



     var outerCircleRadius = radius;
    var innerCircleRadius = radius - 14;
    for (double i = 0; i < 360; i += 12) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerX + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerX + innerCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
    }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
  return true;
  }

}