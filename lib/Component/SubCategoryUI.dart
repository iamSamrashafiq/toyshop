import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toyshop/Constant/ImageConstant.dart';
import 'package:toyshop/Provider/ProductProvider.dart';
import 'package:toyshop/UI/ProductListing.dart';

class SubCategoryView extends StatelessWidget {
  String heading;
   SubCategoryView({Key key,this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ProductProvider>(
      builder: (context,subCategory,child){
        final sub = subCategory.subCategoryResponseModel.allData;
        return sub.length != null ?
          Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                children: [
                  Positioned(
                    top:30,
                    child: Container(
                      width: size.width*0.9,
                      height: size.height*0.11,
                      decoration: BoxDecoration(
                        color: Color(0xff24D0CC),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Positioned(
                      top: size.height*0.08,
                      left: 10,
                      child:Text(heading??"",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.white),)
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Image.asset(teddy,width:size.width*0.23,),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 200,
              child: ListView.builder(
                itemCount: sub.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index){
                  return Container(
                      child:Column(
                        children: [
                          InkWell(
                            onTap:(){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductListing()));
                            },
                            child: ListTile(
                              title: Text(sub[index].title.en.toString(),style: TextStyle(fontSize: 15,color: Colors.black87),),
                              trailing: Image.asset(doubleArrow,width: 13,),
                            ),
                          ),
                          Divider(color: Colors.grey.shade400,thickness: 1,indent: 20,endIndent: 20,)
                        ],
                      )
                  );
                },
              ),
            ),
          ],
        ):Text('Nothing to Show Here', style: TextStyle(fontSize:16,fontWeight: FontWeight.w800),);
      },
    );
  }
}
