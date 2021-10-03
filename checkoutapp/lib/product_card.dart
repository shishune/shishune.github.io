import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'product.dart';

class ProductCard extends StatefulWidget {
  Product product;

  ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              child: Center(
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue[500],
                      image: DecorationImage(
                          image: NetworkImage(
                            widget.product.imageURL,
                          )
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )
              ),
            ),
            SizedBox(width:12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                    child: Text(
                      widget.product.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      // SizedBox(
                      //   height:20,
                      //   width: 20,
                      //   child:
                      // ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          // padding: EdgeInsets.all(5),
                          fixedSize: Size(20, 20),
                          onPrimary: Colors.grey,
                          shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          )
                        ),
                        onPressed: (){
                          setState(() {
                            widget.product.decrementCount();
                          });
                        },
                        icon: Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 15,
                        ),
                        label:  Text('')),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:  8.0),
                        child: Text(
                          widget.product.count.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(10,10),
                              onPrimary: Colors.blue,
                              shape: new RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              )
                          ),
                          onPressed: (){
                            setState(() {
                              widget.product.incrementCount();
                            });
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 15,
                          ),
                          label:  Text('')),
                      Spacer(),
                      Text(
                        "\$ ${widget.product.getPrice()}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5)
                    ],
                  ),
                  SizedBox(height: 5)
                ],
              ),
            )
          ]
      ),
    );
  }
}