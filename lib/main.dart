import 'dart:convert';
import 'package:api_with_custommodels/2nd.dart';
import 'package:api_with_custommodels/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'button.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Button(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Photos> photoList=[];
  Future<List<Photos>> getPhotos()async{
    final response= await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map i in data){
        Photos photos=Photos(title: i["title"], url: i["url"], id: i["id"]);
        photoList.add(photos);
      }
      return photoList;
    }else{
     return photoList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
               FutureBuilder(
                 future: getPhotos(),
                   builder: (context,AsyncSnapshot<List<Photos>> snapshot){
                 if(!snapshot.hasData){
                   return CircularProgressIndicator();
                 }else{
                   return Expanded(
                     child: ListView.builder(
                       itemCount: photoList.length,
                         itemBuilder: (context,index){
                       return ListTile(
                         leading: CircleAvatar(
                           backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
                         ),
                         title: Text(snapshot.data![index].title.toString()),
                         subtitle: Text(snapshot.data![index].id.toString()),
                       );
                     }),
                   );
                 }
               })
        ],
      ),
    );
  }
}
class Photos{
  String title,url;
  int id;
  Photos({required this.title,required this.url,required this.id});
}