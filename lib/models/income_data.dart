import 'package:flutter/foundation.dart';

class IncomeData extends ChangeNotifier {
  final List<Map<String, dynamic>> _incomes = [];

  List<Map<String, dynamic>> get incomes => _incomes;

  void addIncome(Map<String, dynamic> income) {
    _incomes.add(income);
    _incomes.sort((a, b) => b['date'].compareTo(a['date']));
    notifyListeners();
  }

  void removeIncome(Map<String, dynamic> income) {
    _incomes.remove(income);
    notifyListeners();
  }
}
