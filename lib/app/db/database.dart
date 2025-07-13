import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weather/util/logger.dart';

typedef DbInfo = ({String dbName, String queryFileName, int dbVersion});

abstract class SqfLiteDbHandler {
  late final Database _db;
  late final Logger _logger;

  Database get db => _db;

  void initLogger(Logger injectedLogger) {
    _logger = injectedLogger;
  }

  Future<void> initializeDb(DbInfo dbInfo) async {
    await _initializeDb(dbInfo.dbName, dbInfo.queryFileName, dbInfo.dbVersion);
  }

  Future<void> _initializeDb(
    String dbName,
    String queryFileName,
    int dbVersion,
  ) async {
    try {
      final dbPath = join(await getDatabasesPath(), '$dbName.db');
      debugPrint('📦 SQLite DB Path: $dbPath');

      _db = await openDatabase(
        dbPath,
        version: dbVersion,
        onCreate: (db, version) => _onCreate(db, queryFileName),
        onUpgrade: (db, oldVersion, newVersion) =>
            _onUpgrade(db, oldVersion, newVersion, queryFileName),
      );
    } catch (e) {
      _logger.error('DB Initialization Error: $e');
      rethrow;
    }
  }

  Future<void> _onCreate(Database db, String queryFileName) async {
    final rawSQL = await rootBundle.loadString(
      'lib/app/db/queries/$queryFileName.sql',
    );
    final cleanedSQL = rawSQL.replaceAll('\n', '').trim();
    final queries = cleanedSQL.split(';').where((q) => q.trim().isNotEmpty);

    final batch = db.batch();
    for (final query in queries) {
      batch.execute(query.trim());
    }
    await batch.commit(noResult: true);
    _logger.info('DB Tables Created.');
  }

  @protected
  Future<void> _onUpgrade(
    Database db,
    int oldVersion,
    int newVersion,
    String queryFileName,
  ) async {
    // Subclasses can override for migrations.
    _logger.info('Upgrade from $oldVersion to $newVersion not implemented.');
  }

  Future<int> insert(String tableName, Map<String, dynamic> data) async {
    return await _db.insert(
      tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Object?>> insertBatch(
    String tableName,
    List<Map<String, dynamic>> dataList,
  ) async {
    final batch = _db.batch();
    for (final row in dataList) {
      batch.insert(
        tableName,
        row,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    return await batch.commit(continueOnError: true, noResult: false);
  }

  Future<List<Map<String, dynamic>>> selectAll(String tableName) async {
    return await _db.query(tableName);
  }

  Future<List<Map<String, dynamic>>> query({
    required String tableName,
    String? where,
    List<Object?>? whereArgs,
    String? orderBy,
  }) async {
    return await _db.query(
      tableName,
      where: where,
      whereArgs: whereArgs,
      orderBy: orderBy,
    );
  }

  Future<int> delete({
    required String tableName,
    String? where,
    List<Object?>? whereArgs,
  }) async {
    return await _db.delete(tableName, where: where, whereArgs: whereArgs);
  }

  Future<int> clearTable(String tableName) async {
    return await _db.rawDelete("DELETE FROM $tableName");
  }

  Future<void> closeDb() async {
    await _db.close();
  }
}
