import 'package:flutter/material.dart';
import 'package:flutter_car_rental/classes/Dealer.dart';

Widget getDealerWidget(Dealer dealer, int index) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.only(
        right: index != null ? 16 : 0, left: index == 0 ? 16 : 0),
    width: 150,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(dealer.image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15))),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          dealer.name,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Text(
          dealer.offers.toString() + " offers",
          style: TextStyle(fontSize: 14, color: Colors.grey),
        )
      ],
    ),
  );
}
