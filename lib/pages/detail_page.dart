import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zomato_app/app_color.dart';
import 'package:zomato_app/data/food_model.dart';
import 'package:zomato_app/providers/cart_provider.dart';

class DetailPage extends StatefulWidget {
  final Food food;
  const DetailPage({Key? key, required this.food}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.food.name,
                child: Container(
                  height: 350.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.food.imageUrl),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.low,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 30.h,
                left: 10.w,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.kRedColor,
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
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Center(
            child: Text(
              widget.food.name,
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.w700,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              widget.food.description,
              style: TextStyle(
                fontSize: 16.sp,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 25.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    border: const Border(
                      bottom: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (widget.food.amount > 1) {
                            setState(() {
                              widget.food.amount--;
                            });
                          }
                        },
                        icon: const Icon(
                          Icons.remove,
                        ),
                        splashRadius: 1,
                      ),
                      Text(
                        '${widget.food.amount}',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            widget.food.amount++;
                          });
                        },
                        icon: const Icon(
                          Icons.add,
                        ),
                        splashRadius: 1,
                      ),
                    ],
                  ),
                ),
                Text(
                  '\$${widget.food.price * widget.food.amount}',
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          context.read<CartProvider>().addFood(widget.food);
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Container(
            width: double.infinity,
            height: 70.h,
            decoration: BoxDecoration(
              color: AppColor.kRedColor,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Center(
              child: Text(
                'Add to cart',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
