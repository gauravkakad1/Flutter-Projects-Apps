import 'package:covid_app/Models/countries_list_model.dart';
import 'package:covid_app/Services/states_services.dart';
import 'package:covid_app/views/countries_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';
class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {

  StatesServices statesServices = StatesServices();
  TextEditingController _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value){
                  setState(() {

                  });
                },
                controller: _search,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal:20),
                  hintText: "Search",
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(

                  future: statesServices.getCountriesList(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if(!snapshot.hasData){
                      return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade100,
                          child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context , index){
                              return ListTile(
                                leading: Container(
                                    height: 50,
                                    width:50 ,
                                    color: Colors.white
                                ),
                                title: Container(height: 10,width: double.infinity,color: Colors.white,),
                                subtitle:Container(height: 10,width: double.infinity,color: Colors.white),
                              );
                            },

                          )
                      );
                    }
                    else{
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context , index){
                          String searchName = snapshot.data![index]['country'];
                          if(_search.text.isEmpty){
                            return InkWell(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context)=>CountriesDetailScreen(
                                          image: snapshot.data![index]['countryInfo']['flag'],
                                          name: snapshot.data![index]['country'] ,
                                          totalCases:  snapshot.data![index]['cases'] ,
                                          totalRecovered: snapshot.data![index]['recovered'] ,
                                          totalDeaths: snapshot.data![index]['deaths'],
                                          active: snapshot.data![index]['active'],
                                          test: snapshot.data![index]['tests'],
                                          todayRecovered: snapshot.data![index]['todayRecovered'],
                                          critical: snapshot.data![index]['critical'] ,

                                        )
                                    ));
                              },
                              child: ListTile(
                                leading: Image(
                                    height: 50,
                                    width:50 ,
                                    image: NetworkImage(snapshot.data![index]['countryInfo']['flag'])
                                ),
                                title: Text(snapshot.data![index]['country']),
                                subtitle: Text(snapshot.data![index]['cases'].toString()),
                              ),
                            );
                          }
                          else if(searchName.toLowerCase().contains(_search.text.toLowerCase())){
                            return InkWell(
                              onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context)=>CountriesDetailScreen(
                                        image: snapshot.data![index]['countryInfo']['flag'],
                                        name: snapshot.data![index]['country'] ,
                                        totalCases:  snapshot.data![index]['cases'] ,
                                        totalRecovered: snapshot.data![index]['recovered'] ,
                                        totalDeaths: snapshot.data![index]['deaths'],
                                        active: snapshot.data![index]['active'],
                                        test: snapshot.data![index]['tests'],
                                        todayRecovered: snapshot.data![index]['todayRecovered'],
                                        critical: snapshot.data![index]['critical'] ,

                                      )
                                  ));
                            },
                              child: ListTile(
                                leading: Image(
                                    height: 50,
                                    width:50 ,
                                    image: NetworkImage(snapshot.data![index]['countryInfo']['flag'])
                                ),
                                title: Text(snapshot.data![index]['country']),
                                subtitle: Text(snapshot.data![index]['cases'].toString()),
                              ),
                            );
                          }
                          else{
                            return Container();
                          }

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
