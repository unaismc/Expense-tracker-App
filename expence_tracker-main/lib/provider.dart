import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'datastore.dart';

class MyAppState extends ChangeNotifier {
  double balance = 0;
  double income = 0;
  double expense = 0;

  List<ReturnValues> transactions = [];
  late SharedPreferences prefs;

  MyAppState() {
    loadData();
    loadlist();
    print('jinshad');
  }

  Future<void> loadData() async {
    prefs = await SharedPreferences.getInstance();
    balance = prefs.getDouble('balance') ?? 0;
    income = prefs.getDouble('income') ?? 0;
    expense = prefs.getDouble('expense') ?? 0;

    print('load data working');
    notifyListeners();
  }

  Future<void> loadlist() async {
    prefs = await SharedPreferences.getInstance();
    List<String> listString = prefs.getStringList('transactions') ?? [];

    transactions = listString
        .map((item) => ReturnValues.fromMap(json.decode(item)))
        .toList();

    print('load list working');
  }

  void addIncome(double addedIncome) {
    income += addedIncome;
    balance += addedIncome;
    prefs.setDouble('balance', balance);
    prefs.setDouble('income', income);
    notifyListeners();
  }

  void addExpense(double expenseValue) {
    expense += expenseValue;
    balance -= expenseValue;
    prefs.setDouble('balance', balance);
    prefs.setDouble('expense', expense);
    notifyListeners();
  }

  void addlist(ReturnValues details) async {
    prefs = await SharedPreferences.getInstance();
    transactions.add(details);
    final transactionsJson =
        transactions.map((tx) => json.encode(tx.toMap())).toList();
    prefs.setStringList('transactions', transactionsJson);

    notifyListeners();
  }

  void loginbool() async {
    prefs = await SharedPreferences.getInstance();

    prefs.setBool('login', true);
    print('log in is true');
    notifyListeners();
  }

  void remove() async {
    prefs = await SharedPreferences.getInstance();
    print('remove all');
    await prefs.remove('balance');
    await prefs.remove('income');
    await prefs.remove('expense');
    transactions = [];
    await prefs.remove('transactions');
    loadData();
    notifyListeners();
  }

  void logout() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.remove('login');
  }
}
