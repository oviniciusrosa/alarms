import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Folder extends Table {
  TextColumn get id => text().named("id")();
  TextColumn get title => text().named("title")();
  TextColumn get color => text().named("color")();
  DateTimeColumn get createdAt => dateTime().named("createdAt")();
  DateTimeColumn get updatedAt => dateTime().named("updatedAt")();

  @override
  Set<Column> get primaryKey => {id};
}
