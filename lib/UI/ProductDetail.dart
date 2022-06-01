import 'package:flutter/material.dart';
import 'package:toyshop/Component/ProductDetailUI.dart';
import 'package:toyshop/Constant/AppConstant.dart';
import 'package:toyshop/Models/ProductDetailModel.dart';
import 'package:toyshop/Services/Api/api_response.dart';
import 'package:toyshop/Services/ProductDetailService/ProductDetailService.dart';
import 'package:toyshop/Widgets/CustomLoader.dart';
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
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(left: 20),
              child: Image.asset(arrowBack),
            ),
          ),
          title: Text(widget.title??"",style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w700),),
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
                                return ProductDetailDataUI();
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
