import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color;
  final VoidCallback onPress;
  final Padding;

  const CustomElevatedButton({Key key,@required this.text,@required this.Color,@required this.onPress,@required this.Padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text(text,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 15),),
      style: ElevatedButton.styleFrom(
        // shadowColor: Colors.red,
          primary: Color,
          padding: Padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          )
      ),

    );
  }
}
