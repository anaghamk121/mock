import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId :1)
class User {
  @HiveType(typeId: 0)
  final String uname;

  @HiveType(typeId: 1)
  final String password;
  @HiveType(typeId: 2)
  String? id;
  User ({required this.uname ,required this.password}){
    id = DateTime.now().microsecondsSinceEpoch.toString();
  }
}