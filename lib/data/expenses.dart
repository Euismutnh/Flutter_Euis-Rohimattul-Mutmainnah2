import 'package:drift/drift.dart';


@DataClassName('Expense')
class Expenses extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime().named('createAt')();
  IntColumn get category => integer().named('category')(); 
  IntColumn get amount => integer().named('amount')();
  TextColumn get note => text().named('note').nullable()();
}
