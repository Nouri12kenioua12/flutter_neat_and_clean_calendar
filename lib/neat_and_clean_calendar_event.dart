import 'package:flutter/material.dart';

enum MultiDaySegement {
  first,
  middle,
  last,
}

class NeatCleanCalendarEvent {
  String type;
  String description;
  Color? color, backgroundColor;
  String? guests;
  String ?title;
  DateTime startTime;
  DateTime endTime;
  bool isAllDay;
  bool isMultiDay;
  MultiDaySegement? multiDaySegement;
  Map<String, dynamic>? metadata;
  String? id;

  NeatCleanCalendarEvent(this.type, {
    this.description = '',
    this.guests,
    this.title,
    required this.startTime,
    required this.endTime,
    this .backgroundColor,
    this.color = Colors.blue,
    this.isAllDay = false,
    this.isMultiDay = false,
    multiDaySegement,
    this.metadata,
    this.id,
  });
}
