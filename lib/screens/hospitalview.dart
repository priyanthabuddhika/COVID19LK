import 'package:flutter/material.dart';

class HospitalView extends StatefulWidget {
  @override
  _HospitalViewState createState() => _HospitalViewState();
}

class _HospitalViewState extends State<HospitalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container() );
   }
}
 

 /* SafeArea(child:  ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        // 4
        itemCount: (hospitalList == null ||
                hospitalList.hospitals == null ||
                hospitalList.hospitals.length == 0)
            ? 0
            : hospitalList.hospitals.length,
        itemBuilder: (context, index) {
          // 5
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return CatInfo(catId: 'id', catBreed: 'Name');
              }));
            },
            // 6
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                // 7
                child: ListTile(
                  title: Text(hospitalList.hospitals[index].name),
                  subtitle: Text(hospitalList.hospitals[index].id.toString()),
                ),
              ),
            ),
          );
        }),
 
      ,)
   
   */