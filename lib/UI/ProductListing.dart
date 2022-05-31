import 'package:flutter/material.dart';
import 'package:toyshop/Component/ProductListsUI.dart';
import 'package:toyshop/Constant/AppConstant.dart';
import 'package:toyshop/Constant/ImageConstant.dart';
import 'package:toyshop/Models/ProductListingModel.dart';
import 'package:toyshop/Services/Api/api_response.dart';
import 'package:toyshop/Services/ProductListingService/ProductListService.dart';
import 'package:toyshop/UI/ProductDetail.dart';
import 'package:toyshop/Widgets/CustomElevatedButton.dart';
import 'package:toyshop/Widgets/CustomLoader.dart';
import 'package:toyshop/Widgets/ShowError.dart';

class ProductLists extends StatelessWidget {
  String catId;
  String subId;
  String title;
  ProductLists({Key key,this.subId,this.catId,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductListing(
      catId: this.catId, subId: this.subId,title: this.title,
    );
  }
}




class ProductListing extends StatefulWidget {
  String catId;
  String subId;
  String title;
  ProductListing({Key key,this.catId,this.subId,this.title}) : super(key: key);

  @override
  State<ProductListing> createState() => _ProductListingState();
}

class _ProductListingState extends State<ProductListing> {
  Future<ApiResponse<ProductListingModel>> _listing;
  @override
  void initState() {
    _listing = ProductListingService().getListing(context, widget.catId, widget.subId);
    super.initState();
  }
  Future _handleReFresh() async{
    setState(() {
      _listing = ProductListingService().getListing(context, widget.catId, widget.subId);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
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
          leading: Container(
            margin: EdgeInsets.only(left: 20),
            child: Image.asset(arrowBack),
          ),
          title: Text(widget.title??"",style: appbarTitle,),
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
                child: StreamBuilder(
                  stream:_listing.asStream(),
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

            ],
          ),
        ),
      ),
    );
  }
}

