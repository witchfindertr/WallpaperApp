import 'package:flutter/material.dart';
import 'package:photos/Model/CategoryModel.dart';
import 'package:photos/Model/PhotoModel.dart';
import 'package:photos/Widgets/button_download_like_save.dart';



class fullScreen extends StatelessWidget {



  PhotoModel photoModel;

 fullScreen( this.photoModel);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              photoModel.imgurl, fit: BoxFit.cover,
            ),
          ),


          Align(
            alignment: Alignment.bottomCenter,
              child: Button_D_L_S(photoModel.imgurl),
              // ImageDownload(photoModel.imgurl) ,
            ),





        ],
      ),
    );
  }
}
