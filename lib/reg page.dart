
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model.dart';
/*import '../Database/database.dart';
import '../model.dart';*/

class reg extends StatefulWidget {
  @override
  State<reg> createState() => _regState();
}

class _regState extends State<reg> {
  final TextEditingController uname = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpass = TextEditingController();

  var formkey1 = GlobalKey<FormState>();
  bool hidepass = true;
  bool hidepass1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
                key: formkey1,
                child: Column(
                  children: [
                    Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Text(
                            "Register here",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        controller: uname,
                        obscureText: hidepass,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                            prefixIcon:
                            const Icon(Icons.drive_file_rename_outline),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (hidepass) {
                                    hidepass = false;
                                  } else {
                                    hidepass = true;
                                  }
                                });
                              },
                              icon: Icon(hidepass == true
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            labelText: "username",
                            hintText: "username",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextFormField(
                          controller: password,
                          obscureText: hidepass1,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                            prefixIcon:
                            const Icon(Icons.drive_file_rename_outline),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (hidepass1) {
                                    hidepass1 = false;
                                  } else
                                    hidepass1 = true;
                                });
                              },
                              icon: Icon(hidepass1 == true
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: TextFormField(
                        controller: confirmpass,
                        // obscureText: hidepass2,
                        //obscuringCharacter: '*',
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            labelText: "Confirm Password",
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60, right: 60),
                      child: ElevatedButton(
                          onPressed: () {
                           // ValidateSignUp();
                          },
                          child: Text("Sigh in")),
                    ),
                  ],
                ))));
  }

 /* void ValidateSignUp() async {
    final uname =  uname.text.trim();
    final Pass = password.text.trim();
    final Cpass = confirmpass.text.trim();

    final emailValidationResult = EmailValidator.validate(uname);

    if (uname != "" && Pass != "" && Cpass != "") {
      if (emailValidationResult == true) {
        final passValidationResult = checkPassword(Pass, Cpass);
        if (passValidationResult == true) {
          final user = User(uname: uname, password: Pass);
          await DBFunction.instance.userSignUp(user);
          Get.back();
          Get.snackbar("Success", "Account created");
        }
      } else {
        Get.snackbar("Error", "Provide a valid email");
      }
    } else {
      Get.snackbar("Error", "Fields can not be empty");
    }
  }*/

  bool checkPassword(String pass, String cpass) {
    if (pass == cpass) {
      if (pass.length < 6) {
        Get.snackbar("Error", "Password length should be >6");
        return false;
      } else {
        return true;
      }
    } else {
      Get.snackbar("Error", "Password mismatch");
      return false;
    }
  }
}
