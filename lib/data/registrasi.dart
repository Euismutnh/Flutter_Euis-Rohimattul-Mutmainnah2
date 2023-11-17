import 'package:drift/drift.dart';

@DataClassName('Registration')
class Registrations extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fullName => text().named('full_name')();
  TextColumn get email => text().named('email')();
  TextColumn get phone => text().named('phone')();
  TextColumn get password => text().named('password')();
}

@DataClassName('Login')
class Logins extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get registrationId =>
      integer().customConstraint('REFERENCES registrations(id)')();
  TextColumn get email => text().customConstraint('UNIQUE').nullable()();
  TextColumn get password => text()();
}
