import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/RegistrationForm.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //form key
  final _formKey = GlobalKey<FormState>();
  //editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //firebase
  //final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
      autofocus: false,
      enableSuggestions: true,
      cursorColor: Colors.black45,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
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

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      cursorColor: Colors.black45,
      controller: passwordController,
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

          // signIn(emailController.text, passwordController.text);
        },

        //color: Colors.redAccent,
        child: Text(
          "Masuk",
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
                              "Masuk",
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
                            //                 RegistrationScreen()));
                            //   },
                            //   child: Text(
                            //     "Sign Up",
                            //     style: TextStyle(
                            //         color: Colors.redAccent,
                            //         fontWeight: FontWeight.w600,
                            //         fontSize: 15),
                            //   ),
                            // )
                          ],
                        ),
                        SizedBox(height: 16),
                        emailField,
                        SizedBox(height: 16),
                        passwordField,
                        SizedBox(height: 16),
                        LoginButton,
                        SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Belum punya akun? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) =>
                                            RegistrationForm()));
                              },
                              child: Text(
                                "Daftar Sekarang",
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
  }
}
