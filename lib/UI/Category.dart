import 'package:flutter/material.dart';
import 'package:toyshop/Component/CategoryUI.dart';
import 'package:toyshop/Constant/AppConstant.dart';
import 'package:toyshop/Constant/ImageConstant.dart';
import 'package:toyshop/Models/CategoryModel.dart';
import 'package:toyshop/Services/Api/api_response.dart';
import 'package:toyshop/Services/CategoryService/CategoryService.dart';
import 'package:toyshop/Widgets/CustomElevatedButton.dart';
import 'package:toyshop/Widgets/CustomLoader.dart';
import 'package:toyshop/Widgets/ShowError.dart';

class CategoryUi extends StatefulWidget {
  const CategoryUi({Key key}) : super(key: key);

  @override
  State<CategoryUi> createState() => _CategoryUiState();
}

class _CategoryUiState extends State<CategoryUi> {

  Future<ApiResponse<CategoryResponseModel>> _categories;
  @override
  void initState() {
    _categories = CategoryService().getCategory(context);
    super.initState();
  }
  Future _handleReFresh() async{
    setState(() {
      _categories = CategoryService().getCategory(context);
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
          leading: Container(
            margin: EdgeInsets.only(left: 20),
            child: Image.asset(arrowBack),
          ),
          title: Text('Categories',style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w700),),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  child: StreamBuilder(
                    stream:_categories.asStream(),
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
                                return CategoryUiScreen();
                                break;
                              case Status.ERROR:
                                print(snapshot.data.message);
                                return Container(
                                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                        Text('Some Error Here. Try Again'),
                                        SizedBox(height: size.height*0.1,),
                                        CustomElevatedButton(
                                            text: 'Try Again',
                                            Color: MainColor,
                                            onPress: (){
                                              _handleReFresh();
                                            },
                                            Padding: EdgeInsets.symmetric(vertical: 13,horizontal: 30))
                                    ],
                                  ),
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
