import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpExample extends StatefulWidget {
  HttpExample({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HttpExampleState createState() => _HttpExampleState();
}

class _HttpExampleState extends State<HttpExample> {
  List<dynamic> data = [];
  bool isLoading = false;

  void getData() async {
    setState(() {
      isLoading = true;
    });
    var url = 'https://restriccion.ferativ.com/api/v1/air-quality';
    var response = await http.get(url);
    List<dynamic> body = json.decode(response.body);
    print(body);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    setState(() {
      data = body;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            OutlineButton(
              onPressed: () {
                getData();
              },
              child: Text(
                'Obtener datos',
              ),
            ),
            Text(
              (isLoading == true) ? 'Cargando...' : ''
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 2.0,
                  color: _getColorByQuality(data[index]['airQuality']),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: Text(
                            LocalizationHelper.localizeText(data[index]['airQuality']),
                            style: Theme.of(context).textTheme.headline.apply(color: Colors.white)
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: Text(
                            LocalizationHelper.localizeText(data[index]['date']),
                            style: TextStyle(
                              color: Colors.black
                            )
                          ),
                        )
                      ]
                    )
                  )
                );
              }
            )
          ],
        )
      )
    );
  }
}

class LocalizationHelper {
  static Map<String, String> categories = {
    'good': 'Bueno',
    'regular': 'Regular',
    'alert': 'Alerta',
    'preemergency': 'Preemergencia',
    'emergency': 'Emergencia'
  };
  static String localizeText (String category) {
    return categories[category] != null ? categories[category] : category;
  }
}

_getColorByQuality(quality) {
  if ( quality == 'good' ) {
    return Color(0xff2e9100);
  } else if ( quality == 'regular' ) {
    return Color(0xffE4B50C);
  } else if ( quality == 'alert' ) {
    return Color(0xffEC713D);
  } else if ( quality == 'preemergency' ) {
    return Color(0xffDE3C3A);
  } else if ( quality == 'emergency' ) {
    return Color(0xff794F92);
  } else {
    return Colors.white;
  }
}
