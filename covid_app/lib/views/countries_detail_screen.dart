import 'package:covid_app/views/worldstates_screen.dart';
import 'package:flutter/material.dart';
class CountriesDetailScreen extends StatefulWidget {
  String image ;
  String  name ;
  int totalCases , totalDeaths, totalRecovered , active , critical, todayRecovered , test;

  CountriesDetailScreen({
    super.key,
    required this.image ,
    required this.name ,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,
  }) ;

  @override
  State<CountriesDetailScreen> createState() => _CountriesDetailScreenState();
}

class _CountriesDetailScreenState extends State<CountriesDetailScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
       body: SafeArea(
         child: Align(
           alignment: Alignment.center,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children:[
               Stack(
                 alignment: Alignment.topCenter,
                 children: [
                   Padding(
                     padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
                     child: Card(
                       child: Column(
                         children: [
                           SizedBox(height: MediaQuery.of(context).size.height *0.07),
                           ReusableRow(title: "Cases", value: widget.totalCases.toString()),
                           ReusableRow(title: 'Recovered', value:  widget.totalRecovered.toString(),),
                           ReusableRow(title: 'Death', value:  widget.totalDeaths.toString(),),
                           ReusableRow(title: 'Critical', value: widget.critical.toString(),),
                           ReusableRow(title: 'Today Recovered', value:widget.totalRecovered.toString(),)
                         ],
                       ),
                     ),
                   ),
                   Container(
                     height: 100,
                     width: 100,
                     child: CircleAvatar(backgroundImage: NetworkImage(widget.image)),
                   ),
                 ],
               ),

             ]
           ),
         ),
       ),
    );
  }
}

