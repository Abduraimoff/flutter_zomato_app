import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  final foods = [
    'McDonald`s French Fries',
    'Popeyes Chicken Sandwich',
    'Five Guys Cheeseburger',
    'Chick-fil-A Waffle Fries',
    'Beef Sandwich',
    'Smashburger',
    'Pepperoni Pizza',
    'Subway',
    'Taco',
    'Whataburger',
    'Biscuits',
  ];
  final recentFoods = [
    'Biscuits',
    'Taco',
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentFoods
        : foods.where((p) => p.toLowerCase().startsWith(query)).toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.fastfood_rounded),
            title: RichText(
              text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: const TextStyle(
                        color: Colors.grey,
                      ),),
                ],
              ),
            ),
          );
        });
  }
}
