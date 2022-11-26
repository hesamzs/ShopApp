import 'package:flutter/material.dart';
import 'package:shopapp/api/api.dart';

class SubCategory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SubCategoryState();
  }
}

class SubCategoryState extends State<SubCategory> {

  List subcategory = [];


  @override
  Widget build(BuildContext context) {
    CategoryFilter data  = ModalRoute.of(context)?.settings.arguments as CategoryFilter;


    return Scaffold(
      appBar: AppBar(
        title: Text(data.name + " محصولات"),
      ),
      body:
      data.products.length > 0 ?
      ListView(
        children: [
          for (var product in data.products)
            Container(
              margin: EdgeInsets.fromLTRB(8,8,8,0),
              width: 500,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black54,
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(8,8,8,8),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        product['cover'][0]['url'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: 90,
                    height: 90,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0,8,8,8),
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    width: 260,
                    height: 90,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(8,8,0,8),
                          width: 250,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                                  // color: Colors.black54
                                ),
                                margin: EdgeInsets.fromLTRB(0,0,8,0),
                                width: 250,
                                height: 30,
                                alignment: Alignment.center,
                                child: Text(

                                  product['name'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),


                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                                  // color: Colors.black54,
                                ),
                                margin: EdgeInsets.fromLTRB(0,4,8,0),
                                width: 250,
                                height: 30,
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(8,4,4,4),
                                      alignment: Alignment.center,
                                      // color: Colors.red,
                                      width: 190,
                                      height: 30,
                                      child:Text(
                                        product['description'],
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0,4,8,4),
                                      width: 30,
                                      height: 30,
                                      child: IconButton(
                                        onPressed: () => {
                                        },icon: Icon(
                                        Icons.shopping_basket,
                                        size: 26.0,
                                      ),
                                        color: Colors.white70,
                                        padding: EdgeInsets.all(2),
                                      ),

                                    )
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
        ],
        physics: BouncingScrollPhysics(),
      ) :
      Container(
          decoration: BoxDecoration(
            color: Colors.black54,
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          margin: EdgeInsets.fromLTRB(8,8,8,0),
          width: 600,
          height: 100,
          alignment: Alignment.center,
          child:Text(    'This Category is Empty !',
            style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.bold
            ),
          )
      )
    );
  }
}