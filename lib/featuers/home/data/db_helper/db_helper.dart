import 'package:meleapp/featuers/home/data/models/meals_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static final DataBaseHelper dataBaseHelper = DataBaseHelper();
  Database? _database;
  // get database
  Future<Database?> get database async {
    if (_database != null) return _database;
    // create database (initialize database)
    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    // path to database
    String path = join(await getDatabasesPath(), 'meals.db');
    return await openDatabase(
      path,
      version: 2,
      onCreate: createDataBase,
    );
  }

  Future<void> createDataBase(Database db, version) async {
    await db.execute('''
      CREATE TABLE Meals(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        image TEXT,
        description TEXT,
        type TEXT,
        date TEXT


      
      )
    ''');
  }

  // insert data (Method)
  Future<int> insertMeal(MealsModel meal) async {
    Map<String, dynamic> mealMap = meal.toMap();
    final db = await database;
    return await db!.insert('Meals', mealMap);
  }

  // get all data (Method)
  Future<List<MealsModel>> getAllMeals() async {
    final db = await database;
    List<Map<String, dynamic>> mealsJson = await db!.query('Meals');
    List<MealsModel> meals =
        mealsJson.map((mealsJson) => MealsModel.fromMap(mealsJson)).toList();
    print("🍽️ Meals fetched from DB: $mealsJson");

    return meals;
  }
  // delete data (Method)

  Future<void> deleteAllMeals() async {
    final db = await database;
    await db!.delete('Meals');
    print("✅ تم حذف كل الوجبات");
  }
  // delete one meal data (Method)

  Future<void> deleteOneMeal(int id) async {
    final db = await database;
    await db!.delete('Meals', where: 'id = ?', whereArgs: [id]);
    print("✅ تم حذف الوجبة");
  }
  // update data (Method)

  Future<void> updateMeal(MealsModel meal) async {
    final db = await database;
    await db!
        .update('Meals', meal.toMap(), where: 'id = ?', whereArgs: [meal.id]);
    print("✅ تم تعديل الوجبة");
  }
}
