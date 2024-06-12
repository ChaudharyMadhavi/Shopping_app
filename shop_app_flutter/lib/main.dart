import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cart_provider.dart';
import 'package:shop_app_flutter/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //provider use to store the data in this change notifire provider we can do changes too
      create: (context) => CartProvider(), // we have to use in the cart page
      child: MaterialApp(
        title: 'Shopping App',
        theme: ThemeData(
          fontFamily: 'Merriweather',
          //it will use this type of fonts in entire app

          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(1, 75, 124, 180),
            //for all hover think so
            primary: const Color.fromRGBO(1, 75, 124, 180),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),

          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 33,
            ),
            titleMedium: TextStyle(
              //we are setting the theme for the title of perticular product
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedIconTheme: IconThemeData(
              color: Color.fromRGBO(1, 75, 124, 180),
            ),
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        // home: ProductDetailsPage(
        //   product: products[0],
        //),
      ),
    );
  }
}
