import 'package:flutter/material.dart';
import 'package:walkmandashboard/widgets/custom_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final String apiUrl = "<link to json api>";

  Future<List<dynamic>> fetchVendors() async {
    var result = await http.get(apiUrl);
    print(result);
    return json.decode(result.body)['dashboarddatas'];
  }

  String _user(dynamic dashdata) {
    // print(vendor['vendor_name']);
    return dashdata['totaluser'].toString();
  }

  String _product(dynamic dashdata) {
    return dashdata['totalproduct'].toString();
  }

  String _vendor(dynamic dashdata) {
    return dashdata['totalvendor'].toString();
  }

  String _coupon(dynamic dashdata) {
    return dashdata['totalcoupon'].toString();
  }

  String _redemcoupon(dynamic dashdata) {
    return dashdata['totalredeemcoupon'].toString();
  }

  String _greencoins(dynamic dashdata) {
    return dashdata['totalgreencoins'].toString();
  }

  String _kilometer(dynamic dashdata) {
    return dashdata['totalkm'] + " km";
  }

  String _co2(dynamic dashdata) {
    return dashdata['totalco2'] + " Kg";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Dashboard"),
        elevation: .1,
        backgroundColor: Colors.green[900],
      ),
      drawer: CustomDrawer(),
      // body: Container(
      //   padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
      //   child: GridView.count(
      //     crossAxisCount: 2,
      //     padding: EdgeInsets.all(3.0),
      //     children: <Widget>[
      //       makeDashboardItem("Users", Icons.people_outline),
      //       makeDashboardItem("Active Users", Icons.people),
      //       makeDashboardItem("New User Today", Icons.person),
      //       makeDashboardItem("Distance(km)", Icons.directions_walk),
      //       makeDashboardItem("Green Coins", Icons.radio_button_unchecked),
      //       makeDashboardItem("Products", Icons.restaurant_menu),
      //       makeDashboardItem("Vendors", Icons.restaurant),
      //       makeDashboardItem("Coupons", Icons.note),
      //       makeDashboardItem("Redeemed Coupons", Icons.event_note),
      //     ],
      //   ),
      // ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: fetchVendors(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              // print(_product(snapshot.data[0]));
              return ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Column(
                        children: <Widget>[
                          makeDashboardItem(_user(snapshot.data[index]),
                              "Users", Icons.people_outline),
                          makeDashboardItem(_kilometer(snapshot.data[index]),
                              "Kilometer", Icons.directions_run),
                          makeDashboardItem(_co2(snapshot.data[index]),
                              "co2 Reduced", Icons.arrow_downward),
                          makeDashboardItem(_greencoins(snapshot.data[index]),
                              "Green Coins", Icons.radio_button_checked),
                          makeDashboardItem(_product(snapshot.data[index]),
                              "Products", Icons.restaurant_menu),
                          makeDashboardItem(_vendor(snapshot.data[index]),
                              "Vendors", Icons.restaurant),
                          makeDashboardItem(_coupon(snapshot.data[index]),
                              "Coupons", Icons.pages),
                          makeDashboardItem(_redemcoupon(snapshot.data[index]),
                              "Redeemed Coupons", Icons.pageview),
                        ],
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Card makeDashboardItem(String numbersdata, String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green[500],
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(width: 1.0, color: Colors.green[700]),
          ),
          child: new InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(numbersdata,
                      style:
                          new TextStyle(fontSize: 25.0, color: Colors.white)),
                ),
                SizedBox(height: 20.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: Colors.white,
                )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 20.0, color: Colors.white)),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ));
  }
}
