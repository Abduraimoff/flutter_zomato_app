import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zomato_app/app_color.dart';

import 'package:zomato_app/providers/cart_provider.dart';
import 'package:zomato_app/widgets/cart_tile.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Grocery',
          style: TextStyle(color: Colors.black, fontSize: 25.sp),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: context.watch<CartProvider>().food.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 60.h,
                  child: CartTile(
                    food: context.watch<CartProvider>().food[index],
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: AppColor.kRedColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '\$${context.watch<CartProvider>().getTotalPrice().toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: AppColor.kyCoalColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
