import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'product.dart';
import 'product_card.dart';
import 'cart.dart';

void main() {
  runApp(MaterialApp(
    home: CartView(),
  ));
}

class CartView extends StatefulWidget{
  @override
  _CartViewState createState() => _CartViewState();

}

class _CartViewState extends State<CartView>{

  Cart cart = Cart([
    Product(name:"Brain, lightly used",
        imageURL: "https://cdn.discordapp.com/attachments/703727602350686348/894113828659404841/unknown.png",
        price: 101.00),
    Product(name:"Soul, dark",
        imageURL: "https://cdn.discordapp.com/attachments/703727602350686348/894113828659404841/unknown.png",
        price: 50.00),
    Product(name:"Spirit, battered",
        imageURL: "https://cdn.discordapp.com/attachments/703727602350686348/894113828659404841/unknown.png",
        price: 1000.00),
  ]);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        elevation: 1.0,
        // leading: IconButton(
        //   icon: Icon(Icons.keyboard_arrow_left),
        //   onPressed: (){},
        // ),
        title: Text(
          "Shopping Cart",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: cart.products.map((product) => ProductCard(product: product)).toList(),
                  ),
                  MaterialButton(
                    onPressed: (){
                      setState((){
                        cart.applyDiscount();
                      });
                    },
                    color: Colors.red,
                    height: 20,
                    minWidth: double.infinity ,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                        "Apply 20% off Discount",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Sub Total",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "\$ ${cart.getSubTotal().toStringAsFixed(2)}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Discount",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "\$ ${cart.getDiscount().toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Taxes",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "\$ ${cart.getTax().toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Total",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "\$ ${cart.getTotal().toStringAsFixed(2)}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  MaterialButton(
                    onPressed: (){
                      setState((){});
                    },
                    color: Colors.cyan,
                    height: 40,
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                        "Calculate!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                  ),
                  SizedBox(height: 5),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }

}






