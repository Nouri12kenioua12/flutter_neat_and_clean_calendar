// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/date_picker_config.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Clean Calendar Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: CalendarScreen(),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: [
        const Locale('en'),
        const Locale('fr'),
        const Locale('de'),
        const Locale('es'),
        const Locale('it'),
        const Locale('ru'),
      ],
    );
  }
}

class CalendarScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalendarScreenState();
  }
}

class _CalendarScreenState extends State<CalendarScreen> {
  bool showEvents = true;

  List<NeatCleanCalendarEvent> _todaysEvents = [
    NeatCleanCalendarEvent(
      'Event A',
      startTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 0),
      endTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 12, 0),
      description: 'A special event',
      color: Colors.blue[700],
    ),
  ];

  final List<NeatCleanCalendarEvent> _eventList = [
    NeatCleanCalendarEvent(
      'MultiDay Event A',
      description: 'test desc',
      startTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 0),
      endTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day + 2, 12, 0),
      color: Colors.orange,
      backgroundColor: Colors.orange,
      isMultiDay: true,
    ),
    NeatCleanCalendarEvent(
      'Event X',
      description: 'test desc',
      startTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 10, 30),
      endTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 11, 30),
      color: Colors.lightGreen,
      backgroundColor: Colors.green,
      isAllDay: false,
    ),
    NeatCleanCalendarEvent(
      'Allday Event B',
      description: 'test desc',
      startTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day - 2, 14, 30),
      endTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day + 2, 17, 0),
      color: Colors.white,
      backgroundColor: Colors.pink,
      isAllDay: true,
    ),
    NeatCleanCalendarEvent(
      'Normal Event D',
      description: 'test desc',
      startTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 14, 30),
      endTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 17, 0),
      color: Colors.white,
      backgroundColor: Colors.indigo,
    ),
    NeatCleanCalendarEvent(
      title: "case",
      'Normal Event E',
      description: 'test desc',
      startTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 7, 45),
      endTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 9, 0),
      color: Colors.white,
      backgroundColor: Colors.green,
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Force selection of today on first load, so that the list of today's events gets shown.
    _handleNewDate(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day));
  }

  Widget eventCell(BuildContext context, NeatCleanCalendarEvent event,
      String start, String end) {
    return Container(
        padding: EdgeInsets.all(8.0),
        child: Text('Calendar Event: ${event.type} from $start to $end'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Calendar(
          todayColor: Colors.red,

          startOnMonday: true,
          weekDays: ['Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So'],
          eventsList: _eventList,
          isExpandable: true,

          // You can set your own event cell builder function to customize the event cells
          // Try it by uncommenting the line below
          // eventCellBuilder: eventCell,

          // selectedColor: Colors.white,

          selectedTodayColor:Colors.white,
          // todayColor: Colors.red,
          // defaultOutOfMonthDayColor: Colors.grey,
          // defaultDayColor: Colors.black,
          eventColor: Colors.red,
          locale: 'en',

          hideTodayIcon: true,

          isExpanded: true,
          expandableDateFormat: 'EEEE, dd. MMMM yyyy',
          onEventSelected: (value) {},
          onEventLongPressed: (value) {},

          // onMonthChanged: (value) {
          //   print('Month changed $value');
          // },
          onDateSelected: (value) {
            print('Date selected $value');
          },
          onRangeSelected: (value) {
            print('Range selected ${value.from} - ${value.to}');
          },
          datePickerConfig: DatePickerConfig(
            initialDate: DateTime.now(),
          ),
          displayMonthTextStyle: TextStyle(
            color: Colors.black,
          ),
          // eventListBuilder: (BuildContext context, List<NeatCleanCalendarEvent> events) {
          //   return Expanded(
          //     flex: 0,
          //     child: Container(
          //       height: 100,
          //       child: ListView.builder(
          //         itemCount: events.length,
          //         itemBuilder: (BuildContext context, int index) {
          //           return ListTile(
          //             title: Text(events[index].summary),
          //             subtitle: Text(events[index].description),
          //           );
          //         },
          //       ),
          //     ),
          //   );
          // },


          selectedColor: Colors.white,
          defaultDayColor: Colors.black,
          topRowIconColor: Colors.grey,
          datePickerType: DatePickerType.hidden,
          bottomBarTextStyle: TextStyle(color: Colors.white),
          bottomBarArrowColor: Colors.red,
          bottomBarColor: Colors.black,
          dayOfWeekStyle: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w800, fontSize: 11),
          showEventListViewIcon: false,
          showEvents: showEvents,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showEvents = !showEvents;
          });
        },
        child: Icon(showEvents ? Icons.visibility_off : Icons.visibility),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _handleNewDate(date) {
    print('Date selected: $date');
  }
}
