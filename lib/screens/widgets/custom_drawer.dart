import 'package:bridge/screens/home_screen.dart';
import 'package:bridge/screens/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  _buildDrawerOption(Icon icon, String title, Function onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontSize: 20.0),
      ),
      onTap: onTap,
    );
  }
  Color color(){
    return Colors.teal[100];
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: decoration(),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  color: Colors.transparent,
//                  child: SvgPicture.asset("images/bridge_log.svg"),
                ),
                Positioned(
                  bottom: 0,
                  left: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30,
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        "Username",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            _buildDrawerOption(
              Icon(Icons.dashboard,
              color: color(),),
              "Home",
                  () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return Home();
                  },
                ),
              ),
            ),
            _buildDrawerOption(Icon(Icons.chat,color: color(),), "Chat", (){},),
            _buildDrawerOption(Icon(Icons.receipt,color: color()), "Bills", (){}),
            _buildDrawerOption(Icon(Icons.account_circle,color: color()), "Your Profile", (){},),
            _buildDrawerOption(Icon(Icons.settings,color: color()), "Setting", (){}),


          ],
        ),
      ),
    );
  }
}



