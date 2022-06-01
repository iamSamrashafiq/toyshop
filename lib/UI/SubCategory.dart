import 'package:flutter/material.dart';
import 'package:toyshop/Component/SubCategoryUI.dart';
import 'package:toyshop/Constant/AppConstant.dart';
import 'package:toyshop/Constant/ImageConstant.dart';
import 'package:toyshop/Models/SubCategoryModel.dart';
import 'package:toyshop/Services/Api/api_response.dart';
import 'package:toyshop/Services/SubCategoryService/SubCategoryService.dart';
import 'package:toyshop/Widgets/CustomLoader.dart';
import 'package:toyshop/Widgets/ShowError.dart';

class SubCategoryScreen extends StatelessWidget {
   String id;
   String  title;
   SubCategoryScreen({Key key,this.id,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SubCategory(id: this.id,title: this.title,);
  }
}



class SubCategory extends StatefulWidget {
  String id;
  String title;
  SubCategory({Key key,this.id,this.title}) : super(key: key);

  @override
  State<SubCategory> createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {

  Future<ApiResponse<SubCategoryResponseModel>> _subcategories;



  @override
  void initState() {
    _subcategories = SubCategoryService().getSubCategory(context, widget.id);
    super.initState();
  }
  Future _handleReFresh() async{
    setState(() {
      _subcategories =SubCategoryService().getSubCategory(context, widget.id);
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
              Navigator.of(context).pop();
            },
            child: Container(
              margin: EdgeInsets.only(left: 20),
              child: Image.asset(arrowBack),
            ),
          ),
          title: Text('Subcategories',style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w700),),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height*0.03,),
                Container(
                  child: StreamBuilder(
                    stream:_subcategories.asStream(),
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
                                return SubCategoryView(heading: widget.title,);
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
