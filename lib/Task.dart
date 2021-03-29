 import 'dart:ui';

import 'package:next_step_planning/db/database.dart';

class Task  {
      int id;
      String taskName;
      String dueDate;
      String taskColor;
      String taskDifficulty;
      String taskDescription;
      String dateCreated;

      Task({
      this.id,
      this.taskName,
      this.dueDate,
      this.taskColor,
      this.taskDifficulty,
      this.taskDescription,
      this.dateCreated
      });

      Map<String, dynamic> toMap() {
            var map = <String, dynamic>{
                  DataBase.COLUMN_TASKNAME: taskName,
                  DataBase.COLUMN_DUEDATE: dueDate,
                  DataBase.COLUMN_COLOR: taskColor,
                  DataBase.COLUMN_TASKDIFF: taskDifficulty,
                  DataBase.COLUMN_TASKCREATED: dateCreated
            };

            if(id !=null ){
                  map[DataBase.COLUMN_ID] = id;
            }

            return map;
      }

      Task.fromMap(Map<String, dynamic> map){
            id = map[DataBase.COLUMN_ID];
            taskName = map[DataBase.COLUMN_TASKNAME];
            dueDate = map[DataBase.COLUMN_DUEDATE];
            taskColor = map[DataBase.COLUMN_COLOR];
            taskDifficulty = map[DataBase.COLUMN_TASKDIFF];
            taskDescription = map[DataBase.COLUMN_TASKDESC];
            dateCreated = map[DataBase.COLUMN_TASKCREATED];
      }







}