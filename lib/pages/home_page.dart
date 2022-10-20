import 'package:flutter/material.dart';
import 'package:shopapp/api/api.dart';
import 'package:shopapp/database/favorites_sql.dart';

class CardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CardPageState();
  }
}

class CardPageState extends State<CardPage> {


  List<ProductFilter> data = [];

  void initState() {
    super.initState();
    var ShopApiData = GetShopData();

    ShopApiData.getProducts().then((value) {
        setState(() {
        data = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Expanded(
        child: Container(
          child: GridView.count(
            childAspectRatio: (itemWidth / itemHeight) + 0.1,
            primary: false,
            padding: const EdgeInsets.all(10),
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            crossAxisCount: 2,
            children: <Widget>[
              for(var i in data)
                Container(

                  decoration:
                  BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.black.withOpacity(0.359),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: (){
                      // print(i);
                      Navigator.of(context).pushNamed('/product',
                          arguments: i
                      );
                    },
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 8)),
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child:  Image.network(i.cover ,
                              fit: BoxFit.fill,

                            ),

                          ),
                          decoration:
                          BoxDecoration(
                            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
                          ),

                          height: 150,
                          width: 170,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Padding(padding: EdgeInsetsDirectional.all(4)),

                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  height: 20,
                                  width: 166,
                                  child: Text(
                                    i.name,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Padding(padding: EdgeInsetsDirectional.all(2)),
                                Container(
                                  height: 30,
                                  width: 166,
                                  margin: EdgeInsets.only(left: 8),
                                  padding: EdgeInsets.only(right: 8),
                                  child: Text(
                                    i.description,
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Padding(padding: EdgeInsetsDirectional.all(2)),
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  height: 40,
                                  width: 166,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Column(
                                            children: [
                                              Container(
                                                  height: 40,
                                                  child: Align(
                                                    alignment: Alignment.centerLeft,
                                                    child:  Text(
                                                      i.price ,
                                                      style: TextStyle(
                                                        color: Colors.white.withOpacity(0.6),
                                                      ),
                                                    ),
                                                  )
                                              )
                                            ],
                                          )
                                      ),
                                      Container(
                                        height: 40,
                                        width: 40,
                                        child: IconButton(
                                          onPressed: () => {


                                          },icon: Icon(
                                            Icons.add_circle_outline_sharp,
                                            size: 26.0,
                                          ),
                                          color: Colors.red[500],
                                          padding: EdgeInsets.all(2),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )

                          ],
                        ),
                      ],
                    ),
                  )

                ),

            ],
          ),
        )
    );

  }


}