import 'dart:io';

import 'package:alarms/database/daos/folder_dao.dart';
import 'package:alarms/database/entities/folder_entity.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

LazyDatabase _createConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'note_it_app_db.sqlite'));

    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Folder], daos: [FolderDao])
class AppDb extends _$AppDb {
  AppDb() : super(_createConnection());

  @override
  int get schemaVersion => 1;
}
