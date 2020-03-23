import 'dart:convert';
import 'package:covid19lk/models/destination.dart';
import 'package:covid19lk/models/hospital.dart';
import 'package:covid19lk/models/local.dart';
import 'package:covid19lk/networking/hpbapi.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key key, this.destination }) : super(key: key);
  final Destination destination;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Local localData;
  bool _busy = false;
  HospitalList hospitalList = HospitalList();
  
  @override
  void initState() {
    super.initState();
    _busy = true;
    // Calling get health data function to retrieve json data from API
    getHealthData().then((val) {
      setState(() {
        _busy = false;
      });
    });
  }

  void setBusy() {
    setState(() {
      _busy = false;
    });
  }

  getHealthData() async {
    var result = await HealthAPI().getHealthStat();
    print(result);

    var localMap = jsonDecode(result);
    setState(() {
      localData = Local.fromJson(localMap);
      hospitalList = HospitalList.fromJson(localMap['data']['hospital_data']);
      print(hospitalList.hospitals[0].name);
      _busy = false;
      //print(localData.total);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  child: Column(children: <Widget>[
                    ListTile(
                      contentPadding: EdgeInsets.fromLTRB(34.0, 14.0, 0.0, 0.0),
                      title: Text(
                        'COVID 19',
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(102, 102, 102, 1),
                        ),
                      ),
                      subtitle: Text(
                        'STATISTICS',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color.fromRGBO(102, 102, 102, 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Card(
                      elevation: 4.0,
                      margin: const EdgeInsets.fromLTRB(21.0, 0.0, 21.0, 19.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(19.0),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              contentPadding:
                                  EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                              leading: Image.asset('images/slflag.png'),
                              title: Text(
                                'SRI LANKA',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(101, 102, 102, 1)),
                              ),
                              subtitle: Text(
                                'PATIENTS REPORT\n${localData.date}',
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: SizedBox(
                                    height: 110.0,
                                    child: Card(
                                      color: Color.fromRGBO(142, 32, 41, 1),
                                      margin: EdgeInsets.fromLTRB(
                                          0.0, 0.0, 12.0, 12.0),
                                      child: ListTile(
                                        contentPadding: EdgeInsets.fromLTRB(
                                            8.0, 8.0, 8.0, 0.0),
                                        title: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${localData.newCases}',
                                            style: TextStyle(
                                              fontSize: 35.0,
                                              color: Color.fromRGBO(
                                                  255, 183, 0, 1),
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        subtitle: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 6.0),
                                          child: Text(
                                            'New Cases',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Color.fromRGBO(
                                                    251, 251, 251, 1)),
                                          ),
                                        ),
                                      ),
                                      elevation: 4.0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 110.0,
                                    child: Card(
                                      margin: EdgeInsets.fromLTRB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: ListTile(
                                        contentPadding: EdgeInsets.fromLTRB(
                                            8.0, 8.0, 8.0, 0.0),
                                        title: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${localData.hospital}',
                                            style: TextStyle(
                                              fontSize: 35.0,
                                              color: Color.fromRGBO(
                                                  255, 183, 0, 1),
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        subtitle: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 6.0),
                                          child: Text(
                                            'Suspects',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      elevation: 4.0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 110.0,
                                    child: Card(
                                      color: Color.fromRGBO(242, 32, 41, 1),
                                      margin: EdgeInsets.fromLTRB(
                                          12.0, 0.0, 0.0, 12.0),
                                      child: ListTile(
                                        contentPadding: EdgeInsets.fromLTRB(
                                            8.0, 8.0, 8.0, 0.0),
                                        title: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${localData.recovered}',
                                            style: TextStyle(
                                              fontSize: 35.0,
                                              color: Color.fromRGBO(
                                                  255, 183, 0, 1),
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        subtitle: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 6.0),
                                          child: Text(
                                            'Recovered',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Color.fromRGBO(
                                                    251, 251, 251, 1)),
                                          ),
                                        ),
                                      ),
                                      elevation: 4.0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Card(
                                    margin: EdgeInsets.fromLTRB(
                                        0.0, 12.0, 12.0, 0.0),
                                    child: ListTile(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          8.0, 8.0, 8.0, 0.0),
                                      title: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '${localData.total}',
                                          style: TextStyle(
                                            fontSize: 35.0,
                                            color:
                                                Color.fromRGBO(255, 183, 0, 1),
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      subtitle: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 6.0),
                                        child: Text(
                                          'Total Cases',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  ),
                                ),
                                Expanded(
                                  child: Card(
                                    margin: EdgeInsets.fromLTRB(
                                        12.0, 12.0, 0.0, 0.0),
                                    child: ListTile(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          8.0, 8.0, 8.0, 0.0),
                                      title: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '${localData.deaths}',
                                          style: TextStyle(
                                            fontSize: 35.0,
                                            color:
                                                Color.fromRGBO(255, 183, 0, 1),
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      subtitle: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 6.0),
                                        child: Text(
                                          'Deaths',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Card(
                      elevation: 4.0,
                      margin: const EdgeInsets.fromLTRB(21.0, 0.0, 21.0, 19.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(19.0),
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'GLOBAL',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(101, 102, 102, 1)),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Card(
                                    color: Color.fromRGBO(1, 59, 166, 1),
                                    margin:
                                        EdgeInsets.fromLTRB(0.0, 0.0, 6.0, 6.0),
                                    child: ListTile(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          0.0, 0.0, 0.0, 0.0),
                                      title: Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Text(
                                          '245,913',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromRGBO(
                                                251, 251, 251, 1),
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      subtitle: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 6.0),
                                        child: Text(
                                          'Total Cases',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              color: Color.fromRGBO(
                                                  251, 251, 251, 1)),
                                        ),
                                      ),
                                    ),
                                    elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  ),
                                ),
                                Expanded(
                                  child: Card(
                                    margin:
                                        EdgeInsets.fromLTRB(6.0, 0.0, 0.0, 6.0),
                                    child: ListTile(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          0.0, 0.0, 0.0, 0.0),
                                      title: Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Text(
                                          '26,111',
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color:
                                                Color.fromRGBO(1, 59, 166, 1),
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      subtitle: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 6.0),
                                        child: Text(
                                          'New Cases',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 10.0),
                                        ),
                                      ),
                                    ),
                                    elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  ),
                                ),
                                Expanded(
                                  child: Card(
                                    margin:
                                        EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
                                    child: ListTile(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          0.0, 0.0, 0.0, 0.0),
                                      title: Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Text(
                                          '10,048',
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color:
                                                Color.fromRGBO(1, 59, 166, 1),
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      subtitle: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 6.0),
                                        child: Text(
                                          'Deaths',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 10.0),
                                        ),
                                      ),
                                    ),
                                    elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  ),
                                ),
                                Expanded(
                                  child: Card(
                                    margin:
                                        EdgeInsets.fromLTRB(6.0, 0.0, 0.0, 0.0),
                                    child: ListTile(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          0.0, 0.0, 0.0, 0.0),
                                      title: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '88,138',
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color:
                                                Color.fromRGBO(1, 59, 166, 1),
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      subtitle: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 6.0),
                                        child: Text(
                                          'Recovered',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 10.0),
                                        ),
                                      ),
                                    ),
                                    elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
      ),
    );
  }
}
