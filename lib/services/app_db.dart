import 'package:e_commerce/headers.dart';

enum TableName { login, fav, cart }

enum LoginColumn { id, email, password }

enum FavColumn {
  id,
  title,
  description,
  category,
  price,
  discountPercentage,
  brand,
  warrantyInformation,
  availabilityStatus,
  returnPolicy,
  thumbnail,
}

enum CartColumn {
  id,
  title,
  description,
  category,
  price,
  discountPercentage,
  brand,
  warrantyInformation,
  availabilityStatus,
  returnPolicy,
  thumbnail,
}

class AppDb {
  AppDb._();
  static final AppDb instance = AppDb._();

  String dbName = 'db.db';
  late Database loginDb;
  late Database cartDb;
  late Database favDb;
  String sql = '';
  Logger logger = Logger();

  Future<void> initDb() async {
    String path = await getDatabasesPath();

    // ===========Login Table==============
    loginDb = await openDatabase(
      '${TableName.login.name}/$path',
      version: 1,
      onCreate: (db, version) async {
        sql = """CREATE TABLE IF NOT EXISTS ${TableName.login.name} 
            (${LoginColumn.id.name} INTEGER PRIMARY KEY AUTOINCREMENT,
             ${LoginColumn.email.name} TEXT UNIQUE NOT NULL,
             ${LoginColumn.password.name} TEXT NOT NULL);""";
        await db
            .execute(
              sql,
            )
            .then((value) => logger.i('${TableName.login.name} Table Created'))
            .onError((error, stackTrace) =>
                logger.e('${TableName.login.name} table not created $error'));
      },
      onUpgrade: (db, v1, v2) {},
      onDowngrade: (db, v1, v2) {},
    );

    // ===========Favourite Table==============

    favDb = await openDatabase(
      '${TableName.fav.name}/$path',
      version: 1,
      onCreate: (db, version) async {
        sql = """ CREATE TABLE IF NOT EXISTS ${TableName.fav.name} (
        ${FavColumn.id.name} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${FavColumn.title.name} TEXT NOT NULL,
        ${FavColumn.description.name} TEXT NOT NULL,
        ${FavColumn.category.name} TEXT NOT NULL,
        ${FavColumn.price.name} DOUBLE NOT NULL,
        ${FavColumn.discountPercentage.name} DOUBLE NOT NULL,
        ${FavColumn.brand.name} TEXT NOT NULL,
        ${FavColumn.warrantyInformation.name} TEXT NOT NULL,
        ${FavColumn.availabilityStatus.name} TEXT NOT NULL,
        ${FavColumn.returnPolicy.name} TEXT NOT NULL,
        ${FavColumn.thumbnail.name} TEXT NOT NULL
        );""";
        await db
            .execute(sql)
            .then((value) => logger.i('${TableName.fav.name} Table Created'))
            .onError((error, stackTrace) =>
                logger.e('${TableName.fav.name} table not created $error'));
      },
      onUpgrade: (db, v1, v2) {},
      onDowngrade: (db, v1, v2) {},
    );
    // ===========Cart Table ==================

    cartDb = await openDatabase(
      '${TableName.cart.name}/$path',
      version: 1,
      onCreate: (db, version) async {
        sql = """ CREATE TABLE IF NOT EXISTS ${TableName.cart.name} (
        ${CartColumn.id.name} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${CartColumn.title.name} TEXT NOT NULL,
        ${CartColumn.description.name} TEXT NOT NULL,
        ${CartColumn.category.name} TEXT NOT NULL,
        ${CartColumn.price.name} DOUBLE NOT NULL,
        ${CartColumn.discountPercentage.name} DOUBLE NOT NULL,
        ${CartColumn.brand.name} TEXT NOT NULL,
        ${CartColumn.warrantyInformation.name} TEXT NOT NULL,
        ${CartColumn.availabilityStatus.name} TEXT NOT NULL,
        ${CartColumn.returnPolicy.name} TEXT NOT NULL,
        ${CartColumn.thumbnail.name} TEXT NOT NULL
        );""";
        await db
            .execute(sql)
            .then((value) => logger.i('${TableName.cart.name} Table Created'))
            .onError((error, stackTrace) =>
                logger.e('${TableName.cart.name} Table Not Created $error'));
      },
      onUpgrade: (db, v1, v2) {},
      onDowngrade: (db, v1, v2) {},
    );
  } // initDb

  Future<void> insertLoginData({required DbUser user}) async {
    Map<String, dynamic> map = user.toJson();
    map.remove('id');
    await loginDb
        .insert(TableName.login.name, map)
        .then((value) => logger.i('!LoginDb! ${user.email} login inserted !!'))
        .onError((error, stackTrace) =>
            logger.e('!loginDb! ${user.email} login  $error!!'));
  }

  Future<void> insertFavData({required DbProduct product}) async {
    Map<String, dynamic> map = product.toJson();
    map.remove('id');

    await favDb
        .insert(TableName.fav.name, map)
        .then((value) => logger.i('!FavDb! ${product.title} inserted !!'))
        .onError((error, stackTrace) =>
            logger.e('!FavDb! ${product.title} not inserted $error !!'));
  }

  Future<void> insertCartData({required DbProduct product}) async {
    Map<String, dynamic> map = product.toJson();
    map.remove('id');

    await cartDb
        .insert(TableName.cart.name, map)
        .then((value) => logger.i('!CartDb! ${product.title} inserted !!'))
        .onError((error, stackTrace) =>
            logger.e('!CartDb! ${product.title} not inserted $error !!'));
  }

  Future<void> deleteFavData({required DbProduct product}) async {
    await favDb
        .delete(
          TableName.fav.name,
          where: '${FavColumn.id.name} = ?',
          whereArgs: [product.id],
        )
        .then((value) => logger.i('!FavDb! ${product.title} deleted !!'))
        .onError((error, stackTrace) =>
            logger.e('!FavDb! ${product.title} not deleted $error !!'));

    Future<void> deleteCartData({required DbProduct product}) async {
      await cartDb
          .delete(
            TableName.fav.name,
            where: '${FavColumn.id.name} = ?',
            whereArgs: [product.id],
          )
          .then((value) => logger.i('!CartDb! ${product.title} deleted !!'))
          .onError((error, stackTrace) =>
              logger.e('!CartDb! ${product.title} not deleted $error !!'));
    }
  }
}
