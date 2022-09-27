import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  Responsive({
    this.mobile,
    this.tablet,
    this.desktop
  });

  final Widget?mobile;
  final Widget?tablet;
  final Widget?desktop;

  static bool isMobile(BuildContext context)=>  MediaQuery.of(context).size.width < 650;
  static bool isTablet(BuildContext context)=>  MediaQuery.of(context).size.width > 650 && MediaQuery.of(context).size.width < 1100;
  static bool isDesktop(BuildContext context)=> MediaQuery.of(context).size.width > 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {

      if(constraints.maxWidth > 1100){
        return desktop!;
      }else if(constraints.maxWidth < 1100 && constraints.maxWidth > 650){
        return tablet!;
      }else{
        return mobile!;
      }

    });
  }


}
