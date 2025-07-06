import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:resume_builder/features/home/view/widgets/button_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                    
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue,
                             Colors.purple,
                            ],
                             begin: Alignment.topCenter,
                             end: Alignment.bottomRight,
                             transform: GradientRotation(math.pi/64)
                              ),
                              
                        borderRadius: BorderRadius.circular(15),
                       
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                          horizontal: 10.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              children: [
                                Text(
                                  'Sign in to your free account',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  'asdasdyuasyufdfygasghfdasghfhjasdsadsadsasdasdasdhjvashjvdahsj',
                                  style: TextStyle(color: Colors.grey[300]),
                                ),
                              ],
                            ),
                            SizedBox(height: 30.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ButtonWidget(
                                  text: 'Sign in Now',
                                  onPressed: () {},
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                  ),
                                  height: 35.h,
                                  width: 150.w,
                                  color: Colors.white,
                                ),
                                ButtonWidget(
                                  text: 'Sign in Now',
                                  onPressed: () {},
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                  ),
                                  height: 35.h,
                                  width: 150.w,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
  }
}