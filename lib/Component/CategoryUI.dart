import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toyshop/Constant/AppConstant.dart';
import 'package:toyshop/Constant/ImageConstant.dart';
import 'package:toyshop/Provider/ProductProvider.dart';
import 'package:toyshop/UI/SubCategory.dart';

class CategoryUiScreen extends StatelessWidget {

  CategoryUiScreen({Key key}) : super(key: key);
  List<Color> colorList =[
    Color(0xffFF8F2D),
    Color(0xff6e46b9),
    Color(0xff46b99a),
    Color(0xffe021d6),
    Color(0xffa9e11d),
    Color(0xff2a9872),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ProductProvider>(
        builder: (context, allCategories, child) {
          final data  = allCategories.categoryResponseModel.allData;
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
              child: Container(
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: data.length,
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio:0.87,crossAxisCount: 2,crossAxisSpacing: 13 ),
                  itemBuilder:(context,index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SubCategoryScreen(id:data[index].id.toString(),title:data[index].title.en.toString()  ,)));
                      },
                      child: Container(
                        child: Stack(
                          children: [
                            Positioned(
                              top: 40,
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
                                child: Image.network("https://alpha3.mytechnology.ae/playpapa//images/timthumb.php?src=/"+ data[index].image,width: 130,),
                              ),
                            ),
                            Positioned(
                              top: size.height*0.18,
                              left: size.width*0.06,
                              child: Container(
                                // margin: EdgeInsets.only(top:size.height*0.21,left: 40),
                                width: 150,
                                child: Text(data[index].title.en.toString(),textAlign: TextAlign.center,style:TextStyle(fontSize:14,color: Colors.white,fontWeight: FontWeight.w600),),
                              ),
                            ),
                            Positioned(
                              top: size.height*0.25,
                              left: size.width*0.2,
                              child: InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SubCategoryScreen(id:data[index].id.toString(),title:data[index].title.en.toString()  ,)));
                                },
                                child: Container(
                                  child: Image.asset(down,height: size.height*0.04,),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
        }
    );
  }
}
