import 'package:flutter/material.dart';
import 'package:photos/Model/CategoryModel.dart';
import 'package:photos/Screen/categorySection.dart';

import '../../Widgets/button_download_like_save.dart';


class fullScreenCategory extends StatelessWidget {


  CategoryPageModel categoryPageModel;


  fullScreenCategory(this.categoryPageModel);

  @override
  Widget build(BuildContext context) {

    return   Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              categoryPageModel.imgurl, fit: BoxFit.cover,
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Button_D_L_S(categoryPageModel.imgurl),
            // ImageDownload(photoModel.imgurl) ,
          ),
          
        ],
      ),
    );
  }
}
