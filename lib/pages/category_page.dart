import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopapp/api/api.dart';


class CategoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CategoryPageState();
  }
}

class CategoryPageState extends State<CategoryPage> {

  List data = [];
  bool _isLoading = true;

  void initState() {

    super.initState();
    var ShopApiData = GetShopData();
    ShopApiData.getCategory().then((value) {
      if (!mounted) {
        return;
      }setState(() {
        data = value;
        Timer(Duration (milliseconds : 500), () {
          if (!mounted) {
            return;
          }setState(() {
          _isLoading = false;
        });});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
          children: [

            Padding(padding: EdgeInsets.only(top: 8)),
            _isLoading ? Expanded(
              child: ListView.builder(
                  itemCount: 8, itemBuilder: (context,index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey,
                      ),
                      height: 150,
                      margin: EdgeInsets.fromLTRB(20,0,20,8),
                    );
                  }
                  )
            ) :
            Expanded(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: (context,index) {
                      return Container(
                          height: 150,
                          margin: EdgeInsets.fromLTRB(20,0,20,8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)
                          ),
                        child: GestureDetector(
                          onTap: ()  {
                            Navigator.of(context).pushNamed('/category',
                                arguments: data[index]
                            );

                          },
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    data[index].cover,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Expanded(
                                      child: Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                                          color: Colors.black12,
                                        ),
                                      )
                                  ),
                                  Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                                      color: Colors.black87,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                              margin: EdgeInsets.all(8),
                                              child: IconButton(
                                                icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
                                                onPressed: () {  },
                                              ),
                                            )
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(8),
                                          width: 250,
                                          child: Text(
                                            data[index].name,
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.only(right: 12))
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      );
                    }
                )
            )
          ]
        )
    );
  }

}