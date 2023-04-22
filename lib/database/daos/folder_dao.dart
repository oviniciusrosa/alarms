import 'package:alarms/database/connection/app_database.dart';
import 'package:alarms/database/entities/folder_entity.dart';
import 'package:drift/drift.dart';

part 'folder_dao.g.dart';

@DriftAccessor(tables: [Folder])
class FolderDao extends DatabaseAccessor<AppDb> with _$FolderDaoMixin {
  FolderDao(AppDb db) : super(db);

  Stream<List<FolderData>> list() => select(folder).watch();

  Future<void> createNew(FolderData note) async => await into(folder).insert(note);

  Future<void> updateExistent(FolderData note) async => await update(folder).replace(note);

  Future<void> deleteExistent(FolderData note) async => await delete(folder).delete(note);
}
