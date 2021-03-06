import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zomato_app/pages/root_page.dart';
import 'package:zomato_app/providers/cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CartProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(414,896),
        builder: (_) => const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: RootPage(),
          routes: {},
        ),
      ),
    );
  }
}
