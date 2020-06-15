import 'package:flutter/material.dart';

class HeroExample extends StatelessWidget {
  String title;

  HeroExample({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Content()
      )
    );
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(15),
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      crossAxisCount: 2,
      children: List.generate(50, (index) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    title: 'Detalles del Producto',
                    id: index
                  )
                ),
              );
            },
            child: Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Hero(
                  tag: 'product' + index.toString(),
                  child: Image.asset(
                    'assets/images/product.png',
                    height: 300.0,
                    fit: BoxFit.cover,
                  )
                )
              )
            ),
          );
        }
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  String title;
  int id;

  DetailsPage({Key key, this.title, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ProductDetails(
          id: this.id
        )
      )
    );
  }
}

class ProductDetails extends StatelessWidget {
  int id;

  ProductDetails({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Nombre del producto',
                style: TextStyle(
                  fontSize: 26
                )
              ),
              Spacer(),
              Icon(
                Icons.favorite
              )
            ]
          )
        ),
        Container(
          padding: EdgeInsets.all(20),
          width: deviceWidth,
          child: Hero(
            tag: 'product' + id.toString(),
            child: Image.asset(
              'assets/images/product.png',
              height: 300.0,
              fit: BoxFit.cover,
            )
          )
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Text('Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlineButton(
                onPressed: () {
                  /*...*/
                },
                child: Container(
                  color: Colors.red[900],
                  height: 15,
                  width: 15
                ),
              ),
              OutlineButton(
                onPressed: () {
                  /*...*/
                },
                child: Text(
                  'M',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
              OutlineButton(
                onPressed: () {
                  /*...*/
                },
                child: Text(
                  'Añadir al Carro',
                ),
              )
            ]
          )
        )
      ],
    );
  }
}
