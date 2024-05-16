import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'datastore.dart';

// ignore: must_be_immutable
class Transfer extends StatelessWidget {
  Transfer({super.key});

  final TextEditingController tranfertext = TextEditingController();

  final TextEditingController fromtext = TextEditingController();

  final TextEditingController totext = TextEditingController();

  final TextEditingController discriptiontext = TextEditingController();

  String address = '';

  String discription = '';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheigt = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 77),
          child: Text(
            'Transfer',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'How Much?',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white60),
                ),
                SizedBox(
                  height: 80,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '\$0',
                        hintStyle: TextStyle(color: Colors.white),
                        focusedBorder: InputBorder.none,
                      ),
                      controller: tranfertext,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              height: screenheigt / 2.5,
              width: screenWidth,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 60,
                              width: screenWidth / 2.5,
                              child: TextField(
                                controller: fromtext,
                                onChanged: (value) {},
                                decoration: InputDecoration(
                                  labelText: 'From',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 60,
                              width: screenWidth / 2.5,
                              child: TextField(
                                controller: totext,
                                onChanged: (value) {},
                                decoration: InputDecoration(
                                  labelText: 'To',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('assets/swap.png')),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
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
                    ),
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
                            style:
                                TextStyle(color: Colors.black45, fontSize: 22),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                        width: 370,
                        height: 60,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 114, 0, 236),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18))),
                            onPressed: () {
                              final enteredexpence =
                                  double.tryParse(tranfertext.text);
                              address = '${fromtext.text} to ${totext.text}';
                              discription = discriptiontext.text;
                              if (enteredexpence != null) {
                                Navigator.pop(
                                    context,
                                    ReturnValues(
                                        cat: address,
                                        discription: discription,
                                        enteredcash: enteredexpence,
                                        time: DateFormat('HH:mm')
                                            .format(DateTime.now()),
                                        type: 'transfer'));
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Invalid Number'),
                                      content:
                                          Text('Please enter a valid number.'),
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
                              style: TextStyle(fontSize: 20),
                            )))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
