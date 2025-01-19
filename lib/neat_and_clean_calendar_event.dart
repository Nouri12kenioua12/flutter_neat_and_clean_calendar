import 'package:flutter/material.dart';

enum MultiDaySegement {
  first,
  middle,
  last,
}

class NeatCleanCalendarEvent {
  String summary;
  String description;
  String location;
  DateTime startTime;
  DateTime endTime;
  Color? color;
  bool isAllDay;
  bool isMultiDay;
  String? url;
  String? guests;
  String ?title;
  MultiDaySegement? multiDaySegement;
  bool isDone;
  Map<String, dynamic>? metadata;
  String? icon;
  bool? wide = false;
  String? id;

  NeatCleanCalendarEvent(this.summary, {
    this.description = '',
    this.location = '',
    this.url,
    this.guests,
    this.title,
    required this.startTime,
    required this.endTime,
    this.color = Colors.blue,
    this.isAllDay = false,
    this.isMultiDay = false,
    this.isDone = false,
    multiDaySegement,
    this.metadata,
    this.icon,
    this.wide,
    this.id,
  });
}
