import 'package:flutter/material.dart';
import 'package:shopapp/account/login.dart';
import 'package:shopapp/account/register.dart';
import 'package:shopapp/pages/home_page.dart';
import 'package:shopapp/pages/basket_page.dart';
import 'package:shopapp/pages/category_page.dart';
import 'package:shopapp/pages/product_page.dart';
import 'package:shopapp/pages/profile_page.dart';
import 'package:shopapp/pages/subcategory_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App Beta',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.white.withOpacity(0.7),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      routes: {
        // '': (BuildContext context) => CardPage(),
        // '/basket': (BuildContext context) => BasketPage(),
        // '/profile': (BuildContext context) => ProfilePage(),
        '/category': (BuildContext context) => SubCategory(),
        '/product': (BuildContext context) => ProductPage(),
        'login': (context) => const MyLogin(),
        'register': (context) => const MyRegister(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _page = 0;
  final screens = [
    CardPage(),
    CategoryPage(),
    BasketPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          screens[_page],
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16), topLeft: Radius.circular(16)),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              color: Colors.black45,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: GNav(
                backgroundColor: Colors.transparent,
                color: Colors.black54,
                activeColor: Colors.grey[400],
                tabBackgroundColor: Colors.grey.shade900,
                gap: 8,
                selectedIndex: _page,
                onTabChange: (index) {
                  setState(() {
                    _page = index;
                  });
                  ;
                },
                padding: EdgeInsets.all(16),
                tabs: [
                  GButton(
                    icon: Icons.home_outlined,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.category_outlined,
                    text: 'Category',
                  ),
                  GButton(
                    icon: Icons.shopping_cart_outlined,
                    text: 'Basket',
                  ),
                  GButton(
                    icon: Icons.person_outline,
                    text: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
