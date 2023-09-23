import 'dart:convert';

import 'package:api_tut/Models/ComplexModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ComplexJsonScreen extends StatefulWidget {
  const ComplexJsonScreen({super.key});

  @override
  State<ComplexJsonScreen> createState() => _ComplexJsonScreenState();
}

class _ComplexJsonScreenState extends State<ComplexJsonScreen> {
  var data;
  Future<void> getComplexApi () async{
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    http.Response response = await http.get(url);

    if(response.statusCode==200){
      data = json.decode(response.body.toString());

      // print(ComplexModel.fromJson(data));
      // return ComplexModel.fromJson(data);
    }
    else{
      // return ComplexModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complex Json Api"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getComplexApi(),
                builder: (complex , snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  // else if(!snapshot.hasData){
                  //   return Text("NO data ......");
                  // }
                  else{
                    return ListView.builder(
                      itemCount: data.length ,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            children: [
                              ReuseableRow(title: "ID" , value: data[index]["id"].toString()),
                              ReuseableRow(title: "Name" , value: data[index]["name"].toString()),
                              ReuseableRow(title: "User Name" , value: data[index]["username"].toString()),
                              ReuseableRow(title: "lat" , value: data[index]["address"]["geo"]["lat"].toString()),
                              ReuseableRow(title: "lng" , value: data[index]["address"]["geo"]["lng"].toString()),
                            ],
                          ),
                        );
                      },

                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}


class ReuseableRow extends StatelessWidget {
  String title,value;
  ReuseableRow({super.key, required this.title , required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),
          Text(value),

        ],
      ),
    );
  }
}
