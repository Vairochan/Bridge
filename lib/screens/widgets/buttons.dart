import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color color;


  const CustomButton({
    this.onPressed,
    this.color,
    this.child,
  });
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 20,
      onPressed:onPressed,
      child:Container(
        height: 45,
        width: 200,
        child: child
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(15)
        ),
      ),
      color:color,
    );
  }
}
