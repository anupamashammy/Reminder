import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:reminder_application8078/widgets/Work_DateTime.dart';

class MyHeatMap extends StatelessWidget {

  final Map<DateTime, int>? datasets;
  final String startDateYYYYMMDD;

  const MyHeatMap({
    super.key, 
    required this.datasets,
     required this.startDateYYYYMMDD
     });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: HeatMap(
        startDate :  createDateTimeObject(startDateYYYYMMDD),
        endDate   :DateTime.now().add(Duration(days: 0)),
        datasets  :datasets, 
        colorMode: ColorMode.color,
        defaultColor: Colors.grey,
        textColor: Colors.white,
        showColorTip:false ,
        showText: true,
        scrollable:true ,
        size: 30,
        colorsets: {
          1 :Colors.green,
        },
      

      ),
    );
  }
}