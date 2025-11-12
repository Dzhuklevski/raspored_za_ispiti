import '../models/exam.dart';

List<Exam> getExam() {
  final exams = <Exam>[
    Exam(
      subject: 'Калкулус 1',
      dateTime: DateTime(2023, 12, 9, 8, 0),
      venues: ['Кабинет 122'],
    ),
    Exam(
      subject: 'Дискретна математика',
      dateTime: DateTime(2023, 12, 12, 10, 0),
      venues: ['Б2.2'],
    ),
    Exam(
      subject: 'Алгоритми и податочни структури',
      dateTime: DateTime(2023, 12, 15, 15, 0),
      venues: ['Кабинет 119'],
    ),
    Exam(
      subject: 'Дизајн на дигитални кола',
      dateTime: DateTime(2023, 12, 26, 12, 30),
      venues: ['112 ФЕИТ'],
    ),
    Exam(
      subject: 'Основи на сајбер безбедност',
      dateTime:  DateTime(2026, 1, 15, 9, 0),
      venues: ['лаб. 138'],
    ),
    Exam(
      subject: 'Структурно програмирање',
      dateTime: DateTime(2025, 12, 15, 10, 0),
      venues: ['АМФ ФИНКИ'],
    ),
    Exam(
      subject: 'Објектно ориентирано програмирање',
      dateTime: DateTime(2025, 12, 22, 17, 30),
      venues: ['Б3.1'],
    ),
    Exam(
      subject: 'Напредно програмирање',
      dateTime: DateTime(2025, 12, 18, 14, 0),
      venues: ['АМФ МФ'],
    ),
    Exam(
      subject: 'Интернет на нештата',
      dateTime: DateTime(2025, 12, 25, 10, 30),
      venues: ['Кабинет 117'],
    ),
    Exam(
      subject: 'Бази на податоци',
      dateTime: DateTime(2025, 12, 23, 16, 0),
      venues: ['АМФ ТМФ'],
    ),
  ];

  exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));
return exams;
}
