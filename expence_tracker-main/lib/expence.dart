import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'datastore.dart';

// ignore: must_be_immutable
class Expence extends StatelessWidget {
  Expence({super.key});

  final TextEditingController discriptiontext = TextEditingController();

  final TextEditingController expencetext = TextEditingController();

  String discription = '';

  String cat = '';

  @override
  Widget build(BuildContext context) {
    bool light = true;
    List<String> category = [
      'transportation',
      'Food',
      'subscription',
      'Shopping',
    ];

    // ignore: non_constant_identifier_names
    List<String> Wallet = [
      'Wallet',
    ];
    String? p;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheigt = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.red,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.red,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 77),
          child: Text(
            'Expence',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'How Much?',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: screenheigt / 8,
                  width: screenWidth,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '\$0',
                        hintStyle: TextStyle(color: Colors.white),
                        focusedBorder: InputBorder.none,
                      ),
                      cursorColor: Colors.black,
                      controller: expencetext,
                      style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: screenheigt / 1.6,
            width: screenWidth,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    height: 85,
                    width: 370,
                    child: DropdownButtonFormField(
                        hint: const Text('category'),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                        dropdownColor: Colors.white,
                        items: category
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                  ),
                                ))
                            .toList(),
                        onChanged: (v) {
                          // ignore: unrelated_type_equality_checks
                          cat = v as String;
                        }),
                  ),
                ),
                //2nd

                SizedBox(
                  height: 85,
                  width: 370,
                  child: TextField(
                    controller: discriptiontext,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      labelText: 'Describtion',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),

                //3rd

                SizedBox(
                  height: 85,
                  width: 370,
                  child: DropdownButtonFormField(
                      hint: const Text('Wallet'),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                      dropdownColor: Colors.white,
                      items: Wallet.map((a) => DropdownMenuItem(
                            value: a,
                            child: Text(
                              a,
                            ),
                          )).toList(),
                      onChanged: (v) {
                        // ignore: unrelated_type_equality_checks
                        p == v as String;
                      }),
                ),
                //4th

                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.attachment,
                            size: 33,
                            color: Colors.black45,
                          )),
                      const Text(
                        'Add attachment',
                        style: TextStyle(color: Colors.black45, fontSize: 22),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                  width: 370,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Repeat',
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Repeat transaction',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w200),
                          ),
                        ],
                      ),
                      Switch(
                          value: light,
                          activeColor: Colors.blue,
                          onChanged: (bool value) {
                            light = value;
                          })
                    ],
                  ),
                ),

                SizedBox(
                    width: 370,
                    height: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 114, 0, 236),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18))),
                        onPressed: () {
                          final enteredexpence =
                              double.tryParse(expencetext.text);
                          discription = discriptiontext.text;
                          if (enteredexpence != null) {
                            ReturnValues obj = ReturnValues(
                                enteredcash: enteredexpence,
                                cat: cat,
                                discription: discription,
                                time:
                                    DateFormat('HH:mm').format(DateTime.now()),
                                type: 'expence');
                            Navigator.pop(context, obj);
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Invalid Number'),
                                  content: Text('Please enter a valid number.'),
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
                        child: Text(
                          'Continue',
                          style: TextStyle(fontSize: 25),
                        )))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
