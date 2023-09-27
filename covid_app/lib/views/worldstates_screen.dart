import 'package:covid_app/Models/worldstates_model.dart';
import 'package:covid_app/Services/states_services.dart';
import 'package:covid_app/views/countries_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';
class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen> with TickerProviderStateMixin{



  late final AnimationController _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this
  )..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  final colorList = <Color>[
    Color(0xff4285F4),
    Color(0xff1aa260),
    Color(0xffde5246),
    ];

  StatesServices statesServices = StatesServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
              FutureBuilder(
                  future: statesServices.getStatsData(),
                  builder: (context, AsyncSnapshot<WorldStatesModel>snapshot){
                    if(!snapshot.hasData){
                      return Expanded(
                          child: SpinKitFadingCircle(
                            controller: _animationController,
                            color: Colors.white,
                            size: 50,
                          )
                      );
                    }
                    else{
                      return Column(
                        children: [
                          PieChart(
                            dataMap: {
                            "Total": double.parse(snapshot.data!.cases.toString()),
                            "Recoverd":double.parse(snapshot.data!.recovered.toString()),
                            "Death":double.parse(snapshot.data!.deaths.toString())
                          },
                            animationDuration: const Duration(milliseconds: 1200),
                            colorList: colorList,
                            chartRadius: MediaQuery.of(context).size.width/3,
                            chartValuesOptions: const ChartValuesOptions(
                              showChartValuesInPercentage: true
                            ),
                            legendOptions: const LegendOptions(
                              legendPosition: LegendPosition.left,
                            ),
                            chartType: ChartType.ring,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height *0.03),
                            child: Card(
                              child: Column(
                                children: [
                                  ReusableRow(title: "Total", value: snapshot.data!.cases.toString()),
                                  ReusableRow(title: "Death", value: snapshot.data!.deaths.toString()),
                                  ReusableRow(title: "Recovered", value:snapshot.data!.recovered.toString()),
                                  ReusableRow(title: "Active", value:snapshot.data!.active.toString()),
                                  ReusableRow(title: "Critical", value:snapshot.data!.critical.toString()),
                                  ReusableRow(title: "Today Deaths", value:snapshot.data!.todayDeaths.toString()),
                                  ReusableRow(title: "Today Recovered", value:snapshot.data!.todayRecovered.toString()),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>CountriesListScreen()));
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xff1aa260),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text("Track Countries"),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  }
              ),


            ],
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatefulWidget {
   final title,value;
   ReusableRow({super.key,required this.title , required this.value});

  @override
  State<ReusableRow> createState() => _ReusableRowState();
}

class _ReusableRowState extends State<ReusableRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title , style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w400)),
              Text(widget.value , style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w400)),
            ],
          ),
          const SizedBox(height: 5,),
          const Divider()
        ],
      ),
    );
  }
}

