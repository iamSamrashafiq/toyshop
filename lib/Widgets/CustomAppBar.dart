import 'package:flutter/material.dart';
import 'package:toyshop/Constant/AppConstant.dart';

class CustomAppBar extends StatelessWidget {
  String title;
  String leadingSort;
  String sortText;
  String  filterText;
  String leadingFilter;
  String share;
  String message;
   CustomAppBar({Key key,@required this.title, this.leadingSort,this.leadingFilter,this.filterText,this.sortText,this.share,this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppbarColor
      ),
      child: Row(
        children: [
         Row(
           children: [
             Container(
               child: Image.asset(arrowBack),
             ),
             Container(
               child: Text(title??""),
             ),
           ],
         ),
          Container(
            child: Row(
              children: [
                Container(
                  child: Image.asset(leadingSort??null),
                ),
                Text(sortText??""),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}

