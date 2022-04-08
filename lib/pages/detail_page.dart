import 'package:flutter/material.dart';
import 'package:zomato_app/app_color.dart';
import 'package:zomato_app/data/food_model.dart';
import 'package:zomato_app/widgets/price_widget.dart';

class DetailPage extends StatelessWidget {
  final Food food;
  const DetailPage({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(food.imageUrl),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.low,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                food.name,
                style:const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                food.description,
                style: const TextStyle(
                  fontSize: 16,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 25),
            PriceWidget(food: food),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            color: AppColor.kRedColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Center(
            child: Text(
              'Add to cart',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
