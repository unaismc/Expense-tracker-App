// // ignore_for_file: must_be_immutable

// import 'package:accound/provider.dart';
// import 'package:accound/transfer.dart';
// import 'package:provider/provider.dart';
// // import 'package:provider/provider.dart';
// // import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
// import 'datastore.dart';
// import 'expence.dart';
// import 'package:flutter/material.dart';
// import 'income.dart';
// import 'login.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// class MyWidget extends StatelessWidget {
//   MyWidget({super.key});

//   // Calculation obj = Calculation();
//   List<ReturnValues> transactions = [];

//   List<String> calender = [
//     'January',
//     'February',
//     'March',
//     'April',
//     'June',
//     'July',
//     'August',
//     'September',
//     'October',
//     'November',
//     'December'
//   ];

//   get selectedDate => null;

//   @override
//   Widget build(BuildContext context) {
//     print('home page rebuilding');
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenheigt = MediaQuery.of(context).size.height;

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Column(
//         children: [
//           Container(
//             height: screenheigt / 2.30,
//             width: screenWidth,
//             decoration: BoxDecoration(
//                 color: Colors.yellow[50],
//                 borderRadius:
//                     const BorderRadius.vertical(bottom: Radius.circular(20))),
//             child: Padding(
//               padding: const EdgeInsets.only(
//                   left: 16, right: 15, top: 50, bottom: 23),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: screenheigt / 13,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const CircleAvatar(
//                           radius: 20,
//                           backgroundImage: AssetImage('assets/05.png'),
//                         ),
//                         SizedBox(
//                           width: screenWidth / 3,
//                           height: 40,
//                           child: DropdownButtonFormField(
//                             alignment: Alignment.center,
//                             icon: const Icon(Icons.keyboard_arrow_down_rounded),
//                             iconSize: 30,
//                             isExpanded: true,
//                             hint: const Text(
//                               'Calender',
//                               style: TextStyle(
//                                 fontSize: 15,
//                               ),
//                             ),
//                             decoration:
//                                 const InputDecoration(border: InputBorder.none),
//                             dropdownColor: Colors.white,
//                             items: calender
//                                 .map((e) => DropdownMenuItem(
//                                       value: e,
//                                       child: Text(
//                                         e,
//                                         style: const TextStyle(fontSize: 12),
//                                       ),
//                                     ))
//                                 .toList(),
//                             onChanged: (v) {
//                               selectedDate == v as String;
//                             },
//                           ),
//                         ),
//                         const Icon(
//                           Icons.notifications,
//                           size: 40,
//                         )
//                       ],
//                     ),
//                   ),
//                   const Text(
//                     'Account Balance ',
//                     style: TextStyle(fontSize: 15),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 15),
//                     child: SizedBox(
//                       child: Consumer<MyAppState>(
//                         builder: (context, value, child) {
//                           return Text(
//                             '\$${value.balance}',
//                             style: const TextStyle(
//                                 fontSize: 48, fontWeight: FontWeight.w700),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 30),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         InkWell(
//                           onTap: () async {
//                             ReturnValues? updated = await Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => Incomepage()));

//                             if (updated != null) {
//                               Provider.of<MyAppState>(context, listen: false)
//                                   .addIncome(updated.enteredcash);
//                               Provider.of<MyAppState>(context, listen: false)
//                                   .addlist(updated);
//                             }
//                           },
//                           child: Container(
//                             height: 80,
//                             width: 164,
//                             decoration: BoxDecoration(
//                                 color: Colors.green[400],
//                                 borderRadius: const BorderRadius.all(
//                                     Radius.circular(25))),
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 16),
//                               child: Wrap(
//                                   runAlignment: WrapAlignment.center,
//                                   spacing: 10,
//                                   children: [
//                                     SizedBox(
//                                         height: 48,
//                                         width: 48,
//                                         child:
//                                             Image.asset('assets/Group222.png')),
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         const Text(
//                                           'Income',
//                                           style: TextStyle(
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.w500),
//                                         ),
//                                         Consumer<MyAppState>(
//                                           builder: (context, value, child) {
//                                             return Text(
//                                               '\$${value.income}',
//                                               style: const TextStyle(
//                                                   fontSize: 20,
//                                                   color: Colors.white,
//                                                   fontWeight: FontWeight.w600),
//                                             );
//                                           },
//                                         )
//                                       ],
//                                     )
//                                   ]),
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () async {
//                             ReturnValues? updated = await Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => Expence()));

//                             if (updated != null) {
//                               Provider.of<MyAppState>(context, listen: false)
//                                   .addExpense(updated.enteredcash);
//                               Provider.of<MyAppState>(context, listen: false)
//                                   .addlist(updated);
//                             }
//                           },
//                           child: Container(
//                             height: 80,
//                             width: 164,
//                             decoration: const BoxDecoration(
//                                 color: Colors.red,
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(25))),
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 16),
//                               child: Wrap(
//                                   runAlignment: WrapAlignment.center,
//                                   spacing: 10,
//                                   children: [
//                                     SizedBox(
//                                         height: 48,
//                                         width: 48,
//                                         child:
//                                             Image.asset('assets/Group223.png')),
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         const Text(
//                                           'Expenses',
//                                           style: TextStyle(
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.w500),
//                                         ),
//                                         Consumer<MyAppState>(
//                                           builder: (context, value, child) {
//                                             return Text(
//                                               '\$${value.expense}',
//                                               style: const TextStyle(
//                                                   fontSize: 20,
//                                                   color: Colors.white,
//                                                   fontWeight: FontWeight.w600),
//                                             );
//                                           },
//                                         )
//                                       ],
//                                     )
//                                   ]),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 8),
//             child: SizedBox(
//               height: screenheigt / 28,
//               width: screenWidth,
//               // color: Color.fromARGB(255, 123, 120, 120),
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     TextButton(
//                         onPressed: () {},
//                         child: const Text(
//                           'Today',
//                           style: TextStyle(color: Colors.black),
//                         )),
//                     TextButton(
//                         onPressed: () {},
//                         child: const Text(
//                           'Week',
//                           style: TextStyle(color: Colors.black),
//                         )),
//                     TextButton(
//                         onPressed: () {},
//                         child: const Text(
//                           'Month',
//                           style: TextStyle(color: Colors.black),
//                         )),
//                     TextButton(
//                         onPressed: () {},
//                         child: const Text(
//                           'Year',
//                           style: TextStyle(color: Colors.black),
//                         )),
//                   ]),
//             ),
//           ),
//           SizedBox(
//             height: screenheigt / 25,
//             width: screenWidth,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       'Recent Transaction',
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//                     ),
//                     Container(
//                       alignment: Alignment.center,
//                       height: 32,
//                       width: 78,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(40),
//                           color: const Color.fromARGB(255, 212, 205, 244)),
//                       child: TextButton(
//                         onPressed: () {
//                           MyAppState log = MyAppState();
//                           log.logout();
//                           Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => Loginpage()));
//                         },
//                         child: Text(
//                           'Log out',
//                           style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                               color: Color.fromARGB(255, 115, 63, 246)),
//                         ),
//                       ),
//                     )
//                   ]),
//             ),
//           ),
//           SizedBox(
//             height: screenheigt / 2.5,
//             width: screenWidth,
//             child: Consumer<MyAppState>(
//               builder: (BuildContext context, value, child) {
//                 return ListView.separated(
//                   itemCount: value.transactions.length,
//                   itemBuilder: (context, index) {
//                     final transaction = value.transactions[index];
//                     switch (transaction.type) {
//                       case 'income':
//                         return ListTile(
//                           leading: getLeadingWidget(transaction.cat),
//                           title: Text(transaction.cat,
//                               style: const TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.black)),
//                           subtitle: Text(transaction.discription),
//                           trailing: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Text(
//                                 '+\$ ${transaction.enteredcash}',
//                                 style: const TextStyle(
//                                     color: Colors.green,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w900),
//                               ),
//                               Text(transaction.time)
//                             ],
//                           ),
//                         );

//                       case 'expence':
//                         return ListTile(
//                           leading: getLeadingWidget(transaction.cat),
//                           title: Text(transaction.cat,
//                               style: const TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.black)),
//                           subtitle: Text(transaction.discription),
//                           trailing: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Text(
//                                 '-\$ ${transaction.enteredcash}',
//                                 style: const TextStyle(
//                                     color: Colors.red,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w900),
//                               ),
//                               Text(transaction.time)
//                             ],
//                           ),
//                         );
//                       case 'transfer':
//                         return ListTile(
//                           leading: getLeadingWidget(transaction.cat),
//                           title: Text(transaction.cat,
//                               style: const TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.black)),
//                           subtitle: Text(transaction.discription),
//                           trailing: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Text(
//                                 '-\$ ${transaction.enteredcash}',
//                                 style: const TextStyle(
//                                     color: Colors.blue,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w900),
//                               ),
//                               Text(transaction.time)
//                             ],
//                           ),
//                         );
//                     }
//                     return null;
//                   },
//                   separatorBuilder: (BuildContext context, int index) {
//                     return const Divider(
//                       color: Color.fromARGB(255, 177, 172, 172),
//                     );
//                   },
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//       // floatingActionButtonLocation: ExpandableFab.location,
//       // floatingActionButton: ExpandableFab(
//       //   child: const Icon(Icons.add),
//       //   backgroundColor: Colors.deepPurple,
//       //   children: [
//       //     FloatingActionButton(
//       //       onPressed: () {},
//       //       backgroundColor: Colors.green,
//       //       child: const Icon(Icons.incomplete_circle_rounded),
//       //     ),
//       //     FloatingActionButton(
//       //       onPressed: () {},
//       //       backgroundColor: Colors.green,
//       //       child: const Icon(Icons.incomplete_circle_rounded),
//       //     ),
//       //     FloatingActionButton(
//       //       onPressed: () {},
//       //       backgroundColor: Colors.green,
//       //       child: const Icon(Icons.incomplete_circle_rounded),
//       //     ),
//       //   ],
//       // ),
//       bottomNavigationBar: BottomAppBar(
//         height: screenheigt / 15,
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             IconButton(
//               icon: const Icon(
//                 Icons.home,
//               ),
//               color: Colors.black,
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: const Icon(
//                 Icons.swap_horiz_sharp,
//               ),
//               color: Colors.black,
//               onPressed: () async {
//                 ReturnValues? updated = await Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => Expence()));

//                 if (updated != null) {
//                   Provider.of<MyAppState>(context, listen: false)
//                       .addExpense(updated.enteredcash);
//                   Provider.of<MyAppState>(context, listen: false)
//                       .addlist(updated);
//                 }
//               },
//             ),
//             IconButton(
//               icon: const Icon(
//                 Icons.incomplete_circle_rounded,
//               ),
//               color: Colors.black,
//               onPressed: () {},
//             ),
//             Consumer<MyAppState>(
//               builder: (context, value, child) {
//                 return IconButton(
//                   icon: const Icon(
//                     Icons.delete_forever_outlined,
//                   ),
//                   color: Colors.black,
//                   onPressed: () {
//                     value.remove();
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget getLeadingWidget(String category) {
//     switch (category) {
//       case 'salary':
//         return Image.asset('assets/salary.png');
//       case 'passive income':
//         return Image.asset('assets/p income.png');
//       case 'Shopping':
//         return Image.asset('assets/shoping.png');
//       case 'Food':
//         return Image.asset('assets/food.png');
//       case 'subscription':
//         return Image.asset('assets/subscription.png');
//       case 'transportation':
//         return Image.asset('assets/transportation.png');
//       default:
//         return Image.asset('assets/swap.png');
//     }
//   }
// }


import 'package:accound/provider.dart';
import 'package:accound/transfer.dart';
import 'package:provider/provider.dart';
import 'datastore.dart';
import 'expence.dart';
import 'package:flutter/material.dart';
import 'income.dart';
import 'login.dart';

class MyWidget extends StatelessWidget {
  MyWidget({super.key});

  List<ReturnValues> transactions = [];

  List<String> calender = [
    'January',
    'February',
    'March',
    'April',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  String? selectedDate;

  @override
  Widget build(BuildContext context) {
    print('home page rebuilding');
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: screenHeight / 2.30,
            width: screenWidth,
            decoration: BoxDecoration(
                color: Colors.yellow[50],
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 15, top: 50, bottom: 23),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight / 14,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/05.png'),
                        ),
                        SizedBox(
                          width: screenWidth / 3,
                          height: 40,
                          child: DropdownButtonFormField(
                            alignment: Alignment.center,
                            icon: const Icon(Icons.keyboard_arrow_down_rounded),
                            iconSize: 30,
                            isExpanded: true,
                            hint: const Text(
                              'Calender',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            dropdownColor: Colors.white,
                            items: calender
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                        e,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (v) {
                              selectedDate = v as String?;
                            },
                          ),
                        ),
                        const Icon(
                          Icons.notifications,
                          size: 40,
                        )
                      ],
                    ),
                  ),
                  const Text(
                    'Account Balance ',
                    style: TextStyle(fontSize: 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: SizedBox(
                      child: Consumer<MyAppState>(
                        builder: (context, value, child) {
                          return Text(
                            '\$${value.balance}',
                            style: const TextStyle(
                                fontSize: 48, fontWeight: FontWeight.w700),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () async {
                            ReturnValues? updated = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Incomepage()));
              
                            if (updated != null) {
                              Provider.of<MyAppState>(context, listen: false)
                                  .addIncome(updated.enteredcash);
                              Provider.of<MyAppState>(context, listen: false)
                                  .addlist(updated);
                            }
                          },
                          child: Container(
                            height: 80,
                            width: 164,
                            decoration: BoxDecoration(
                                color: Colors.green[400],
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(25))),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Wrap(
                                  runAlignment: WrapAlignment.center,
                                  spacing: 10,
                                  children: [
                                    SizedBox(
                                        height: 48,
                                        width: 48,
                                        child:
                                            Image.asset('assets/Group222.png')),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Income',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Consumer<MyAppState>(
                                          builder: (context, value, child) {
                                            return Text(
                                              '\$${value.income}',
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            );
                                          },
                                        )
                                      ],
                                    )
                                  ]),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            ReturnValues? updated = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Expence()));
              
                            if (updated != null) {
                              Provider.of<MyAppState>(context, listen: false)
                                  .addExpense(updated.enteredcash);
                              Provider.of<MyAppState>(context, listen: false)
                                  .addlist(updated);
                            }
                          },
                          child: Container(
                            height: 80,
                            width: 164,
                            decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Wrap(
                                  runAlignment: WrapAlignment.center,
                                  spacing: 10,
                                  children: [
                                    SizedBox(
                                        height: 48,
                                        width: 48,
                                        child:
                                            Image.asset('assets/Group223.png')),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Expenses',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Consumer<MyAppState>(
                                          builder: (context, value, child) {
                                            return Text(
                                              '\$${value.expense}',
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            );
                                          },
                                        )
                                      ],
                                    )
                                  ]),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              height: screenHeight / 20,
              width: screenWidth,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Today',
                          style: TextStyle(color: Colors.black),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Week',
                          style: TextStyle(color: Colors.black),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Month',
                          style: TextStyle(color: Colors.black),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Year',
                          style: TextStyle(color: Colors.black),
                        )),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: screenHeight / 20,
              width: screenWidth,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Recent Transaction',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 32,
                      width: 78,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: const Color.fromARGB(255, 212, 205, 244)),
                      child: TextButton(
                        onPressed: () {
                          MyAppState log = MyAppState();
                          log.logout();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Loginpage()));
                        },
                        child: const Text(
                          'Log out',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 115, 63, 246)),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: screenHeight / 2.5,
              width: screenWidth,
              child: Consumer<MyAppState>(
                builder: (BuildContext context, value, child) {
                  return ListView.separated(
                    itemCount: value.transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = value.transactions[index];
                      return ListTile(
                        leading: getLeadingWidget(transaction.cat),
                        title: Text(transaction.cat,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                        subtitle: Text(transaction.discription),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${transaction.type == 'income' ? '+' : '-'}\$${transaction.enteredcash}',
                              style: TextStyle(
                                  color: transaction.type == 'income'
                                      ? Colors.green
                                      : (transaction.type == 'expence'
                                          ? Colors.red
                                          : Colors.blue),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(transaction.time)
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        color: Color.fromARGB(255, 177, 172, 172),
                      );
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: screenHeight / 15,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.home,
              ),
              color: Colors.black,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.swap_horiz_sharp,
              ),
              color: Colors.black,
              onPressed: () async {
                ReturnValues? updated = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Expence()));

                if (updated != null) {
                  Provider.of<MyAppState>(context, listen: false)
                      .addExpense(updated.enteredcash);
                  Provider.of<MyAppState>(context, listen: false)
                      .addlist(updated);
                }
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.incomplete_circle_rounded,
              ),
              color: Colors.black,
              onPressed: () {},
            ),
            Consumer<MyAppState>(
              builder: (context, value, child) {
                return IconButton(
                  icon: const Icon(
                    Icons.delete_forever_outlined,
                  ),
                  color: Colors.black,
                  onPressed: () {
                    value.remove();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget getLeadingWidget(String category) {
    switch (category) {
      case 'salary':
        return Image.asset('assets/salary.png');
      case 'passive income':
        return Image.asset('assets/p income.png');
      case 'Shopping':
        return Image.asset('assets/shoping.png');
      case 'Food':
        return Image.asset('assets/food.png');
      case 'subscription':
        return Image.asset('assets/subscription.png');
      case 'transportation':
        return Image.asset('assets/transportation.png');
      default:
        return Image.asset('assets/swap.png');
    }
  }
}


