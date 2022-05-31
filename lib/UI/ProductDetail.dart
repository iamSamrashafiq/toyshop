import 'package:flutter/material.dart';
import 'package:toyshop/Constant/AppConstant.dart';
import 'package:toyshop/Models/ProductDetailModel.dart';
import 'package:toyshop/Services/Api/api_response.dart';
import 'package:toyshop/Services/ProductDetailService/ProductDetailService.dart';
import 'package:toyshop/Widgets/CustomElevatedButton.dart';
import 'package:toyshop/Widgets/CustomLoader.dart';
import 'package:toyshop/Widgets/RatingWidget.dart';
import 'package:toyshop/Constant/ImageConstant.dart';
import 'package:toyshop/Widgets/ShowError.dart';

class ProductDetailData extends StatelessWidget {
  String id;
  String title;
   ProductDetailData({Key key,this.id,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductDetails(id: this.id,title: this.title,);
  }
}


class ProductDetails extends StatefulWidget {
  String id;
  String title;
  ProductDetails({Key key,this.id,this.title}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  double _ratingValue;
  List colorsData = [Colors.orange,Colors.amber,Colors.pink];
  List<double> toySize =[30,50,60];
  int selectedColor = 0;
  int selectedSize =0;

  Future<ApiResponse<ProductDetailResponse>> _detail;
  @override
  void initState() {
    _detail = ProductDetailService().getDetail(context, widget.id);
    super.initState();
  }
  Future _handleReFresh() async{
    setState(() {
      _detail = ProductDetailService().getDetail(context, widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: _handleReFresh,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
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
          title: Text(widget.title??"",style: appbarTitle,),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  Container(
                    child: Image.asset(share,width: 20,),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    child: Image.asset(message,width: 20,),
                  ),
                  SizedBox(width: 5,),
                ],
              ),
            )
          ],
        ),
        body: SafeArea(
          child:SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  child: StreamBuilder(
                    stream:_detail.asStream(),
                    builder: (context,snapshot){
                      switch(snapshot.connectionState){
                        case  ConnectionState.waiting:
                          return Center(child: GifLoader());
                          break;
                        default:
                          if (snapshot.hasData) {
                            switch (snapshot.data.status) {
                              case Status.LOADING:
                                return Center(child: GifLoader());
                                break;
                              case Status.COMPLETED:
                                return Container();
                                break;
                              case Status.ERROR:
                                print(snapshot.data.message);
                                return ShowError(
                                    errorMessage: snapshot.data.message,
                                    onRetryPressed: () => _handleReFresh()
                                );
                                break;
                            }
                          }
                          return ShowError(
                              height: size.height*0.3,
                              width: double.infinity,
                              errorMessage: "An unexpected Error Occurred",
                              onRetryPressed: () => _handleReFresh());
                          break;
                      }
                    },
                  ),
                ),

               const SizedBox(height: 16,),
                Center(
                  child: Container(
                    child: Image.asset('Asset/icon/plush.png',width: 160,),
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
                            initialCount: 5,
                            itemSize: 25,
                            onRatingUpdate: (value){
                            setState(() {
                              _ratingValue = value;
                            });
                            },
                          ),
                          Text('(5)',style: TextStyle(fontSize: 13,color: Colors.black87,),),
                        ],
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text('Luster Dragon Stuffed Toys',style: TextStyle(fontSize: 18, fontWeight:FontWeight.w500,color: Colors.black),),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Text('Timeless toy',style: TextStyle(fontSize: 14,color: Colors.grey.shade300),),
                      ),
                      const SizedBox(height: 5,),

                      RichText(
                        text: TextSpan(
                          text: 'Delivery ',
                          style: TextStyle(fontSize:13,color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(text: 'January 2,2022', style: TextStyle(fontSize:13,color: Colors.grey.shade300)),
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
                              Text('\$16.5',style: TextStyle(fontSize:20,color: Color(0xff7a7aae),fontWeight: FontWeight.w800),),
                              SizedBox(width: 5,),
                              Text('\$20.6',style: TextStyle(fontSize:13,color: Colors.grey,decoration:TextDecoration.lineThrough),)
                            ],
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(horizontal:10 ),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 4),
                                child: Image.asset(minus,width: 20,),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 6,horizontal: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(color: Colors.purple)
                                ),
                                child: Text('1',style: TextStyle(fontSize:15,color: Colors.black,fontWeight: FontWeight.w600),),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 4),
                                child: Image.asset(plus,width: 20,),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 10),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text('Select Color',style: TextStyle(fontWeight: FontWeight.w800,color: Colors.black),),
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
                     Text('Select Size',style: TextStyle(fontWeight: FontWeight.w800,color: Colors.black),),
                   Row(
                     children: [

                       Container(
                         padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                         decoration: BoxDecoration(
                           color: Colors.white,
                           shape: BoxShape.circle,
                           boxShadow: [
                             BoxShadow(
                               color:Colors.grey.shade300,
                               offset: Offset(2,2),
                               spreadRadius: 2,
                               blurRadius: 2,
                             )
                           ]
                         ),
                         child: Image.asset('Asset/icon/plush.png',width: 30,),
                       ),
                       SizedBox(width: 4,),

                       Container(
                         padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                         decoration: BoxDecoration(
                           color: Colors.white,
                           shape: BoxShape.circle,
                             boxShadow: [
                               BoxShadow(
                                 color:Colors.grey.shade300,
                                 offset: Offset(2,2),
                                 spreadRadius: 2,
                                 blurRadius: 2,
                               )
                             ]
                         ),
                         child: Image.asset('Asset/icon/plush.png',width: 40,),
                       ),
                       SizedBox(width: 4,),

                       Container(
                         padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                         decoration: BoxDecoration(
                           color: Colors.white,
                           shape: BoxShape.circle,
                             boxShadow: [
                               BoxShadow(
                                 color:Colors.grey.shade300,
                                 offset: Offset(2,2),
                                 spreadRadius: 2,
                                 blurRadius: 2,
                               )
                             ]
                         ),
                         child: Image.asset('Asset/icon/plush.png',width: 50,),
                       )
                     ],
                   ),
                     // Container(
                     //   height: size.height*0.2,
                     //   child: ListView.builder(
                     //     itemCount: toySize.length,
                     //     shrinkWrap: true,
                     //     scrollDirection: Axis.horizontal,
                     //     itemBuilder: (context,index){
                     //       return Container(
                     //
                     //         child: Column(
                     //           children: [
                     //             Container(
                     //               width: toySize[index],
                     //               height: toySize[index],
                     //               alignment: Alignment.center,
                     //               decoration: BoxDecoration(
                     //                   shape: BoxShape.circle,
                     //                   color: Colors.white,
                     //                    // image: DecorationImage(
                     //                    //   image:AssetImage('Asset/icon/plush.png',),
                     //                    //   fit: BoxFit.contain,
                     //                    // )
                     //
                     //               ),
                     //               // child: FloatingActionButton(
                     //               //   backgroundColor: Colors.white,
                     //               //   onPressed: (){
                     //               //     setState(() {
                     //               //       selectedSize = index;
                     //               //     });
                     //               //   },
                     //               //   child:Stack(
                     //               //     children: [
                     //               //       Image.asset('Asset/icon/plush.png', height:toySize[index],fit: BoxFit.cover,),
                     //               //
                     //               //       Icon(Icons.done,color: index == selectedSize ? Colors.white :null,size: 28),
                     //               //     ],
                     //               //   ),
                     //               //   elevation: 5.0,
                     //               //   heroTag: null,
                     //               //
                     //               // ),
                     //             ),
                     //           ],
                     //         ),
                     //
                     //       );
                     //     },
                     //   ),
                     // ),
                   ],
                 ),
               ),

                SizedBox(height: 15,),
               Container(
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Container(
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
               Container(
                 padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                 width: size.width*0.99,
                 child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever'
                     ' since the when an unknown printer took a galley of type and scrambled it to make a type specimen book.',style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black54,fontSize: 14),),
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
                                 SizedBox(width: size.width*0.4,),
                                 Container(
                                   child: Text('12 Min Ago',style:TextStyle(fontSize: 12,color: Colors.grey,),),
                                 )
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
            ),
          ),
        ),
      ),
    );
  }
}
