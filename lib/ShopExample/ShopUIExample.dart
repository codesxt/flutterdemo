import 'package:flutter/material.dart';

class ShopUIExample extends StatefulWidget {
  ShopUIExample({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ShopUIExampleState createState() => _ShopUIExampleState();
}

class _ShopUIExampleState extends State<ShopUIExample> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      extendBody: true,
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          height: deviceHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.red,
                Colors.orange
              ]
            )
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Container(
              //   height: 70.0,
              //   alignment: Alignment.center,
              //   child: const Text(
              //     'Mi tienda',
              //     style: TextStyle(
              //       fontSize: 30
              //     ),
              //   ),
              // ),
              Container(
                padding: EdgeInsets.only(
                  top: 20.0,
                  left: 20.0,
                  right: 20.0,
                  bottom: 20.0
                ),
                child: ShopSearchBar()
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 20.0,
                  bottom: 10.0
                ),
                child: ShopCategories()
              ),
              Container(
                height: 300,
                padding: EdgeInsets.only(
                  top: 20.0
                ),
                child: ProductsHighlights()
              )
            ]
          )
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        color: Colors.transparent,
        child: RaisedButton(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.red)
          ),
          onPressed: () {},
          color: Colors.red,
          textColor: Colors.white,
          child: Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart
                ),
                SizedBox(
                  width: 10
                ),
                Text(
                  "Confirmar Pedido",
                  style: TextStyle(
                    fontSize: 18
                  )
                )
              ]
            )
          ),
        ),
      )
    );
  }
}

class ShopSearchBar extends StatelessWidget {
  ShopSearchBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: new InputDecoration(
        prefixIcon: Icon(Icons.search),
        focusedBorder: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
          borderSide: BorderSide.none
        ),
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
          borderSide: BorderSide.none
        ),
        filled: true,
        hintStyle: new TextStyle(
          color: Colors.grey[800]
        ),
        hintText: "Busca productos",
        fillColor: Colors.grey[100]
      ),
    );
  }
}

class ShopCategories extends StatelessWidget {
  ShopCategories({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FloatingActionButton(
          heroTag: null,
          elevation: 10.0,
          onPressed: () {
          },
          child: Icon(
            Icons.cake,
            color: Colors.yellow[600]
          ),
          backgroundColor: Colors.red[800],
        ),
        SizedBox(width: 20.0),
        FloatingActionButton(
          heroTag: null,
          elevation: 6.0,
          onPressed: () {
          },
          child: Icon(
            Icons.card_giftcard,
            color: Colors.red
          ),
          backgroundColor: Colors.white,
        ),
        SizedBox(width: 20.0),
        FloatingActionButton(
          heroTag: null,
          elevation: 6.0,
          onPressed: () {
          },
          child: Icon(
            Icons.directions_bike,
            color: Colors.red
          ),
          backgroundColor: Colors.white,
        ),
        SizedBox(width: 20.0),
        FloatingActionButton(
          heroTag: null,
          elevation: 6.0,
          onPressed: () {
          },
          child: Icon(
            Icons.directions_car,
            color: Colors.red
          ),
          backgroundColor: Colors.white,
        )
      ]
    );
  }
}

class ProductsHighlights extends StatefulWidget {
  ProductsHighlights({Key key}) : super(key: key);

  @override
  _ProductsHighlightsState createState() => _ProductsHighlightsState();
  }

class _ProductsHighlightsState extends State<ProductsHighlights> {
  final pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.6
  );


  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: 5,
      itemBuilder: (context, index) {
        return ProductCard();
      }
    );
  }
}

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20.0
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        child: Stack(
          overflow: Overflow.clip,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(15),
                height: 200,
                child: Image.asset(
                  'assets/images/product.png',
                  width: 600.0,
                  height: 240.0,
                  fit: BoxFit.cover,
                )
              )
            ),
            Positioned(
              top: 5,
              right: 5,
              child: FloatingActionButton(
                mini: true,
                heroTag: null,
                elevation: 6.0,
                onPressed: () {
                },
                child: Icon(
                  Icons.favorite,
                  color: Colors.white
                ),
                backgroundColor: Colors.red,
              )
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(15),
                height: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Producto',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      )
                    ),
                    Text('\$100')
                  ]
                )
              )
            )
          ]
        )
      )
    );
  }
}
