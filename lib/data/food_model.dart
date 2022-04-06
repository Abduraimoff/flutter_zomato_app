class Food {
  final String imageUrl;
  final String name;
  final String description;
  final double stars;
  final int deliveryTime;
  final int discount;
  final bool isPromoted;

  Food({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.stars,
    required this.deliveryTime,
    required this.discount,
    this.isPromoted = false,
  });
}

List<Food> foods = [
  Food(
    imageUrl: 'assets/images/food1.jpg',
    name: 'Healthy',
    description:
        'Healthy foods are those that provide you with the nutrients you need to sustain your body`s well-being and retain energy. Water, carbohydrates, fat, protein, vitamins, and minerals are the key nutrients that make up a healthy, balanced diet.',
    stars: 4.1,
    deliveryTime: 25,
    discount: 20,
    isPromoted: true,
  ),
  Food(
    imageUrl: 'assets/images/food2.jpg',
    name: 'Pizza',
    description:
        'Pizza is a dish of Italian origin consisting of a usually round, flat base of leavened wheat-based dough topped with tomatoes, cheese, and often various ...',
    stars: 4.4,
    deliveryTime: 32,
    discount: 60,
  ),
  Food(
    imageUrl: 'assets/images/food3.jpg',
    name: 'Salad',
    description:
        'Fruit salad is a dish consisting of various kinds of fruit, sometimes served in a liquid, either their own juices or a syrup.',
    stars: 3.0,
    deliveryTime: 10,
    discount: 10,
  ),
  Food(
    imageUrl: 'assets/images/food4.jpg',
    name: 'Hamburger',
    description:
        'A hamburger is an extremely popular sandwich consisting of one or more meat patties placed in a bun or a bread roll. The meat is usually accompanied by various ingredients such as tomato slices, onions, pickles, or lettuce, and numerous condiments such as mayonnaise, ketchup, or salsa.',
    stars: 4.5,
    deliveryTime: 15,
    discount: 75,
    isPromoted: true,
  ),
  Food(
    imageUrl: 'assets/images/food5.jpg',
    name: 'Momos',
    description:
        'Momo is a type of steamed dumpling with some form of filling, most commonly beef and it is originally from Tibet. Momo has become a delicacy in Nepal and Tibetan communities in Bhutan, as well as people of the Indian regions of Darjeeling, Ladakh, Sikkim, Assam, Uttarakhand, Himachal Pradesh and Arunachal Pradesh.',
    stars: 4.2,
    deliveryTime: 45,
    discount: 35,
    isPromoted: true,
  ),
  Food(
    imageUrl: 'assets/images/food6.jpg',
    name: 'Steak',
    description:
        'A steak is a meat generally sliced across the muscle fibers, potentially including a bone. It is normally grilled, though it can also be pan-fried. Steak can also be cooked in sauce, such as in steak and kidney pie, or minced and formed into patties, such as hamburgers.',
    stars: 4.7,
    deliveryTime: 55,
    discount: 5,
    isPromoted: false,
  ),
  Food(
    imageUrl: 'assets/images/food7.jpg',
    name: 'Soup',
    description:
        'Soup is a primarily liquid food, generally served warm or hot (but may be cool or cold), that is made by combining ingredients of meat or vegetables with stock, milk, or water. Hot soups are additionally characterized by boiling solid ingredients in liquids in a pot until the flavors are extracted, forming a broth.',
    stars: 4.0,
    deliveryTime: 35,
    discount: 25,
    isPromoted: false,
  ),
];
