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
   usrName TEXT,  
   usrPassword TEXT,
   imgStr TEXT,
   phone TEXT,
   adress TEXT,
   gender TEXT
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
    return userId;
  }

  //Get current User details
  Future<Users?> getUser(String email) async {
    final Database db = await initDB();
    var res = await db.query("users", where: "email = ?", whereArgs: [email]);
    return res.isNotEmpty ? Users.fromMap(res.first) : null;
  }

  Future<Users?> getUserInfo(int userId) async {
    final Database db = await initDB();
    List<Map<String, dynamic>> res = await db.query(
      "users",
      where: "usrId = ?",
      whereArgs: [userId],
    );

    if (res.isNotEmpty) {
      return Users.fromMap(res.first);
    } else {
      return null;
    }
  }

  Future<int> updateUserById(Map<String, dynamic> user, int userId) async {
    final Database db = await initDB();
    int count =
        await db.update("users", user, where: "usrId = ?", whereArgs: [userId]);
    return count;
  }

  Future<int> changePasswordByUserId(int userId, String newPassword) async {
    final Database db = await initDB();
    Map<String, dynamic> updatedUserData = {'usrPassword': newPassword};

    int rowsAffected = await db.update('users', updatedUserData,
        where: 'usrId = ?', whereArgs: [userId]);
    return rowsAffected;
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

// get img pet
  Future<String?> getPetImageById(int petId) async {
    final Database db = await initDB();
    var res = await db.query("pets", where: "petId = ?", whereArgs: [petId]);
    if (res.isNotEmpty) {
      var pet = Pets.fromMap(res.first);
      return pet.imgStr;
    } else {
      return null;
    }
  }

  // Add image to user profile
  Future<void> addImageToUser(int userId, String imageFile) async {
    final Database db = await initDB();
    String imagePath = imageFile;
    await db.rawUpdate(
        "UPDATE users SET imgStr = ? WHERE usrId = ?", [imagePath, userId]);
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

  // Add image to pet profile
  Future<void> addImageToPet(int petId, String imageFile) async {
    final Database db = await initDB();
    String imagePath = imageFile;
    await db.rawUpdate(
        "UPDATE pets SET imgStr = ? WHERE petId = ?", [imagePath, petId]);
  }

  Future<Pets> getPetById(int petId) async {
    final Database db = await initDB();
    var res = await db.query("pets", where: "petId = ?", whereArgs: [petId]);
    final Pets pet = Pets.fromMap(res.first);
    return pet;
  }

  Future<int> updatePetById(Map<String, dynamic> pets, int id) async {
    final Database db = await initDB();
    int count =
        await db.update("pets", pets, where: "petId = ?", whereArgs: [id]);
    return count;
  }

  // Future<int> updatePetById(Map<String, dynamic> pets, int id) async {
  //   final Database db = await initDB();
  //   int count =
  //       await db.update("pets", pets, where: "petId = ?", whereArgs: [id]);
  //   return count;
  // }

//delete pet
  Future<int> deletePetById(int petId) async {
    final Database db = await initDB();
    int count = await db.delete("pets", where: "petId = ?", whereArgs: [petId]);
    return count;
  }
}
