import 'package:flutter/material.dart';
import 'package:toyshop/Constant/AppConstant.dart';
import 'package:toyshop/UI/ProductListing.dart';

class SubCategory extends StatefulWidget {
  const SubCategory({Key key}) : super(key: key);

  @override
  State<SubCategory> createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppbarColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )
        ),
        leadingWidth: 40,
        leading: Container(
          margin: EdgeInsets.only(left: 20),
          child: Image.asset(arrowBack),
        ),
        title: Text('Subcategories',style: appbarTitle,),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: size.height*0.03,),

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
                      child:Text('Stuffed Animal & Toys')
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
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
                itemCount: 3,
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
                            title: Text("Bunnies,Rabbits & Ducks"),
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
        ),
      ),
    );
  }
}
