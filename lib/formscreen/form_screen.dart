import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});
  static const String routeName = "/from";

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final TextEditingController fname = TextEditingController();
  final TextEditingController lname = TextEditingController();
  final TextEditingController contact = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController email = TextEditingController();

  final database = FirebaseDatabase.instance;

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        child: Column(
          children: [
            TextFormField(
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == "" ) {
                  return "Enter first name";
                }
                return null;
              },

              controller: fname,
              decoration: InputDecoration(label: Text("First Name")),
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value){
                if(value == ""){
                  return "Enter Last Name";
                }
                return null;
              },
              controller: lname,
              decoration: InputDecoration(label: Text("Last Name")),
            ),
            TextFormField(
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              // validator: (value){
              //   if(value == ""){
              //     return "Enter Contact";
              //   }
              //   return null;
              // },
              controller: contact,
              decoration: InputDecoration(label: Text("Contact")),
            ),
            TextFormField(
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              // validator: (value){
              //   if(value == ""){
              //     return "Enter address";
              //   }
              //   return null;
              // },
              controller: address,
              decoration: InputDecoration(label: Text("Address")),
            ),
            TextFormField(
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value){
                if(value == ""){
                  return "Enter mail";
                }
                return null;
              },
              controller: email,
              decoration: InputDecoration(label: Text("Email")),
            ),
            ElevatedButton(
                onPressed: () async {

                  if(_key.currentState!.validate()){
                    var datas = {
                      "firstName": fname.text,
                      "lastName": lname.text,
                      "contact": contact.text,
                      "address": address.text,
                      "email": email.text,
                    };
                    await database.ref().push().set(datas).then((value) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("success")));
                    }).onError((error, stackTrace) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(error.toString())));
                    });
                  }
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
