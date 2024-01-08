import 'package:flutter/cupertino.dart';
import 'package:flutter/material.darT';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mock/reg%20page.dart';
import 'model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.openBox<User>('user');
  runApp(GetMaterialApp(
    home: login(),
  ));
}
class login extends StatefulWidget{
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController uname = TextEditingController();
  TextEditingController pass = TextEditingController();
//  var formkey = GlobalKey<formstate>();
  bool showpass = true;
  bool showpass1 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                "Login Page",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            )), TextFormField(obscureText: showpass,
          obscuringCharacter: "*",
          controller: uname,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.drive_file_rename_outline),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    if (showpass) {
                      showpass = false;
                    } else {
                      showpass = true;
                    }
                  });
                },
                icon: Icon(
                    showpass == true ? Icons.visibility_off : Icons.visibility),
              ),
              labelText: "user name",
              hintText: "user name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              )),
          textInputAction: TextInputAction.next,
        ), Padding(
          padding: const EdgeInsets.only(top: 20),
          child: TextFormField(controller: pass,
            obscureText: showpass1,
            obscuringCharacter: "*",
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.drive_file_rename_outline),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    if (showpass1) {
                      showpass1 = false;
                    } else
                      showpass1 = true;
                  });
                },
                icon: Icon(showpass1 == true
                    ? Icons.visibility_off
                    : Icons.visibility),
              ),
              labelText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            textInputAction: TextInputAction.next,
          ),
        ), Padding(
          padding: const EdgeInsets.only(left: 60, right: 60, top: 20),
          child: ElevatedButton(
              onPressed: () async {
               /* final userList = await DBFunction.instance.getUser();
                findUser(userList);*/
              },
              child: Text("Login")),
        ),
        TextButton(
          onPressed: () {
            Get.to(reg());
          },
          child: Text("Not a User?..Register here!!"),
        )
      ]),
    );


  }
  Future<void> findUser(List<User> userList) async {
    final username = uname.text.trim();
    final password = pass.text.trim();
    bool userFound = false;
    final validate = await validateLogin(username, password);

    if (validate == true) {
      await Future.forEach(userList, (user) {
        if (user.uname == username && user.password == password) {
          userFound = true;
        } else {
          userFound = false;
        }
      });
      if (userFound == true) {
       // Get.offAll(() => hivehome(email: email));
        Get.snackbar("Success", "Login success", backgroundColor: Colors.green);
      } else {
        Get.snackbar("Error", "Incorrect email/password",
            backgroundColor: Colors.blueGrey);
      }
  }
}

  Future<bool> validateLogin(String email, String password) async {
    if (email != '' && password != '') {
      return true;
    } else {
      Get.snackbar("Error", "Fields cannot be empty",
          backgroundColor: Colors.red);
      return false;
    }
  }
}
