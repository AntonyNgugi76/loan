import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "MyDatabase.db";
  static const _databaseVersion = 1;

  static const table = 'my_table';
  static const tbl_quiz_category = 'tbl_quiz_category';
  static const tbl_quiz = 'tbl_quiz';
  static const tbl_answers = 'tbl_answer';

  static const columnId = '_id';
  static const columnName = 'name';
  static const columnAge = 'age';


  //Quiz Category table structure
  static const quiz_category_id = 'quiz_category_id';
  static const quiz_category_name = 'quiz_category_name';

  //Quiz Table table structure
  static const quiz_id = 'quiz_id';
  static const quiz_answer = 'quiz_answer';
  static const quiz_answer_index = 'answer_index';
  static const quiz_category_id_fk = 'quiz_category_id_fk';


  //Quiz Table table structure
  static const answer_id = 'answer_id';
  static const answer = 'quiz_answer';
  static const answer_quiz_fk = 'answer_index';


  Database? _db;



  // Use this getter to use the database.
  Future<Database?> get database async {
    if (_db != null) return _db;
    // Instantiate db the first time it is accessed
    _db = await init();
    return _db;
  }
  // this opens the database (and creates it if it doesn't exist)
  Future<Database> init() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    return _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnAge INTEGER NOT NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE $tbl_quiz_category (
            $quiz_category_id INTEGER PRIMARY KEY,
            $quiz_category_name TEXT NOT NULL
          )
          ''');

    await db.execute('''
          CREATE TABLE $tbl_quiz (
            $quiz_id INTEGER,
            $quiz_answer TEXT NOT NULL,
            $quiz_answer_index INTEGER PRIMARY KEY,
            $quiz_category_id_fk INTEGER NOT NULL
          )
          ''');


  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert_row(Map<String, dynamic> row) async {


    print('Inserting,,,  ${row}');
    Database? DB = await this.database;
    return await DB!.insert(
        tbl_quiz, row, conflictAlgorithm: ConflictAlgorithm.replace);

  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    return await _db!.query(table);
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount() async {
    final results = await _db!.rawQuery('SELECT COUNT(*) FROM $table');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row) async {
    int id = row[columnId];
    return await _db!.update(
      table,
      row,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    return await _db!.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<List<Map>> get_specific_categories(id) async {
    final results = await _db!.rawQuery(
        'SELECT * FROM $tbl_quiz_category WHERE $quiz_category_id =?', id);
    return results;
  }

  Future<List<Map>> select_a_question(id) async {
    Database? DB = await this.database;

    final results = await DB!.rawQuery(
        'SELECT * FROM $tbl_quiz WHERE $quiz_id =?', [id]);
   // print('AAA ${results}');
    return results;
  }

  Future<int> delete_entry(int id,int answer_index) async {
    print('Deleting ... ${id} ${answer_index}');
    Database? DB = await this.database;
    return await DB!.delete(

      tbl_quiz,
      where: '$quiz_id = ? and $quiz_answer_index =?',
      whereArgs: [id,answer_index],
    );
  }
}