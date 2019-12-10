import 'dart:async';
import 'package:flutter/material.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteHandler{
  String tableSQL;
  String tableName;
  SqfliteHandler({this.tableName,this.tableSQL});

  Future<Database> getDataBase() async{
    final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'shiniu_database.db'),
    );
    return database;
  }

  createTable(String sql) async{
    Database db = await getDataBase();
    return db.execute(sql);
  }
  reCreatTable()async{
    if(checkTableExists()!=0){
      Database db = await getDataBase();
      db.execute("drop table "+tableName);
      return db.execute(tableSQL);
    }

  }

  checkTableExists() async{
    Database db = await getDataBase();
    var isTableExists =  Sqflite.firstIntValue(await db.rawQuery("SELECT count(*) FROM sqlite_master WHERE type='table' AND name='"+tableName+"'"));
    if(isTableExists == 0){
      createTable(tableSQL);
    }
    return isTableExists;
  }

  query(String sql) async{
    Database db = await getDataBase();
    if(tableName==null){
      throw Exception("表名不能为空");
    }
   checkTableExists();
    return db.rawQuery(sql);
  }

  insert(String sql) async{
    int id;
    Database db = await getDataBase();
    checkTableExists();
    await db.transaction((txn) async {
       id = await txn.rawInsert(sql);
    });
    return id;
  }

  update(String sql) async{
    int id;
    Database db = await getDataBase();
    checkTableExists();
    await db.transaction((txn) async {
      id = await txn.rawUpdate(sql);
    });
    return id;
  }


}

