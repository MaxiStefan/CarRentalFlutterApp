import 'package:flutter/material.dart';
import 'package:flutter_car_rental/classes/Car.dart';
import 'package:flutter_car_rental/classes/Filter.dart';
import 'package:flutter_car_rental/colors/Colors.dart';
import 'package:flutter_car_rental/screens/BookCarScreen.dart';
import 'package:flutter_car_rental/widgets/CarWidget.dart';

class AvailableCars extends StatefulWidget {
  @override
  _AvailableCarsState createState() => _AvailableCarsState();
}

class _AvailableCarsState extends State<AvailableCars> {
  List<Filter> filters = Filter.getFilterList();
  Filter selectedFilter;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedFilter = filters[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      border: Border.all(
                        color: Colors.grey[300],
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.black,
                      size: 28,
                    )),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Available Cars (" + Car.getCarList().length.toString() + ")",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: GridView.count(
                  physics: BouncingScrollPhysics(),
                  childAspectRatio: 1 / 1.55,
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: Car.getCarList().map((item) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/bookCarScreen',
                            arguments: BookCarScreen(car: item),
                          );
                        },
                        child: getCarWidget(item, null));
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            buildFilterIcon(),
            Row(
              children: _buildFilters(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFilterIcon() {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Center(
        child: Icon(
          Icons.filter_list,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }

  List<Widget> _buildFilters() {
    List<Widget> list = [];
    for (var i = 0; i < filters.length; i++) {
      list.add(_buildFilterWidget(filters[i]));
    }
    return list;
  }

  Widget _buildFilterWidget(Filter filter) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = filter;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(right: 16),
        child: Text(
          filter.name,
          style: TextStyle(
            color: selectedFilter == filter ? kPrimaryColor : Colors.grey[300],
            fontSize: 16,
            fontWeight:
                selectedFilter == filter ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
