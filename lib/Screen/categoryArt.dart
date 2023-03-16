import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photos/Screen/FullScreen/fullScreenCategory.dart';
import '../Model/CategoryModel.dart';




class CategoryArt extends StatefulWidget {
  const CategoryArt({Key? key}) : super(key: key);

  @override
  State<CategoryArt> createState() => _CategoryArtState();
}

class _CategoryArtState extends State<CategoryArt> {

  late Future<List<CategoryPageModel>> CatArtFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    CatArtFuture = SendRequestCategoryPhoto();
  }

  Widget build(BuildContext context) {



    InkWell generateItem(CategoryPageModel categoryPageModel) {
      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => fullScreenCategory(categoryPageModel)));
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
                  categoryPageModel.imgurl,
                  fit: BoxFit.cover,
                )),
          ),
        ),
      );
    }


    return Scaffold(



      body:    Container(


          child: FutureBuilder<List<CategoryPageModel>>(
            future: CatArtFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<CategoryPageModel>? model = snapshot.data;
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




  Future<List<CategoryPageModel>> SendRequestCategoryPhoto() async {
    List<CategoryPageModel> model = [];
    var respons = await Dio()
        .get("https://my-json-server.typicode.com/aminbdev/categorypage/db");
    print(respons.statusCode);
    print(respons);
    for (var item in respons.data["CategoryArt"]) {
      model.add(CategoryPageModel(item['id'], item['imgurl']));
    }

    return model;
  }
}



