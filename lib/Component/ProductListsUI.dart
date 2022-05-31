import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toyshop/Constant/AppConstant.dart';
import 'package:toyshop/Provider/ProductProvider.dart';
import 'package:toyshop/UI/ProductDetail.dart';
import 'package:toyshop/Widgets/CustomElevatedButton.dart';

class ProductListsUI extends StatelessWidget {
  ProductListsUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ProductProvider>(
      builder: (context,lists,child){
        final listing = lists.productListingModel.data.collection.products.data;
        return Container(
          child: GridView.builder(
            itemCount: listing.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 0.76,crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10),
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductDetails()));
                },
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        child: Image.network('https://alpha3.mytechnology.ae/playpapa//images/timthumb.php?src=/'+listing[index].image.toString(),width:100,),
                      ),
                      Text(listing[index].supplier.name.en.toString()??"",style: TextStyle(fontSize: 12,color: Colors.grey,),),
                      SizedBox(height: 3,),
                      Container(
                          width:140,
                          child: Text(
                            listing[index].name.en.toString()??"",style:  TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.w600),textAlign: TextAlign.center,)
                      ),
                      Container(
                        child: Text(listing[index].price.toString()??"",style: TextStyle(fontSize:20,color: Color(0xff7a7aae),fontWeight: FontWeight.w800),),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: CustomElevatedButton(
                          text: 'Add to Bucket',
                          onPress: (){},
                          Color: MainColor,
                          Padding: EdgeInsets.symmetric(vertical:13,horizontal: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}