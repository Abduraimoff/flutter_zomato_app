import 'package:flutter/material.dart';
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
      height: 105,
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
                  width: 80,
                  height: 80,
                  margin: EdgeInsets.only(right: 15, left: index == 0 ? 20 : 0),
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
              const SizedBox(height: 8),
              Text(
                listFoods[index].name,
                style: const TextStyle(
                  fontSize: 13,
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
