import 'dart:convert';

import 'package:http/http.dart' as http;

class GetShopData {

  var baseUrl = "https://raingate.ir";
  var token = "";

  Future<List<ProductFilter>> getProducts() async {
    var response = await http.get(Uri.parse("$baseUrl/api/products?page[number]=1&page[size]=10"));
    var json = jsonDecode(response.body);
    List<ProductFilter> markets = [];
    for (var product in json['data']['products']) {
      if (product["price"] == null){
        product["price"] = "Call To Owner !";
      }
      if (product["category_id"] == null){
        product["category_id"] = " ";
      }
      var market = ProductFilter.fromJson((product));
      markets.add(market);

    }
    return markets;
  }

  Future<List<Map<String,dynamic>>> getProduct(int ID) async {
    var response = await http.get(Uri.parse("$baseUrl/api/products/$ID"));
    var json = jsonDecode(response.body);
    print(json['data']['product']["id"]);

    // List<ProductFilter> markets = [];
    // for (var product in json['data']['product']) {
      // if (product["price"] == null){
      //   product["price"] = "Call To Owner !";
      // }
      // if (product["category_id"] == null){
      //   product["category_id"] = " ";
      // }
      // var market = ProductFilter.fromJson((product));
      // markets.add(market);

    // }
    return [{"" : "s"}];
  }

  Future<List<CategoryFilter>> getCategory() async {
    var response = await http.get(Uri.parse("$baseUrl/api/products/categories?page[size]=30&page[number]=1&filter[status]=gte:1"));
    var json = jsonDecode(response.body);
    // print(json['data']['product_categories']);

    List<CategoryFilter> markets = [];
    for (var product in json['data']['product_categories']) {
        // print(product);
        if (product['cover'].length == 0){
          break;
        }
        product['cover'] = product['cover'][0]['url'];
        // for (var cover in product['cover'])
        //   product['cover'] = cover['url'];
          var market = CategoryFilter.fromJson((product));
          markets.add(market);
    }

    return markets;
  }


  Future checkUser(String phone) async {
    var response = await http.post(Uri.parse("$baseUrl/api/login"), body: {
      "username": phone
    });
    var json = jsonDecode(response.body);
    if (json['data']['active']) {
      return true;
    } else {
      return false;
    }
  }

  Future login(String username, String password) async {
    var response = await http.post(Uri.parse("$baseUrl/oauth/token"), body: {
      "client_id": 2,
      "client_secret": "dXytYoKuHIpg8s200SL48e2toF1I4dokop87ZtkO",
      "grant_type": "password",
      "username": username,
      "password": password
    });
    var json = jsonDecode(response.body);
    token = json['access_token'];
  }

  Future getCart() async {
    http.get(Uri.parse("$baseUrl/api/cart"), headers: {
      "Authorization": "Bearer $token"
    });
  }

}

class ProductFilter {
  final String name;
  final String price;
  final String description;
  final String cover;
  final int product_id;
  final String category_id;


  ProductFilter(this.name,this.price,this.description,this.cover,this.product_id,this.category_id);

  factory ProductFilter.fromJson(Map<String,dynamic> json){
    return ProductFilter(
        json['name'],
        json['price'],
        json['description'],
        json['cover']?[0]['url'],
        json['id'],
        json["category_id"],
    );
  }
  Map<String, String> toMap() {
    return {
      "name": name
    };
  }

  String toString() {
    return "{name: $name}";
  }
}
class CategoryFilter {
  final int id;
  final String name;
  final List products;
  final String cover;


  CategoryFilter(this.id,this.name,this.products,this.cover);

  factory CategoryFilter.fromJson(Map<String,dynamic> json){
    return CategoryFilter(
        json['id'],
        json['name'],
        json['products'],
        json['cover'],
    );
  }
  // Map<String, String> toMap() {
  //   return {
  //     "name": name
  //   };
  // }
  //
  // String toString() {
  //   return "{name: $name}";
  // }
}
