import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zomato_app/app_color.dart';
import 'package:zomato_app/widgets/card_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 75,
                backgroundImage: AssetImage('assets/images/food1.jpg'),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text('Arian Zesan',
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: 40),
            CardWidget(
              icon: 'assets/icons/wallet-check.svg',
              title: 'Payments',
            ),
            CardWidget(
              icon: 'assets/icons/setting2.svg',
              title: 'Profile Settings',
            ),
            CardWidget(
              icon: 'assets/icons/receipt-search.svg',
              title: 'Order History',
            ),
            CardWidget(
              icon: 'assets/icons/calendar.svg',
              title: 'Booking',
            ),
            Center(
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Sign Out',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.kyGreyColor,
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
          Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColor.kRedColor,
            ),
            child: SvgPicture.asset(
              'assets/icons/discover.svg',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
