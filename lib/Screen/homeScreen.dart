import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:photos/Screen/categorySection.dart';
import 'package:photos/Screen/FullScreen/fullScreen.dart';
import '../Model/PhotoModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<PhotoModel>> photoFuture;

  @override
  void initState() {
    super.initState();

    photoFuture = SendRequestPhotos();


  }

  Widget build(BuildContext context) {
    InkWell generateItem(PhotoModel photoModel) {
      return InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => fullScreen(photoModel)));
        },
        child: Card(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  photoModel.imgurl,
                  fit: BoxFit.cover,
                )),
          ),
        ),
      );
    }




    return Scaffold(
        appBar: AppBar(
          // toolbarHeight: 70,

          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => categorySection()));
            }, icon: Icon(Icons.add) )
          ],

          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Image.asset(
            'images/onwall.png',
            height: 250,
          ),
        ),

        body:

            Container(


                child: FutureBuilder<List<PhotoModel>>(
              future: photoFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<PhotoModel>? model = snapshot.data;
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MasonryGridView.builder(
                        gridDelegate:
                            SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: model!.length,
                        itemBuilder: (context, index) {
                          return generateItem(model[index]);
                        },
                      ));
                } else {
                  return  Center(
                    child: SpinKitSquareCircle(
                      color: Colors.yellow,
                      size: 50,
                    ),
                  );
                }
              },
            )
            ),
    );
  }




  Future<List<PhotoModel>> SendRequestPhotos() async {
    List<PhotoModel> model = [];
    var respons = await Dio()
        .get("https://my-json-server.typicode.com/aminbdev/wallpapers_json/db");

    print(respons.statusCode);
    print(respons);

    for (var item in respons.data["photos"]) {
      model.add(PhotoModel(item['id'], item['imgurl']));


    }




    return model;
  }

}


