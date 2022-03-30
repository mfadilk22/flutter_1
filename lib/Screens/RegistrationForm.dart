import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/Models/user_model.dart';
import 'package:flutter_1/Screens/LoginScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_1/Screens/HomeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;
  //editing controller
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noHPController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Nama Input
    final namaField = TextFormField(
      autofocus: false,
      enableSuggestions: true,
      cursorColor: Colors.black45,
      controller: namaController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Full Name is Required for Sign Up");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Name (Min. 3 Characters)");
        }
        return null;
      },
      onSaved: (value) {
        namaController.text = value!;
      },
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.supervised_user_circle_sharp,
            color: Color.fromARGB(255, 87, 44, 148),
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Nama Lengkap",
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 87, 44, 148), width: 1.0),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );

    //Email Input
    final emailField = TextFormField(
      autofocus: false,
      enableSuggestions: true,
      cursorColor: Colors.black45,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a Valid Email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.alternate_email_rounded,
            color: Color.fromARGB(255, 87, 44, 148),
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 87, 44, 148), width: 1.0),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );

    //Nomor HP
    final noHPField = TextFormField(
      autofocus: false,
      enableSuggestions: true,
      cursorColor: Colors.black45,
      controller: noHPController,
      keyboardType: TextInputType.number,
      validator: (value) {
        String pattern = r'(^[0-9]*$)';
        RegExp regex = new RegExp(pattern);
        if (value!.isEmpty) {
          return ("Hanphone Number is Required for Sign Up");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Phone Number");
        }
        return null;
      },
      onSaved: (value) {
        noHPController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.phone,
            color: Color.fromARGB(255, 87, 44, 148),
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Nomor HP",
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 87, 44, 148), width: 1.0),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      cursorColor: Colors.black45,
      controller: passwordController,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is Required for Sign Up");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Password (Min. 6 Characters)");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      //keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.vpn_key,
            color: Color.fromARGB(255, 87, 44, 148),
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 87, 44, 148), width: 1.0),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );

    //login button
    final LoginButton = Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(5),
      color: Color.fromARGB(255, 87, 44, 148),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          //Navigator.push(
          //  context, MaterialPageRoute(builder: (context) => HomeScreen()));

          signUp(emailController.text, passwordController.text);
        },

        //color: Colors.redAccent,
        child: Text(
          "Daftar",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 110, 67, 172),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(5, 9),
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 24),
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 200,
                          child: Image.asset(
                            "assets/logo.png",
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        SizedBox(height: 0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Daftar Akun",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            // GestureDetector(
                            //   onTap: () {
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (builder) =>
                            //                 RegistrationForm()));
                            //   },
                            // child: Text(
                            //   "Sign Up",
                            //   style: TextStyle(
                            //       color: Colors.redAccent,
                            //       fontWeight: FontWeight.w600,
                            //       fontSize: 15),
                            // ),
                            // )
                          ],
                        ),
                        SizedBox(height: 16),
                        namaField,
                        SizedBox(height: 16),
                        emailField,
                        SizedBox(height: 16),
                        noHPField,
                        SizedBox(height: 16),
                        passwordField,
                        SizedBox(height: 16),
                        LoginButton,
                        SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Sudah punya akun? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) => LoginScreen()));
                              },
                              child: Text(
                                "Masuk di sini",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 110, 67, 172),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),
                            )
                          ],
                        )
                      ],
                    )),
              ),
            ),
          ),
        ));

    // return Container();
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    //calling our firestore
    //calling our user model
    //sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    //writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.fullName = namaController.text;
    userModel.handphone = noHPController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Your Account Created Successfully");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }
}
