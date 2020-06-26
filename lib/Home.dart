import 'package:flutter/material.dart';

import 'package:talkdemo/BasicExample/BasicExample.dart';
import 'package:talkdemo/LayoutExample/LayoutExample.dart';
import 'package:talkdemo/HttpExample/HttpExample.dart';
import 'package:talkdemo/HeroExample/HeroExample.dart';
import 'package:talkdemo/ShopExample/ShopUIExample.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              // A fixed-height child.
              // color: const Color(0xffa8b9bf)
              height: 120.0,
              alignment: Alignment.center,
              child: const Text(
                'Ejemplos de Flutter',
                style: TextStyle(
                  fontSize: 30
                ),
              ),
            ),
            ListView(
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Card(
                  child: ListTile(
                    leading: FlutterLogo(
                      size: 30.0
                    ),
                    title: Text('Ejemplo por defecto'),
                    subtitle: Text('Este es el primer ejemplo creado al iniciar un proyecto de Flutter'),
                    isThreeLine: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BasicExample(
                            title: 'Hello World!'
                          )
                        ),
                      );
                    }
                  )
                ),
                Card(
                  child: ListTile(
                    leading: FlutterLogo(
                      size: 30.0
                    ),
                    title: Text('Columnas / Filas'),
                    subtitle: Text('Estructura básica'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LayoutExample(
                            title: 'Ejemplo de Estructura'
                          )
                        ),
                      );
                    }
                  )
                ),
                Card(
                  child: ListTile(
                    leading: FlutterLogo(
                      size: 30.0
                    ),
                    title: Text('Consultas HTTP'),
                    subtitle: Text('Obteniendo datos de internet'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HttpExample(
                            title: 'Ejemplo Http'
                          )
                        ),
                      );
                    }
                  )
                ),
                // Card(
                //   child: ListTile(
                //     leading: FlutterLogo(
                //       size: 30.0
                //     ),
                //     title: Text('Listas Animadas'),
                //     subtitle: Text('Obteniendo datos de internet'),
                //     onTap: () {
                //
                //     }
                //   )
                // ),
                Card(
                  child: ListTile(
                    leading: FlutterLogo(
                      size: 30.0
                    ),
                    title: Text('Hero Widgets'),
                    subtitle: Text('Obteniendo datos de internet'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HeroExample(
                            title: 'Ejemplo de Hero'
                          )
                        ),
                      );
                    }
                  )
                ),
                Card(
                  child: ListTile(
                    leading: FlutterLogo(
                      size: 30.0
                    ),
                    title: Text('Diseño de Tienda'),
                    subtitle: Text('Ejemplo del diseño de una tienda hipotética'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShopUIExample(
                            title: 'Diseño de Tienda'
                          )
                        ),
                      );
                    }
                  )
                )
              ],
            )
          ]
        )
      )
    );
  }
}
