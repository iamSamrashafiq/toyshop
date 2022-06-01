import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toyshop/Constant/AppConstant.dart';
import 'package:toyshop/Constant/ImageConstant.dart';
import 'package:toyshop/Provider/ProductProvider.dart';
import 'package:toyshop/Widgets/CustomElevatedButton.dart';
import 'package:toyshop/Widgets/RatingWidget.dart';

class ProductDetailDataUI extends StatefulWidget {
  const ProductDetailDataUI({Key key}) : super(key: key);

  @override
  State<ProductDetailDataUI> createState() => _ProductDetailDataUIState();
}

class _ProductDetailDataUIState extends State<ProductDetailDataUI> {
  int _currentIndex;
  double _ratingValue;
  List colorsData = [Colors.orange,Colors.amber,Colors.pink];
  List<double> toySize =[30,40,50];
  List<double> padding= [
   5, 10, 20,
  ];
  int selectedColor = 0;
  int selectedSize =0;
  bool isSelect;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ProductProvider>(
        builder: (context,details,child){
          final detailData= details.productDetailResponse;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16,),
              Center(
                child: Container(
                  child: Image.network(detailData.defaultImage.toString(),width: 200,),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        RatingBarWidget(
                          initialCount: detailData.averageRating.toDouble(),
                          itemSize: 25,
                          onRatingUpdate: (value){
                            setState(() {
                              _ratingValue = value;
                            });
                          },
                        ),
                        Text(detailData.averageRating.toString()??"".toString(),style: TextStyle(fontSize: 13,color: Colors.black87,),),
                      ],
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(detailData.name.en??"",style: TextStyle(fontSize: 20, fontWeight:FontWeight.w500,color: Colors.black),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Text(detailData.supplier.name.en??"",style: TextStyle(fontSize: 12,color: Colors.grey),),
                    ),
                    const SizedBox(height: 7,),

                    RichText(
                      text: TextSpan(
                        text: 'Delivery ',
                        style: TextStyle(fontSize:13,color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(text: 'January 2,2022', style: TextStyle(fontSize:13,color: Colors.grey)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8,),
                  ],
                ),
              ),


              Container(
                height: 70,
                width: double.infinity,
                child: Card(
                  elevation: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Text('\$'+detailData.price.toString()??"",style: TextStyle(fontSize:20,color: Color(0xff7a7aae),fontWeight: FontWeight.w800),),
                            SizedBox(width: 5,),
                            Text('\$'+detailData.discountPrice.toString()?? "",style: TextStyle(fontSize:13,color: Colors.grey,decoration:TextDecoration.lineThrough),)
                          ],
                        ),
                      ),
///product count
                      Container(
                        padding: EdgeInsets.symmetric(horizontal:10 ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap:(){
                                details.decrementCounter();
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 4),
                                child: Image.asset(minus,width: 22,),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 6,horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(color: Colors.purple)
                              ),
                              child: Text(details.getCounter().toString(),style: TextStyle(fontSize:15,color: Colors.black,fontWeight: FontWeight.w600),),
                            ),
                            GestureDetector(
                              onTap: (){
                                details.incrementCounter();
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 4),
                                child: Image.asset(plus,width: 22,),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
///select Colors
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Select Color',style: TextStyle(fontWeight: FontWeight.w800,color: Colors.black,fontSize: 15),),
                    Container(
                      height: size.height*0.1,
                      child: ListView.builder(
                        itemCount: colorsData.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return Container(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Column(
                              children: [
                                Container(
                                  width: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white,width: 5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade300,
                                          offset: Offset(1,2),
                                          blurRadius: 3,
                                          spreadRadius: 2,
                                        )
                                      ]
                                  ),
                                  child: FloatingActionButton(

                                    onPressed: (){
                                      setState(() {
                                        selectedColor = index;
                                      });
                                    },
                                    child: Icon(Icons.done,color: index == selectedColor ? Colors.white :colorsData.elementAt(index),size: 20),
                                    backgroundColor: colorsData.elementAt(index),
                                    elevation: 0.0,
                                    heroTag: null,

                                  ),
                                ),
                              ],
                            ),

                          );
                        },
                      ),
                    ),
///select Size
                    Text('Select Size',style: TextStyle(fontWeight: FontWeight.w800,color: Colors.black,fontSize: 15),),
                    // Row(
                    //   children: [
                    //
                    //     Container(
                    //       padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                    //       decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           shape: BoxShape.circle,
                    //           boxShadow: [
                    //             BoxShadow(
                    //               color:Colors.grey.shade300,
                    //               offset: Offset(2,2),
                    //               spreadRadius: 2,
                    //               blurRadius: 2,
                    //             )
                    //           ]
                    //       ),
                    //       child: Image.asset('Asset/icon/plush.png',width: 30,),
                    //     ),
                    //     SizedBox(width: 4,),
                    //
                    //     Container(
                    //       padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    //       decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           shape: BoxShape.circle,
                    //           boxShadow: [
                    //             BoxShadow(
                    //               color:Colors.grey.shade300,
                    //               offset: Offset(2,2),
                    //               spreadRadius: 2,
                    //               blurRadius: 2,
                    //             )
                    //           ]
                    //       ),
                    //       child: Image.asset('Asset/icon/plush.png',width: 40,),
                    //     ),
                    //     SizedBox(width: 4,),
                    //
                    //     Container(
                    //       padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    //       decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           shape: BoxShape.circle,
                    //           boxShadow: [
                    //             BoxShadow(
                    //               color:Colors.grey.shade300,
                    //               offset: Offset(2,2),
                    //               spreadRadius: 2,
                    //               blurRadius: 2,
                    //             )
                    //           ]
                    //       ),
                    //       child: Image.asset('Asset/icon/plush.png',width: 50,),
                    //     )
                    //   ],
                    // ),
                    Container(
                      width: double.infinity,
                      height: size.height*0.1,
                      child: ListView.builder(
                        itemCount: toySize.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return CustomWidget(
                              index: index,
                              padding: padding[index],
                              toysize: toySize[index],
                              isSelected: _currentIndex==index,
                              onSelect: (){
                                setState((){
                                  _currentIndex=index;
                                });
                              },
                              );
                        },
                      ),
                    ),
                  ],
                ),
              ),


              ///Buttons
              SizedBox(height: 15,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Container(
                        padding:EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                offset: Offset(3,1),
                                spreadRadius: 3,
                                blurRadius: 2,
                              )
                            ]
                        ),
                        child: Icon(Icons.favorite_border,color:MainColor,),
                      ),
                    ),
                    SizedBox(width: 10,),

                    Container(
                      child: CustomElevatedButton(
                        text: 'Buy Now',
                        onPress: (){},
                        Color: MainColor,
                        Padding: EdgeInsets.symmetric(vertical:13,horizontal: 30),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      child: CustomElevatedButton(
                        text: 'Add to Cart',
                        onPress: (){},
                        Color: Color(0xff7a7aae),
                        Padding: EdgeInsets.symmetric(vertical:13,horizontal: 30),
                      ),
                    ),

                  ],
                ),
              ),

              ///Product description
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                width: size.width*0.99,
                child: Text(detailData.description.en.toString()??"Not Available",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black54,fontSize: 14),),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text('Rate & Reviews',style:  TextStyle(fontWeight: FontWeight.w600,color: Colors.black87,fontSize: 14),),
                    ),
                    Container(
                      child: Text('Add your review',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.grey,fontSize: 14,decoration:TextDecoration.underline ),),
                    ),
                  ],
                ),
              ),

              Container(
                child: ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context,index){
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage('https://googleflutter.com/sample_image.jpg'),
                                            fit: BoxFit.fill
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 7,),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('John Doe Smith',style: TextStyle(fontSize: 15,color: Colors.black,),),
                                          Row(
                                            children: [
                                              RatingBarWidget(
                                                initialCount: 5,
                                                itemSize:15,
                                              ),
                                              Text('(5)',style: TextStyle(fontSize: 13,color: Colors.black87,),)
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  child: Text('12 Min Ago',style:TextStyle(fontSize: 12,color: Colors.grey,),),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin:EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            child: Text('lorem ipsum lorem ipsum lorem ipsum', style: TextStyle(fontSize: 14,color: Colors.grey,),),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(color: Colors.grey.shade300,indent: 10,endIndent: 10,thickness: 2,)
                        ],
                      ) ,
                    );
                  },
                ),
              ),
            ],
          );
        }
    );
  }
}

class CustomWidget extends StatefulWidget {
  const CustomWidget({
    Key key,
    @required this.index,
   @required this.padding,
    @required this.toysize,
    @required this.isSelected,
    @required this.onSelect,
  }) :  assert(index != null),
        assert(isSelected != null),
        assert(onSelect != null),
        super(key: key);

  final double padding;
  final double toysize;
  final int index;
  final bool isSelected;
  final VoidCallback onSelect;

  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:widget.onSelect,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin:EdgeInsets.only(left: 2),
            padding: EdgeInsets.symmetric(vertical: 10,horizontal:widget.padding),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: widget.isSelected?Colors.amber:Colors.white,width: 2),
                boxShadow: [
                  BoxShadow(
                    color:Colors.grey.shade300,
                    offset: Offset(2,2),
                    spreadRadius: 2,
                    blurRadius: 2,
                  )
                ]
            ),
            child: Image.asset('Asset/icon/plush.png',width:widget.toysize,),
          ),
        ],
      ),
    );
  }
}
