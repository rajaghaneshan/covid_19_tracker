import 'package:covid_19_tracker/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: HomePage(),
    );
  }
}




// imageSrc = Illustration by <a href="https://icons8.com/illustrations/author/5bf673a26205ee0017636674">Anna Golde</a> from <a href="https://icons8.com/illustrations">Ouch!</a>

// Illustration by <a href="https://icons8.com/illustrations/author/5eb2a7bd01d0360019f124e7">Olha Khomich</a> from <a href="https://icons8.com/illustrations">Ouch!</a>