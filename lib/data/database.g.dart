// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ExpensesTable extends Expenses with TableInfo<$ExpensesTable, Expense> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpensesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'createAt', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<int> category = GeneratedColumn<int>(
      'category', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, date, category, amount, note];
  @override
  String get aliasedName => _alias ?? 'expenses';
  @override
  String get actualTableName => 'expenses';
  @override
  VerificationContext validateIntegrity(Insertable<Expense> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('createAt')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['createAt']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Expense map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Expense(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}createAt'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
    );
  }

  @override
  $ExpensesTable createAlias(String alias) {
    return $ExpensesTable(attachedDatabase, alias);
  }
}

class Expense extends DataClass implements Insertable<Expense> {
  final int id;
  final DateTime date;
  final int category;
  final int amount;
  final String? note;
  const Expense(
      {required this.id,
      required this.date,
      required this.category,
      required this.amount,
      this.note});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['createAt'] = Variable<DateTime>(date);
    map['category'] = Variable<int>(category);
    map['amount'] = Variable<int>(amount);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  ExpensesCompanion toCompanion(bool nullToAbsent) {
    return ExpensesCompanion(
      id: Value(id),
      date: Value(date),
      category: Value(category),
      amount: Value(amount),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory Expense.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Expense(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      category: serializer.fromJson<int>(json['category']),
      amount: serializer.fromJson<int>(json['amount']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'category': serializer.toJson<int>(category),
      'amount': serializer.toJson<int>(amount),
      'note': serializer.toJson<String?>(note),
    };
  }

  Expense copyWith(
          {int? id,
          DateTime? date,
          int? category,
          int? amount,
          Value<String?> note = const Value.absent()}) =>
      Expense(
        id: id ?? this.id,
        date: date ?? this.date,
        category: category ?? this.category,
        amount: amount ?? this.amount,
        note: note.present ? note.value : this.note,
      );
  @override
  String toString() {
    return (StringBuffer('Expense(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('category: $category, ')
          ..write('amount: $amount, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, category, amount, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Expense &&
          other.id == this.id &&
          other.date == this.date &&
          other.category == this.category &&
          other.amount == this.amount &&
          other.note == this.note);
}

class ExpensesCompanion extends UpdateCompanion<Expense> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int> category;
  final Value<int> amount;
  final Value<String?> note;
  const ExpensesCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.category = const Value.absent(),
    this.amount = const Value.absent(),
    this.note = const Value.absent(),
  });
  ExpensesCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required int category,
    required int amount,
    this.note = const Value.absent(),
  })  : date = Value(date),
        category = Value(category),
        amount = Value(amount);
  static Insertable<Expense> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<int>? category,
    Expression<int>? amount,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'createAt': date,
      if (category != null) 'category': category,
      if (amount != null) 'amount': amount,
      if (note != null) 'note': note,
    });
  }

  ExpensesCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<int>? category,
      Value<int>? amount,
      Value<String?>? note}) {
    return ExpensesCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      category: category ?? this.category,
      amount: amount ?? this.amount,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['createAt'] = Variable<DateTime>(date.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpensesCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('category: $category, ')
          ..write('amount: $amount, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $IncomesTable extends Incomes with TableInfo<$IncomesTable, Income> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IncomesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'createAt', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<int> category = GeneratedColumn<int>(
      'category', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, date, category, amount, note];
  @override
  String get aliasedName => _alias ?? 'incomes';
  @override
  String get actualTableName => 'incomes';
  @override
  VerificationContext validateIntegrity(Insertable<Income> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('createAt')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['createAt']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Income map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Income(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}createAt'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
    );
  }

  @override
  $IncomesTable createAlias(String alias) {
    return $IncomesTable(attachedDatabase, alias);
  }
}

class Income extends DataClass implements Insertable<Income> {
  final int id;
  final DateTime date;
  final int category;
  final int amount;
  final String? note;
  const Income(
      {required this.id,
      required this.date,
      required this.category,
      required this.amount,
      this.note});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['createAt'] = Variable<DateTime>(date);
    map['category'] = Variable<int>(category);
    map['amount'] = Variable<int>(amount);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  IncomesCompanion toCompanion(bool nullToAbsent) {
    return IncomesCompanion(
      id: Value(id),
      date: Value(date),
      category: Value(category),
      amount: Value(amount),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory Income.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Income(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      category: serializer.fromJson<int>(json['category']),
      amount: serializer.fromJson<int>(json['amount']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'category': serializer.toJson<int>(category),
      'amount': serializer.toJson<int>(amount),
      'note': serializer.toJson<String?>(note),
    };
  }

  Income copyWith(
          {int? id,
          DateTime? date,
          int? category,
          int? amount,
          Value<String?> note = const Value.absent()}) =>
      Income(
        id: id ?? this.id,
        date: date ?? this.date,
        category: category ?? this.category,
        amount: amount ?? this.amount,
        note: note.present ? note.value : this.note,
      );
  @override
  String toString() {
    return (StringBuffer('Income(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('category: $category, ')
          ..write('amount: $amount, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, category, amount, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Income &&
          other.id == this.id &&
          other.date == this.date &&
          other.category == this.category &&
          other.amount == this.amount &&
          other.note == this.note);
}

class IncomesCompanion extends UpdateCompanion<Income> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int> category;
  final Value<int> amount;
  final Value<String?> note;
  const IncomesCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.category = const Value.absent(),
    this.amount = const Value.absent(),
    this.note = const Value.absent(),
  });
  IncomesCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required int category,
    required int amount,
    this.note = const Value.absent(),
  })  : date = Value(date),
        category = Value(category),
        amount = Value(amount);
  static Insertable<Income> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<int>? category,
    Expression<int>? amount,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'createAt': date,
      if (category != null) 'category': category,
      if (amount != null) 'amount': amount,
      if (note != null) 'note': note,
    });
  }

  IncomesCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<int>? category,
      Value<int>? amount,
      Value<String?>? note}) {
    return IncomesCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      category: category ?? this.category,
      amount: amount ?? this.amount,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['createAt'] = Variable<DateTime>(date.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IncomesCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('category: $category, ')
          ..write('amount: $amount, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $PlanningsTable extends Plannings
    with TableInfo<$PlanningsTable, Planning> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlanningsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'createAt', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<int> category = GeneratedColumn<int>(
      'category', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, date, category, amount, note];
  @override
  String get aliasedName => _alias ?? 'plannings';
  @override
  String get actualTableName => 'plannings';
  @override
  VerificationContext validateIntegrity(Insertable<Planning> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('createAt')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['createAt']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Planning map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Planning(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}createAt'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
    );
  }

  @override
  $PlanningsTable createAlias(String alias) {
    return $PlanningsTable(attachedDatabase, alias);
  }
}

class Planning extends DataClass implements Insertable<Planning> {
  final int id;
  final DateTime date;
  final int category;
  final int amount;
  final String? note;
  const Planning(
      {required this.id,
      required this.date,
      required this.category,
      required this.amount,
      this.note});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['createAt'] = Variable<DateTime>(date);
    map['category'] = Variable<int>(category);
    map['amount'] = Variable<int>(amount);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  PlanningsCompanion toCompanion(bool nullToAbsent) {
    return PlanningsCompanion(
      id: Value(id),
      date: Value(date),
      category: Value(category),
      amount: Value(amount),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory Planning.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Planning(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      category: serializer.fromJson<int>(json['category']),
      amount: serializer.fromJson<int>(json['amount']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'category': serializer.toJson<int>(category),
      'amount': serializer.toJson<int>(amount),
      'note': serializer.toJson<String?>(note),
    };
  }

  Planning copyWith(
          {int? id,
          DateTime? date,
          int? category,
          int? amount,
          Value<String?> note = const Value.absent()}) =>
      Planning(
        id: id ?? this.id,
        date: date ?? this.date,
        category: category ?? this.category,
        amount: amount ?? this.amount,
        note: note.present ? note.value : this.note,
      );
  @override
  String toString() {
    return (StringBuffer('Planning(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('category: $category, ')
          ..write('amount: $amount, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, category, amount, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Planning &&
          other.id == this.id &&
          other.date == this.date &&
          other.category == this.category &&
          other.amount == this.amount &&
          other.note == this.note);
}

class PlanningsCompanion extends UpdateCompanion<Planning> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int> category;
  final Value<int> amount;
  final Value<String?> note;
  const PlanningsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.category = const Value.absent(),
    this.amount = const Value.absent(),
    this.note = const Value.absent(),
  });
  PlanningsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required int category,
    required int amount,
    this.note = const Value.absent(),
  })  : date = Value(date),
        category = Value(category),
        amount = Value(amount);
  static Insertable<Planning> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<int>? category,
    Expression<int>? amount,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'createAt': date,
      if (category != null) 'category': category,
      if (amount != null) 'amount': amount,
      if (note != null) 'note': note,
    });
  }

  PlanningsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<int>? category,
      Value<int>? amount,
      Value<String?>? note}) {
    return PlanningsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      category: category ?? this.category,
      amount: amount ?? this.amount,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['createAt'] = Variable<DateTime>(date.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlanningsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('category: $category, ')
          ..write('amount: $amount, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $RegistrationsTable extends Registrations
    with TableInfo<$RegistrationsTable, Registration> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RegistrationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, fullName, email, phone, password];
  @override
  String get aliasedName => _alias ?? 'registrations';
  @override
  String get actualTableName => 'registrations';
  @override
  VerificationContext validateIntegrity(Insertable<Registration> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Registration map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Registration(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
    );
  }

  @override
  $RegistrationsTable createAlias(String alias) {
    return $RegistrationsTable(attachedDatabase, alias);
  }
}

class Registration extends DataClass implements Insertable<Registration> {
  final int id;
  final String fullName;
  final String email;
  final String phone;
  final String password;
  const Registration(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.phone,
      required this.password});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['full_name'] = Variable<String>(fullName);
    map['email'] = Variable<String>(email);
    map['phone'] = Variable<String>(phone);
    map['password'] = Variable<String>(password);
    return map;
  }

  RegistrationsCompanion toCompanion(bool nullToAbsent) {
    return RegistrationsCompanion(
      id: Value(id),
      fullName: Value(fullName),
      email: Value(email),
      phone: Value(phone),
      password: Value(password),
    );
  }

  factory Registration.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Registration(
      id: serializer.fromJson<int>(json['id']),
      fullName: serializer.fromJson<String>(json['fullName']),
      email: serializer.fromJson<String>(json['email']),
      phone: serializer.fromJson<String>(json['phone']),
      password: serializer.fromJson<String>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fullName': serializer.toJson<String>(fullName),
      'email': serializer.toJson<String>(email),
      'phone': serializer.toJson<String>(phone),
      'password': serializer.toJson<String>(password),
    };
  }

  Registration copyWith(
          {int? id,
          String? fullName,
          String? email,
          String? phone,
          String? password}) =>
      Registration(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        password: password ?? this.password,
      );
  @override
  String toString() {
    return (StringBuffer('Registration(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, fullName, email, phone, password);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Registration &&
          other.id == this.id &&
          other.fullName == this.fullName &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.password == this.password);
}

class RegistrationsCompanion extends UpdateCompanion<Registration> {
  final Value<int> id;
  final Value<String> fullName;
  final Value<String> email;
  final Value<String> phone;
  final Value<String> password;
  const RegistrationsCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.password = const Value.absent(),
  });
  RegistrationsCompanion.insert({
    this.id = const Value.absent(),
    required String fullName,
    required String email,
    required String phone,
    required String password,
  })  : fullName = Value(fullName),
        email = Value(email),
        phone = Value(phone),
        password = Value(password);
  static Insertable<Registration> custom({
    Expression<int>? id,
    Expression<String>? fullName,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? password,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (password != null) 'password': password,
    });
  }

  RegistrationsCompanion copyWith(
      {Value<int>? id,
      Value<String>? fullName,
      Value<String>? email,
      Value<String>? phone,
      Value<String>? password}) {
    return RegistrationsCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RegistrationsCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }
}

class $LoginsTable extends Logins with TableInfo<$LoginsTable, Login> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LoginsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _registrationIdMeta =
      const VerificationMeta('registrationId');
  @override
  late final GeneratedColumn<int> registrationId = GeneratedColumn<int>(
      'registration_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES registrations(id)');
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'UNIQUE');
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, registrationId, email, password];
  @override
  String get aliasedName => _alias ?? 'logins';
  @override
  String get actualTableName => 'logins';
  @override
  VerificationContext validateIntegrity(Insertable<Login> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('registration_id')) {
      context.handle(
          _registrationIdMeta,
          registrationId.isAcceptableOrUnknown(
              data['registration_id']!, _registrationIdMeta));
    } else if (isInserting) {
      context.missing(_registrationIdMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Login map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Login(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      registrationId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}registration_id'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
    );
  }

  @override
  $LoginsTable createAlias(String alias) {
    return $LoginsTable(attachedDatabase, alias);
  }
}

class Login extends DataClass implements Insertable<Login> {
  final int id;
  final int registrationId;
  final String? email;
  final String password;
  const Login(
      {required this.id,
      required this.registrationId,
      this.email,
      required this.password});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['registration_id'] = Variable<int>(registrationId);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    map['password'] = Variable<String>(password);
    return map;
  }

  LoginsCompanion toCompanion(bool nullToAbsent) {
    return LoginsCompanion(
      id: Value(id),
      registrationId: Value(registrationId),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      password: Value(password),
    );
  }

  factory Login.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Login(
      id: serializer.fromJson<int>(json['id']),
      registrationId: serializer.fromJson<int>(json['registrationId']),
      email: serializer.fromJson<String?>(json['email']),
      password: serializer.fromJson<String>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'registrationId': serializer.toJson<int>(registrationId),
      'email': serializer.toJson<String?>(email),
      'password': serializer.toJson<String>(password),
    };
  }

  Login copyWith(
          {int? id,
          int? registrationId,
          Value<String?> email = const Value.absent(),
          String? password}) =>
      Login(
        id: id ?? this.id,
        registrationId: registrationId ?? this.registrationId,
        email: email.present ? email.value : this.email,
        password: password ?? this.password,
      );
  @override
  String toString() {
    return (StringBuffer('Login(')
          ..write('id: $id, ')
          ..write('registrationId: $registrationId, ')
          ..write('email: $email, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, registrationId, email, password);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Login &&
          other.id == this.id &&
          other.registrationId == this.registrationId &&
          other.email == this.email &&
          other.password == this.password);
}

class LoginsCompanion extends UpdateCompanion<Login> {
  final Value<int> id;
  final Value<int> registrationId;
  final Value<String?> email;
  final Value<String> password;
  const LoginsCompanion({
    this.id = const Value.absent(),
    this.registrationId = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
  });
  LoginsCompanion.insert({
    this.id = const Value.absent(),
    required int registrationId,
    this.email = const Value.absent(),
    required String password,
  })  : registrationId = Value(registrationId),
        password = Value(password);
  static Insertable<Login> custom({
    Expression<int>? id,
    Expression<int>? registrationId,
    Expression<String>? email,
    Expression<String>? password,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (registrationId != null) 'registration_id': registrationId,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
    });
  }

  LoginsCompanion copyWith(
      {Value<int>? id,
      Value<int>? registrationId,
      Value<String?>? email,
      Value<String>? password}) {
    return LoginsCompanion(
      id: id ?? this.id,
      registrationId: registrationId ?? this.registrationId,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (registrationId.present) {
      map['registration_id'] = Variable<int>(registrationId.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoginsCompanion(')
          ..write('id: $id, ')
          ..write('registrationId: $registrationId, ')
          ..write('email: $email, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $ExpensesTable expenses = $ExpensesTable(this);
  late final $IncomesTable incomes = $IncomesTable(this);
  late final $PlanningsTable plannings = $PlanningsTable(this);
  late final $RegistrationsTable registrations = $RegistrationsTable(this);
  late final $LoginsTable logins = $LoginsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [expenses, incomes, plannings, registrations, logins];
}
