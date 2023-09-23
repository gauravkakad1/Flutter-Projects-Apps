import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Models/PhotoModel.dart';
import 'Models/PostModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<PhotoModel> postList = [];
  Future<List<PhotoModel>>getPostApi() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data  = jsonDecode(response.body.toString());

    if(response.statusCode==200){
      for(Map i in data){
        postList.add(PhotoModel.fromJson(i));
      }
      return postList;
    }
    else{
      return postList;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api"),
      ),
      body:  Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostApi(),
                builder: (context,AsyncSnapshot<List<PhotoModel>> snapshot){
              if(!snapshot.hasData){
                return Text("Wait Loading...",style: TextStyle(fontSize: 50),);
              }else{
                return ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (context,index){
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(postList[index].url.toString()),
                        ),
                        title: Text(postList[index].title.toString()),
                        subtitle: Text(snapshot.data![index].url.toString()),
                      );
                }
                );

              }
            }
            ),

          )
        ],
      ),
    );
  }
}

