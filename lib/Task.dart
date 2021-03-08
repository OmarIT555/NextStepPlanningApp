import 'dart:ui';

class Task  {
  String _name, _dateCreated, _dateDue, _description;
  Color _taskColor;
  bool _isCompleted;

  Task(this._name, this._dateCreated, this._dateDue, this._description,
      this._taskColor, this._isCompleted);

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  get dateCreated => _dateCreated;

  bool get isCompleted => _isCompleted;

  set isCompleted(bool value) {
    _isCompleted = value;
  }

  Color get taskColor => _taskColor;

  set taskColor(Color value) {
    _taskColor = value;
  }

  get description => _description;

  set description(value) {
    _description = value;
  }

  get dateDue => _dateDue;

  set dateDue(value) {
    _dateDue = value;
  }

  set dateCreated(value) {
    _dateCreated = value;
  }
}