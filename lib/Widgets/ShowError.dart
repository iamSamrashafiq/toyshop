import 'package:flutter/material.dart';
import 'package:toyshop/Constant/AppConstant.dart';

class ShowError extends StatelessWidget {
  final String errorMessage;
  final Function onRetryPressed;
  final bool isBackButton;
  final double height;
  final double width;

  const ShowError(
      {Key key,
        this.errorMessage,
        this.onRetryPressed,
        this.width,
        this.height,
        this.isBackButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height:height?? size.height,
          width: width ?? size.width,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height:size.height*0.07 ,),
              // Image.asset(
              //   'assets/images/error.png',
              //   height: size.height * 0.2,
              //   color: Colors.black,
              // ),
              // SizedBox(height: 8.0),
              Expanded(
                child: Text(errorMessage,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,)),
              ),

              // SizedBox(height:size.height*0.1 ,),
              Container(
                width: size.width * 0.35,
                child: RaisedButton(
                  padding: EdgeInsets.all(12.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  color:MainColor,
                  onPressed: onRetryPressed??(){},
                  child: Text(
                    "Retry",
                    style: TextStyle(color: Colors.white),
                    strutStyle: StrutStyle(
                      forceStrutHeight: true,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
