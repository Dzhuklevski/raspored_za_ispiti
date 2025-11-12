import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/exam_detail_screen.dart';
import 'models/exam.dart';
import 'data/exam_data.dart';

const String indexNumber = '215010';

void main() {
  runApp(const ExamScheduleApp());
}

class ExamScheduleApp extends StatelessWidget {
  const ExamScheduleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam Schedule',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(indexNumber: indexNumber),
        ExamDetailScreen.routeName: (ctx) => ExamDetailScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == ExamDetailScreen.routeName) {
          final exam = settings.arguments as Exam;
          return MaterialPageRoute(
            builder: (ctx) => ExamDetailScreen(exam: exam),
            settings: settings,
          );
        }
        return null;
      },
    );
  }
}
