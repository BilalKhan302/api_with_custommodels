import 'dart:convert';

import 'package:flutter/material.dart';

import 'models/UserModel.dart';
import 'package:http/http.dart'as http;
class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  List<UserModel> list=[];
  Future<List<UserModel>> getUser()async{
    final response= await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map i in data){
        list.add(UserModel.fromJson(i));
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
              future: getUser(),
              builder: (context,AsyncSnapshot<List<UserModel>>snapshot){
            return Expanded(
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context,index){
                return Card(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(list[index].name.toString()),
                        ],
                      ),
                      Row(children: [
                        Text(snapshot.data![index].address!.street.toString()),

                      ],)
                    ],
                  ),
                );
              }),
            );
          })
        ],
      ),
    );
  }
}
