import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../screens/exam_detail_screen.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  const ExamCard({super.key, required this.exam});

  String _formatDateTime(DateTime dt) {
    final d = '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}';
    final t = '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
    return '$d • $t';
  }

  bool get _isPassed => exam.dateTime.isBefore(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final cardColor = _isPassed ? Colors.grey.shade100 : Colors.white;
    final accent = _isPassed ? Colors.grey : Colors.indigo;

    return Card(
      color: cardColor,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.of(context).pushNamed(ExamDetailScreen.routeName, arguments: exam);
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                width: 6,
                height: 56,
                decoration: BoxDecoration(
                  color: accent,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exam.subject,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _isPassed ? Colors.grey[800] : Colors.black),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 16),
                        const SizedBox(width: 6),
                        Text(_formatDateTime(exam.dateTime)),
                        const SizedBox(width: 12),
                        const Icon(Icons.location_on, size: 16),
                        const SizedBox(width: 6),
                        Expanded(child: Text(exam.venues.join(', '), overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(_isPassed ? Icons.check_circle : Icons.schedule, color: accent),
            ],
          ),
        ),
      ),
    );
  }
}