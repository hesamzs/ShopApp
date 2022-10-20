import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shopapp/api/api.dart';

class Favorites{

  late final Future<Database> database;

  Future connect() async {
    var path = join(await getDatabasesPath(), "products.db");
    database = openDatabase(
        path,
        onCreate: (database, version) async {
          await database.execute("CREATE TABLE IF NOT EXISTS favorites(name TEXT PRIMARY KEY)");
        },
        version: 2
    );
  }

  Future addToFavorites(ProductFilter productFilter) async {
    var db = await database;
    return db.insert("favorites", productFilter.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future removeFromFavorites(ProductFilter productFilter) async {
    var db = await database;
    return db.delete("favorites", where: "name = ?", whereArgs: [productFilter.name]);
  }

  Future getFavorites() async {
    var db = await database;
    List<Map<String, dynamic>> data = await db.query("favorites");
    return List.generate(data.length, (index) {
      return ProductFilter(data[index]["name"], "", "","",0,"");
    });
  }
}