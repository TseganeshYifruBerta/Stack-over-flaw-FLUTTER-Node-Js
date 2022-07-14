// import 'package:dartz/dartz.dart';
// import 'package:path/path.dart';
// import 'package:please/domain/questions/value_objects.dart';
// import 'package:please/domain/questions/question_model.dart';
// import 'package:please/domain/questions/question_failure.dart';
// import 'package:please/infrastructure/infrastructure.dart';
// import 'package:please/infrastructure/sqlite/question_model.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqlbrite/sqlbrite.dart';
// import 'package:synchronized/synchronized.dart';

// class DatabaseHelper implements QuestionDataProvider{
//   static const _databaseName = 'Questions.db';
//   static const _databaseVersion = 1;

//   static const questionTable = 'Questions';
//   static const questionId = 'questionId';

//   static late BriteDatabase _streamDatabase;

//   DatabaseHelper._privateConstructor();
//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
//   static var lock = Lock();
//   static Database? _database;

//   Future _onCreate(Database db, int version) async {
//     await db.execute('''
//  CREATE TABLE $questionTable (
//  $questionId TEXT PRIMARY KEY,
//   authorId TEXT,
//   authorName TEXT,
//   title Text,
//   description TEXT,
//   dateTime TEXT,
//  )
//  ''');
//   }

//   Future<Database> _initDatabase() async {
//     final documentsDirectory = await getApplicationDocumentsDirectory();
//     final path = join(documentsDirectory.path, _databaseName);
//     Sqflite.setDebugModeOn(true);
//     return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
//   }

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     await lock.synchronized(() async {

//       if (_database == null) {
//         _database = await _initDatabase();
//         _streamDatabase = BriteDatabase(_database!);
//       }
//     });
//     return _database!;
//   }

//   Future<BriteDatabase> get streamDatabase async {
//     await database;
//     return _streamDatabase;
//   }

//   List<QuestionModel> parseQuestion(List<Map<String, dynamic>> questionlist) {
//     final questions = <QuestionModel>[];
//     for (var questionMap in questionlist) {
//       final question = QuestionModel.fromJson(questionMap);
//       questions.add(question);
//     }
//     return questions;
//   }


//   // Future<List<QuestionModel>> findAllQuestions() async {
//   //   final db = await instance.streamDatabase;
//   //   final questionList = await db.query(questionTable);
//   //   final questions = parseQuestion(questionList);
//   //   return questions;
//   // }

//   // Stream<List<QuestionModel>> watchAllQuestions() async* {
//   //   final db = await instance.streamDatabase;
//   //   yield* db
//   //       .createQuery(questionTable)
//   //       .mapToList((row) => QuestionModel.fromJson(row));
//   // }

// // Future<QuestionModel> findQuestionById(String id) async {
// //     final db = await instance.streamDatabase;
// //     final questionList = await db.query(questionTable, where: 'id = $id');
// //     final questions = parseQuestion(questionList);
// //     return questions.first;
// //   }

// // Future<int> insert(String table, Map<String, dynamic> row) async {
// //     final db = await instance.streamDatabase;
// //     return db.insert(table, row);
// //   }

// //   Future<int> insertQuestion(QuestionModel question) {
// //     return insert(questionTable, question.toJson());
// //   }

// //   Future<int> _delete(String table, String columnId, String id) async {
// //     final db = await instance.streamDatabase;
// //     return db.delete(table, where: '$columnId = ?', whereArgs: [id]);
// //   }

// //   Future<int> deleteQuestion(QuestionModel question) async {
// //     if (question.id != null) {
// //       return _delete(questionTable, questionId, question.id);
// //     } else {
// //       return Future.value(-1);
// //     }
// //   }

//   void close() {
//     _streamDatabase.close();
//   }

//   @override
//   Future<Either<QuestionFailure, Unit>> deleteQuestion(String id, String token) {
//     // TODO: implement deleteQuestion
//     throw UnimplementedError();
//   }

//   @override
//   Future<Either<QuestionFailure, List<Question>>> fetchAllQuestion() {
//     // TODO: implement fetchAllQuestion
//     throw UnimplementedError();
//   }

//   @override
//   Future<Either<QuestionFailure, Question>> getQuestion(String id) {
//     // TODO: implement getQuestion
//     throw UnimplementedError();
//   }

//   @override
//   Future<Either<QuestionFailure, Unit>> postQuestion({required QuestionTitle title, required Description description, required String token}) async{
//     final db = await instance.streamDatabase;
//     final re =  db.insert(questionTable, row);

    


//     throw UnimplementedError();
//   }

//   @override
//   Future<Either<QuestionFailure, Unit>> updateQuestion(String token, Question question) async{
//     // TODO: implement updateQuestion
    
//     throw UnimplementedError();
//   }
//   Future<int> insert(String table, Map<String, dynamic> row) async {
//     final db = await instance.streamDatabase;
//     return db.insert(table, row);
//   }

//   Future<int> insertQuestion(QuestionModel question) {
//     return insert(questionTable, question.toJson());
//   }
// }

