import 'package:flutter/material.dart';

class CategoriesModel with ChangeNotifier {
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;

  CategoriesModel({this.id, this.name, this.image, this.creationAt, this.updatedAt});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }

  static List<CategoriesModel> categoriesFromSnapshot (List categorySnapshot) {
    //print("data ${productSnapshot[0]}");
    return categorySnapshot.map((data){
      //print("data $data");
      return CategoriesModel.fromJson(data);
    }).toList(); //Without the toList()  got an error in regards to iterable
  }

}