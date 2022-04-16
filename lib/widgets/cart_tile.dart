import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zomato_app/data/food_model.dart';
import 'package:zomato_app/pages/detail_page.dart';

class CartTile extends StatelessWidget {
  final Food food;
  const CartTile({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              food: food,
            ),
          ),
        );
      },
      leading: Container(
        width: 55.w,
        height: 55.h,
        decoration: BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(food.imageUrl),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.low,
          ),
        ),
      ),
      title: Row(
        children: [
          Text(
            '${food.amount} X',
            style: TextStyle(color: Colors.black, fontSize: 20.sp),
          ),
          SizedBox(width: 10.w),
          Expanded(
            flex: 3,
            child: Text(
              food.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              '\$${food.price * food.amount}',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
