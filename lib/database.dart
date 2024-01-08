import 'package:hive/hive.dart';

import 'model.dart';

class DBfunction {
  DBFunction.internal();

  static DBfunction instance= DBFunction.internal();

  Future<void> userSignUp(User user) async {
    final db = await Hive.openBox<User>('Users');
    db.put(user.id, user);
  }
  Future<List<User>> getUser() async{
    final db = await Hive.openBox<User>('Users');
    return db.values.toList();
  }
}

