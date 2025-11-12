import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  static const routeName = '/detail';
  final Exam? exam;

  const ExamDetailScreen({super.key, this.exam});

  String _formatDateTime(DateTime dt) {
    final d = '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}';
    final t = '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
    return '$d • $t';
  }

  String _timeLeft(DateTime dt) {
    final now = DateTime.now();
    final diff = dt.difference(now);
    if (diff.isNegative) {
      final past = now.difference(dt);
      final days = past.inDays;
      final hours = past.inHours - days * 24;
      return 'Passed ${days} days, ${hours} hours ago';
    }
    final days = diff.inDays;
    final hours = diff.inHours - days * 24;
    return '${days} дена, ${hours} часа';
  }

  @override
  Widget build(BuildContext context) {
    final Exam examArg = exam ?? ModalRoute.of(context)!.settings.arguments as Exam;
    final isPassed = examArg.dateTime.isBefore(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text(examArg.subject),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(isPassed ? Icons.check_circle : Icons.schedule, size: 28),
                        const SizedBox(width: 12),
                        Text(
                          examArg.subject,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today),
                        const SizedBox(width: 8),
                        Text(_formatDateTime(examArg.dateTime)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.location_on),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: examArg.venues.map((v) => Text('• $v')).toList(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    if (examArg.notes != null) ...[
                      const Divider(),
                      Text('Notes: ${examArg.notes}'),
                    ],
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(Icons.timer),
                        const SizedBox(width: 8),
                        Text(isPassed ? 'Испитот е завршен' : 'Преостанато време: ${_timeLeft(examArg.dateTime)}'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}