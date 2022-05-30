import 'package:flutter/material.dart';
import 'package:toyshop/Constant/AppConstant.dart';


class ProductListing extends StatefulWidget {
  const ProductListing({Key key}) : super(key: key);

  @override
  State<ProductListing> createState() => _ProductListingState();
}

class _ProductListingState extends State<ProductListing> {
  @override
  Widget build(BuildContext context) {
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
        title: Text('Fantasy Creature',style: appbarTitle,),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    child: Image.asset(sort,width: 12,),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    child: Text('Sort'),
                  ),
                  VerticalDivider(color: Colors.white,indent: 10,endIndent: 10,),

                  Container(
                    child: Image.asset(filter,width: 12,),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    child: Text('Filter'),
                  ),

                ],
              ),
            ),
          )


        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: GridView.builder(
                itemCount: 4,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 0.76,crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10),
                itemBuilder: (context,index){
                  return Container(
                    child: Column(
                      children: [
                        Container(
                          child: Image.asset('Asset/icon/plush.png',width:100,),
                        ),
                        Text('Timeless Toy',style: productListingTitle,),
                        SizedBox(height: 3,),
                        Container(
                          width:140,
                            child: Text(
                                'Luster Dragon Stuffed Toy',style: productListingName,textAlign: TextAlign.center,)
                        ),
                        Container(
                          child: Text("\$15.0",style: productListingPrice,),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: ElevatedButton(
                            onPressed: (){},
                            child: Text('Add to Basket',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 17),),
                            style: ElevatedButton.styleFrom(
                                // shadowColor: Colors.red,
                                primary: Color(0xff7A7AAE),
                              padding: EdgeInsets.symmetric(vertical: 13,horizontal: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              )
                            ),

                          ),
                        )
                        
                      ],
                    ),
                  );
                },
              ),
            )

          ],
        ),
      ),
    );
  }
}
