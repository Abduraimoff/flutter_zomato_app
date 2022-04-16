import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:zomato_app/app_color.dart';
import 'package:zomato_app/data/food_model.dart';

class FoodCard extends StatelessWidget {
  final Food food;
  final VoidCallback press;
  const FoodCard({
    Key? key,
    required this.food,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Container(
          height: 352.h,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: const Offset(1, 1),
                  blurRadius: 5.r,
                ),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  ),
                  image: DecorationImage(
                    filterQuality: FilterQuality.low,
                    image: AssetImage(food.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 17.h,
                      left: 10.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 7.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'Promoted',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 15.h,
                      right: 10.w,
                      child: Container(
                        height: 34.h,
                        width: 34.w,
                        padding: EdgeInsets.symmetric(
                            horizontal: 7.w, vertical: 7.h),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset('assets/icons/bookmark.svg'),
                      ),
                    ),
                    Positioned(
                      bottom: 8.h,
                      left: 10.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 7.h),
                        decoration: BoxDecoration(
                          color: AppColor.kyBlueColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/discount.svg',
                              height: 15.h,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              '${food.discount}% OFF',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 8.h,
                      right: 10.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 7.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/truck.svg',
                              height: 15.h,
                            ),
                            SizedBox(width: 5.w),
                            Padding(
                              padding: EdgeInsets.only(top: 2.h),
                              child: Text(
                                '${food.deliveryTime} mins',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      food.name,
                      style: TextStyle(
                        fontSize: 23.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        color: AppColor.kyTealColor,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Row(
                        children: [
                          Text(
                            '${food.stars}',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15.w,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      food.name,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Price Range 250-550',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 26.w),
                child: const Divider(
                  color: Colors.black,
                ),
              ),
              Center(
                child: Text(
                  'Zomato funds environmental projects to offset\ndelivery carbon footprint',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
