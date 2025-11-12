import 'package:flutter/material.dart';
import '../models/exam.dart';
// import '../data/exam_data.dart';
import '../widgets/exam_card.dart';
import '../data/exam_data.dart' as exams_data;


class HomeScreen extends StatelessWidget {
  static const routeName = '/';
  final String indexNumber;
  const HomeScreen({super.key, required this.indexNumber});

  @override
  Widget build(BuildContext context) {
    // Use the prefixed import to avoid any analyzer ambiguity
    final List<Exam> exams = exams_data.getExam();

    return Scaffold(
      appBar: AppBar(
        title: Text('Распоред за испити - $indexNumber'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (ctx, i) => ExamCard(exam: exams[i]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 64,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.indigo.shade50,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6, offset: const Offset(0, -2)),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  const Icon(Icons.event_note, color: Colors.white),
                  const SizedBox(width: 8),
                  Text(
                    'Вкупно испити: ${exams.length}',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}