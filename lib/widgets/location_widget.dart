import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zomato_app/app_color.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 13.h),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColor.kRedColor,
      ),
      child: SvgPicture.asset(
        'assets/icons/location.svg',
        color: Colors.white,
      ),
    );
  }
}
