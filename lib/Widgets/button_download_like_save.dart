import 'package:flutter/material.dart';
import 'package:image_downloader/image_downloader.dart';

class Button_D_L_S extends StatefulWidget {
  late String imgUrl="" ;
  Button_D_L_S(this.imgUrl,{Key? key}) : super(key: key);

  @override
  State<Button_D_L_S> createState() => _Button_D_L_SState();
}

class _Button_D_L_SState extends State<Button_D_L_S> {

  bool isButtonPressed = true;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 23.0 , right: 23.0 , bottom: 25),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [


        
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: ElevatedButton(
              onPressed: () async {

                try {
                  var imageId = await ImageDownloader.downloadImage(widget.imgUrl);
                  if (imageId == null) {
                    return;
                  }

                  // Below is a method of obtaining saved image information.
                  var fileName = await ImageDownloader.findName(imageId);
                  print(fileName);



                }  catch (error) {

                }

              },


              child: Text(
                "                     Download                     " ,
                style:TextStyle(
                  fontSize: 15,
                ) ,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.3),

                padding: EdgeInsets.all(21),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: ElevatedButton(
              onPressed: () {

                setState(() {
                  isButtonPressed = !isButtonPressed;
                });
              },
              child: Icon(

                isButtonPressed ? Icons.favorite_border : Icons.favorite,

                size: 25,

              ),
              style:
              ElevatedButton.styleFrom(

                backgroundColor:
                isButtonPressed ? Colors.black.withOpacity(0.3) : Colors.redAccent ,

                padding: EdgeInsets.all(20),

              ),
            ),
          ),

        ],
      ),
    );
  }
}
