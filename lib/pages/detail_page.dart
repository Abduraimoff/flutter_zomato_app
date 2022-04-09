import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zomato_app/app_color.dart';
import 'package:zomato_app/data/food_model.dart';
import 'package:zomato_app/providers/cart_provider.dart';
import 'package:zomato_app/widgets/price_widget.dart';

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
              Container(
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.food.imageUrl),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.low,
                  ),
                ),
              ),
              Positioned(
                top: 30,
                left: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.kRedColor,
                    borderRadius: BorderRadius.circular(40),
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
          const SizedBox(height: 20),
          Center(
            child: Text(
              widget.food.name,
              style: const TextStyle(
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
              widget.food.description,
              style: const TextStyle(
                fontSize: 16,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 25),
          Padding(
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
                        style: const TextStyle(
                          fontSize: 20,
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
                  style: const TextStyle(
                    fontSize: 30,
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
      ),
    );
  }
}
