import 'package:cart_task/constant.dart';
import 'package:cart_task/models/deals_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDataBase {
  LocalDataBase._();

  static final LocalDataBase db = LocalDataBase._();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), "Favourite.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE ${K.tableFav} (
      ${K.idColumn} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${K.priceColumnName} TEXT NOT NULL,
      ${K.timeColumnName} TEXT NOT NULL,
      ${K.nameColumn} TEXT NOT NULL,
      ${K.discountColumnName} TEXT NOT NULL,
      ${K.colorColumnName} TEXT NOT NULL,
      ${K.quantityColumnName} INTEGER NOT NULL)
      ''');
    });
  }

  insert(DealsModel model) async {
    var dbClient = await database;
    await dbClient!.insert(K.tableFav, model.toJSON(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<DealsModel>> getAllProduct() async {
    var dbClient = await database;
    List<Map> maps = await dbClient!.query(K.tableFav);
    List<DealsModel> list = maps.isNotEmpty
        ? maps.map((product) => DealsModel.fromJSON(product)).toList()
        : [];
    return list;
  }

  deleteProduct(String name) async {
    var dbClient = await database;
    await dbClient!
        .delete(K.tableFav, where: "${K.nameColumn} = ?", whereArgs: [name]);
  }

// deleteAllProduct() async {
//   var dbClient = await database;
//   await dbClient!.delete(K.tableName);
// }

// updateQuantity(DealsModel dealsModel) async {
//   var dbClient = await database;
//   return await dbClient!.update(K.tableName, dealsModel.toJSON(),
//       where: '${K.nameColumn}=?', whereArgs: [dealsModel.name]);
// }
}
