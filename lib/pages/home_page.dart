import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zomato_app/app_color.dart';
import 'package:zomato_app/data/food_model.dart';
import 'package:zomato_app/pages/profile_page.dart';
import 'package:zomato_app/widgets/data_search.dart';
import 'package:zomato_app/widgets/food_card.dart';
import 'package:zomato_app/widgets/food_list_view.dart';
import 'package:zomato_app/widgets/home_slider.dart';
import 'package:zomato_app/widgets/location_widget.dart';
import 'package:zomato_app/pages/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Food> listFoods = foods;
  PageController pageController = PageController();
  var _currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        children: [
          SizedBox(
            height: 220.h,
            child: PageView.builder(
              controller: pageController,
              itemCount: 3,
              itemBuilder: ((context, index) {
                return const HomeSlider();
              }),
            ),
          ),
          Center(
            child: DotsIndicator(
              dotsCount: 3,
              position: _currentPageValue,
              decorator: DotsDecorator(
                activeColor: AppColor.kyGreyColor,
                size: const Size.square(9.0),
                activeSize: Size(18.0.w, 9.0.h),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0.r)),
              ),
            ),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Text(
              'Eat what makes you happy',
              style: TextStyle(
                fontSize: 19.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 15.h),
          const FoodListView(),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '127 restaurants around you',
                  style: TextStyle(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 7.h),
                  color: Colors.white,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/icons/arrows.svg'),
                      SizedBox(width: 5.w),
                      Text(
                        'Popular',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
           SizedBox(height: 20.h),
          SingleChildScrollView(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: listFoods.length - 3,
              itemBuilder: (context, index) {
                return FoodCard(
                  food: listFoods[index],
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          food: listFoods[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const LocationWidget(),
              SizedBox(width: 5.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Home',
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColor.kyCoalColor,
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: AppColor.kyCoalColor,
                      )
                    ],
                  ),
                  Text(
                    'Uzbekistan,Namangan',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                },
                icon: SvgPicture.asset(
                  'assets/icons/search.svg',
                  color: AppColor.kRedColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()),
                  );
                },
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 25.r,
                  backgroundImage: const AssetImage('assets/images/food1.jpg'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
