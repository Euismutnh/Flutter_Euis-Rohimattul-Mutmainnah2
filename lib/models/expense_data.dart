import 'package:flutter/foundation.dart';

class ExpenseData extends ChangeNotifier {
  final List<Map<String, dynamic>> _expenses = [];

  List<Map<String, dynamic>> get expenses => _expenses;

  void addExpense(Map<String, dynamic> expense) {
    _expenses.add(expense);
    _expenses.sort((a, b) => b['date'].compareTo(a['date']));
    notifyListeners();
  }

  void removeExpense(Map<String, dynamic> expense) {
    _expenses.remove(expense);
    notifyListeners();
  }
}
