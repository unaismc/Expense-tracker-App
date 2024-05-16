import 'package:accound/provider.dart';
import 'package:flutter/material.dart';

import 'home.dart';

// ignore: must_be_immutable
class Loginpage extends StatelessWidget {
  Loginpage({super.key});

  TextEditingController emailtext = TextEditingController();
  TextEditingController passtext = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('login page')),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SizedBox(
          height: 200,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                controller: emailtext,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'password'),
                controller: passtext,
              ),
              ElevatedButton(
                  onPressed: () {
                    MyAppState log = MyAppState();
                    if (emailtext.text == 'jinshad@gmail.com' ||
                        emailtext.text == '7994475952' &&
                            passtext.text == '1234567890') {
                      log.loginbool();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => MyWidget()));
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Invalid email and password'),
                            content: const Text(
                                'Please enter a valid email and password.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text('log in'))
            ],
          ),
        ),
      ),
    );
  }
}
