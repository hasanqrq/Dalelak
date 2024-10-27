import 'package:flutter/material.dart';
import 'welcome_page.dart';
import 'main_page.dart';
import 'details_page.dart';
import 'tourist_place_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dalelak App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => WelcomePage());
          case '/main':
            final region = settings.arguments as String?;
            return MaterialPageRoute(
              builder: (context) => MainPage(region: region),
            );
          case '/details':
            final place = settings.arguments as TouristPlace;
            return MaterialPageRoute(
              builder: (context) => DetailsPage(place: place),
            );
          default:
            return MaterialPageRoute(builder: (context) => WelcomePage());
        }
      },
    );
  }
}
