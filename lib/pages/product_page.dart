import 'package:flutter/material.dart';
import 'package:shopapp/api/api.dart';
import 'package:shopapp/database/favorites_sql.dart';

class ProductPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProductPageState();
  }
}

class ProductPageState extends State<ProductPage> {

  // Map data = {};
  var favorites = Favorites();
  var isInFavorites = false;
  void initState() {
    favorites.connect().then((value) {
      favorites.getFavorites().then((value) {
        ProductFilter args = ModalRoute.of(context)!.settings.arguments as ProductFilter;
        for (var m in value) {
          if (m.name == args.name) {
            setState(() {
              isInFavorites = true;
            });
            break;
          }
        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    ProductFilter data  = ModalRoute.of(context)?.settings.arguments as ProductFilter;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(data.name),
        actions: [
          IconButton(onPressed: () {

            if (isInFavorites) {
              favorites.removeFromFavorites(data);
              setState(() {
                isInFavorites = false;
              });
            } else {
              favorites.addToFavorites(data);
              setState(() {
                isInFavorites = true;
              });
            }
          }, icon: Icon(
              isInFavorites ? Icons.favorite : Icons.favorite_border),
              color: Colors.red[700],
          )
        ],

      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(8,8,8,0),
                // color: Colors.blue,
                width: 500,
                height: height/2,
                child: Container(
                  margin: EdgeInsets.all(8),
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],

                    color: Colors.blue,
                  ),

                  child: ClipRRect(
                       borderRadius: BorderRadius.circular(16),
                      child:Image.network(data.cover,fit: BoxFit.fill)
                  ),
                ),
              )
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(8,8,8,8),
            height: height/2,
            width: 500,
            padding: EdgeInsets.all(8),
            alignment: Alignment.topRight,
            child:
              Column(
                children: [
                  Text(
                    data.description,
                    style: TextStyle(
                      fontSize: 24,
                    ),

                  ),
                ],
              )
            // color: Colors.white,
          )
        ],
      ),
    );
  }
}