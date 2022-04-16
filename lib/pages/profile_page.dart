import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zomato_app/app_color.dart';
import 'package:zomato_app/widgets/card_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 75.r,
                backgroundImage: const AssetImage('assets/images/food1.jpg'),
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: Text('Arian Zesan',
                  style:
                      TextStyle(fontSize: 27.sp, fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: 40.h),
            const CardWidget(
              icon: 'assets/icons/wallet-check.svg',
              title: 'Payments',
            ),
            const CardWidget(
              icon: 'assets/icons/setting2.svg',
              title: 'Profile Settings',
            ),
            const CardWidget(
              icon: 'assets/icons/receipt-search.svg',
              title: 'Order History',
            ),
            const CardWidget(
              icon: 'assets/icons/calendar.svg',
              title: 'Booking',
            ),
            Center(
              child: Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  child: Text('Sign Out',
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w600)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.kyGreyColor,
              borderRadius: BorderRadius.circular(40.r),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            width: 50.w,
            height: 50.h,
            padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 13.h),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.kRedColor,
            ),
            child: SvgPicture.asset(
              'assets/icons/discover.svg',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
