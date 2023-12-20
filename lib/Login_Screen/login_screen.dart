import 'package:flutter/material.dart';
import '../common_widgets/common_text_feild.dart';
import '../registration/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = "/loginscreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool visibility = true;
  bool loading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Email",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CommonTextField(
                  hintText: "Enter email",
                  controller: emailController,
                  prefixIcon: const Icon(Icons.mail),
                )),
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text("Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextFormField(
                controller: passwordController,
                obscureText: visibility,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.key),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          visibility = !visibility;
                        });
                      },
                      child: visibility == false
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility)),
                  hintText: "Enter password",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.green, width: 2)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 500,
              child: ElevatedButton(onPressed: () {}, child: Text("Login")),
            ),
            loading == true
                ? Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator())
                : Container(
                    width: 500,
                    child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text);

                            if (user.user != null) {
                              setState(() {
                                loading = false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Login succesfull")));

                              // Navigator.pushReplacementNamed(context, "destination screen");
                            }
                          } on Exception catch (e) {
                            setState(() {
                              loading = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.toString())));

                            // TODO
                          }
                        },
                        child: Text("Register")),
                  ),
            Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RegistrationScreen.routeName);
                    },
                    child: const Text("Register now"))),
          ],
        ),
      ),
    );
  }
}
