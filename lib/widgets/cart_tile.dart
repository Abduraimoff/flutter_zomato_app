import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:zomato_app/data/food_model.dart';
import 'package:zomato_app/pages/detail_page.dart';
import 'package:zomato_app/providers/cart_provider.dart';

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
        width: 55,
        height: 55,
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
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: Text(
              food.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '\$${food.price * food.amount}',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
