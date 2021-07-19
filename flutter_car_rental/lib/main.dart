import 'package:flutter/material.dart';
import 'package:flutter_car_rental/screens/AvailableCarsScreen.dart';
import 'package:flutter_car_rental/screens/BookCarScreen.dart';
import 'package:flutter_car_rental/screens/LoadingScreen.dart';
import 'package:flutter_car_rental/screens/ShowroomScreen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.mulishTextTheme()),
      initialRoute: '/showRoomScreen',
      routes: {
        // '/': (context) => LoadingScreen(),
        '/showRoomScreen': (context) => ShowroomScreen(),
        '/availableCarsScreen': (context) => AvailableCars(),
        '/bookCarScreen': (context) => BookCarScreen(),
      }));
}
