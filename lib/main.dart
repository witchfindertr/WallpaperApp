import 'package:flutter/material.dart';
import 'package:photos/Screen/homeScreen.dart';
import 'package:dio/dio.dart';

void main(){
  runApp(
      MyMaterial()
  );
}

class MyMaterial extends StatefulWidget {
  const MyMaterial({Key? key}) : super(key: key);

  @override
  State<MyMaterial> createState() => _MyMaterialState();
}

class _MyMaterialState extends State<MyMaterial> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
