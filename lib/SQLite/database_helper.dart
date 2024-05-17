import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/pet.dart';
import '../models/users.dart';

class DatabaseHelper {
  final databaseName = "auth.db";

  //Tables

  String user = '''
   CREATE TABLE users (
   usrId INTEGER PRIMARY KEY AUTOINCREMENT,
   email TEXT UNIQUE,
   usrPassword TEXT,
   imgStr TEXT
   )
   ''';
  String pet = '''
   CREATE TABLE pets (
   petId INTEGER PRIMARY KEY AUTOINCREMENT,   
   imgStr TEXT,
   color TEXT,
   name TEXT,
   gender TEXT,
   breedName TEXT,
   age INT,
   weight DOUBLE,
   height DOUBLE,
   userId INTEGER,  
   FOREIGN KEY (userId) REFERENCES users (usrId) 
   )
   ''';

  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(user);
      await db.execute(pet);
    });
  }
  //Function methods

  //Authentication
  Future<bool> authenticate(Users usr) async {
    final Database db = await initDB();
    var result = await db.rawQuery(
        "select * from users where email = '${usr.email}' AND usrPassword = '${usr.password}' ");
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  //Sign up
  Future<int> createUser(Users usr) async {
    final Database db = await initDB();
    int userId = await db.insert("users", usr.toMap());
    // print('userId: $userId');
    return userId;
  }

  //Get current User details
  Future<Users?> getUser(String email) async {
    final Database db = await initDB();
    var res = await db.query("users", where: "email = ?", whereArgs: [email]);
    return res.isNotEmpty ? Users.fromMap(res.first) : null;
  }

  Future<String?> getUserImageById(int userId) async {
    final Database db = await initDB();
    var res = await db.query("users", where: "usrId = ?", whereArgs: [userId]);
    if (res.isNotEmpty) {
      var user = Users.fromMap(res.first);
      return user.imgStr;
    } else {
      return null;
    }
  }

//add pet
  Future<int> addPetForUser(int userId, Pets pet) async {
    final Database db = await initDB();
    pet.userId = userId;
    return db.insert("pets", pet.toMap());
  }

  //get pet
  Future<List<Pets>> getPetsByUserId(int userId) async {
    final Database db = await initDB();
    var res = await db.query("pets", where: "userId = ?", whereArgs: [userId]);

    List<Pets> pets = [];
    if (res.isNotEmpty) {
      for (var petMap in res) {
        pets.add(Pets.fromMap(petMap));
      }
    }
    return pets;
  }

  // Add image to user profile
  Future<void> addImageToUser(int userId, String imageFile) async {
    final Database db = await initDB();
    String imagePath = imageFile;
    await db.rawUpdate(
        "UPDATE users SET imgStr = ? WHERE usrId = ?", [imagePath, userId]);
  }
}
