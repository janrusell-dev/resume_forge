import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder/core/utils/platform_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;  
  final double width;
  final double height;
  final Color color;


  const ButtonWidget({super.key,
   required this.text, 
   required this.onPressed, 
   required this.textStyle,
   required this.height,
   required this.width,
   required this.color
   });

  @override
  Widget build(BuildContext context) {
    return PlatformUtils.isIOS
        ? CupertinoButton(onPressed: onPressed, child: Text(''))
        : Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12.r),
            // boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
          ),
          child: ElevatedButton(onPressed: onPressed,
           style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent
           ),
           child: Text(text, style: textStyle,),),
        );
  }
}
