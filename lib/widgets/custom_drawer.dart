import 'package:flutter/material.dart';
import 'package:walkmandashboard/screens/home_screen.dart';

class CustomDrawer extends StatelessWidget {
  _buildDrawerOption(Icon icon, String title, Function onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image(
                  height: 200.0,
                  width: double.infinity,
                  image: NetworkImage(
                      "https://image.freepik.com/free-photo/abstract-bokeh-lights-dark-background_23-2147904884.jpg"),
                  fit: BoxFit.cover),
              Positioned(
                bottom: 20.0,
                left: 20.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 3.0,
                              color: Theme.of(context).primaryColor)),
                      child: ClipOval(
                        child: Image(
                            image: NetworkImage(
                                "https://yt3.ggpht.com/a/AGF-l78dncgjPyZ6Y3H9GRySmzPBbGXbGUZFCARQGw=s900-c-k-c0xffffffff-no-rj-mo"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      "CEO Vaidya",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildDrawerOption(
            Icon(Icons.dashboard),
            "Dashboard",
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => Dashboard(),
              ),
            ),
          ),
          // _buildDrawerOption(
          //   Icon(Icons.shopping_cart),
          //   "Cart",
          //   () => Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(
          //       builder: (_) => CartScreen(),
          //     ),
          //   ),
          // ),
          // _buildDrawerOption(
          //   Icon(Icons.shop),
          //   "Vendor Screen Walkman",
          //   () => Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(
          //       builder: (_) => UserList(),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
