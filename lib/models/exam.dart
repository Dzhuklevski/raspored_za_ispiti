class Exam {
final String subject;
final DateTime dateTime;
final List<String> venues;
final String? notes;


Exam({
required this.subject,
required this.dateTime,
required this.venues,
this.notes,
});
}