import 'package:flutter/material.dart';
import 'package:toyshop/Constant/AppConstant.dart';
import 'package:toyshop/UI/SubCategory.dart';

class ProductUi extends StatefulWidget {
  const ProductUi({Key key}) : super(key: key);

  @override
  State<ProductUi> createState() => _ProductUiState();
}

class _ProductUiState extends State<ProductUi> {

  List<Color> colorList =[
    Color(0xffFF8F2D),
    Color(0xff6e46b9),
  ];

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
        title: Text('Categories',style: appbarTitle,),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
              child: Container(
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 2,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio:0.87,crossAxisCount: 2,crossAxisSpacing: 13 ),
                  itemBuilder:(context,index){
                    return Container(
                      child: Stack(
                        children: [
                          Positioned(
                            top: 30,
                            child: Container(
                              width:size.width*0.45,
                              height: size.height*0.27,
                              decoration: BoxDecoration(
                                color: colorList[index],
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          Positioned(
                            left: size.width*0.07,
                            child: Container(
                              child: Image.asset('Asset/icon/timthumb.png',width: 130,),
                            ),
                          ),
                          Positioned(
                            top: size.height*0.18,
                            left: size.width*0.13,
                            child: Container(
                              // margin: EdgeInsets.only(top:size.height*0.21,left: 40),
                              child: Text('Playset & \n Accessories',textAlign: TextAlign.center,style: productTitle,),
                            ),
                          ),
                          Positioned(
                            top: size.height*0.25,
                            left: size.width*0.2,
                            child: InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SubCategory()));
                              },
                              child: Container(
                                child: Image.asset(down,height: size.height*0.04,),
                              ),
                            ),
                          ),

                        ],
                      ),
                    );
                  },
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
