import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


Container header(context){
  return Container(
    child: Stack(
      children: [
      SvgPicture.asset("images/bridge_log.svg"),

              ],
    ),
  );
}

Decoration decoration(){
  return BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomLeft,
        colors: [Colors.blueGrey[700], Colors.teal]),
  );
}