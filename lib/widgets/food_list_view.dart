import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zomato_app/data/food_model.dart';
import 'package:zomato_app/pages/detail_page.dart';

class FoodListView extends StatelessWidget {
  const FoodListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Food> listFoods = foods;
    return SizedBox(
      height: 108.h,
      child: ListView.builder(
        itemCount: listFoods.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          food: listFoods[index],
                        ),
                      ));
                },
                child: Container(
                  width: 80.w,
                  height: 80.h,
                  margin:
                      EdgeInsets.only(right: 10.w, left: index == 0 ? 10.w : 0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                    image: DecorationImage(
                      filterQuality: FilterQuality.high,
                      image: AssetImage(listFoods[index].imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                listFoods[index].name,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
