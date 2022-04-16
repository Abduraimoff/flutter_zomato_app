import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardWidget extends StatelessWidget {
  final String icon;
  final String title;
  const CardWidget({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Card(
        child: ListTile(
          leading: SvgPicture.asset(icon),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w600),
              ),
              const Icon(
                Icons.arrow_forward,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
