import 'package:flutter/material.dart';
import 'package:zomato_app/data/food_model.dart';

class PriceWidget extends StatelessWidget {
  final Food food;
  const PriceWidget({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  onPressed: () {},
                  icon: const Icon(
                    Icons.remove,
                  ),
                  splashRadius: 1,
                ),
                Text(
                  '${food.amount}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                  ),
                  splashRadius: 1,
                ),
              ],
            ),
          ),
          Text(
            '\$${food.price}',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
