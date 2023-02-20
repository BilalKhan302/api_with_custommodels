import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Custom extends StatefulWidget {
  const Custom({Key? key}) : super(key: key);

  @override
  State<Custom> createState() => _CustomState();
}

class _CustomState extends State<Custom> {
List<Photos> list=[];
Future<List<Photos>> getPhoto() async{
  final response= await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
  var data= jsonDecode(response.body.toString());
  if(response.statusCode==200){
    for(Map i in data){
      Photos photos=Photos(url: i["url"], title: i["title"], id: i["id"]);
      list.add(photos);
    }
    return list;
  }else{
    return list;
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           FutureBuilder(
               future: getPhoto(),
               builder: (context,AsyncSnapshot<List<Photos>>snapshot){
             if(!snapshot.hasData){
               return CircularProgressIndicator();
             }else{
               return Expanded(
                 child: ListView.builder(
                     itemCount: list.length,
                     itemBuilder: (context,index){
                   return ListTile(
                     title: Text(snapshot.data![index].title.toString()),
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
  String url,title;
  int id;
  Photos({required this.url,required this.title,required this.id});
}