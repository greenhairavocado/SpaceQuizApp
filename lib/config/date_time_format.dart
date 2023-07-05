import 'package:intl/intl.dart';

dateConvert(String originalTimeString) {
  DateTime dateTime = DateTime.parse(originalTimeString);
  String formattedDateTime = DateFormat('dd/MM/yyyy h:mm a').format(dateTime);
  return formattedDateTime;
}