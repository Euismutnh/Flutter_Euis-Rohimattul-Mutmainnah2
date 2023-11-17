import 'package:flutter/foundation.dart';

class PlanningData extends ChangeNotifier {
  final List<Map<String, dynamic>> _plannings = [];

  List<Map<String, dynamic>> get plannings => _plannings;

  void addPlanning(Map<String, dynamic> planning) {
    _plannings.add(planning);
    _plannings.sort((a, b) => b['date'].compareTo(a['date']));
    notifyListeners();
  }

  void removePlanning(Map<String, dynamic> planning) {
    _plannings.remove(planning);
    notifyListeners();
  }
}
