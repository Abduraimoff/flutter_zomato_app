import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.h, right: 20.w, left: 20.w),
      padding: EdgeInsets.only(
        left: 15.w,
        bottom: 4.h,
        top: 24.h,
      ),
      width: double.infinity,
      height: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFDC5A62),
            Color(0xFFEAA492),
          ],
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Up To',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 3.h),
              Text(
                '70% OFF',
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text(
                'with free delivery',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 7.h),
              Text(
                'no COOKing',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'July',
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.arrow_circle_right,
                    color: Colors.white,
                    size: 25.h,
                  )
                ],
              )
            ],
          ),
          Expanded(
            child: Image.asset('assets/images/food0.png'),
          ),
        ],
      ),
    );
  }
}
