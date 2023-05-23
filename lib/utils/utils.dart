import 'package:intl/intl.dart';

class Utils {
// Sắp Xếp Object để đồng bộ giữa client và server
  Map<String, dynamic> sortKeyInJson(Map<String, dynamic> json) {
    return Map.fromEntries(json.entries.toList()..sort((e1, e2) => e1.key.compareTo(e2.key)));
  }

  static String moneyFormat(double money) {
    return NumberFormat('###,###.###').format(money);
  }

  String convertStringDate(String date) {
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('dd/MM/yyyy');
    var outputDate = outputFormat.format(inputDate);
    return outputDate.toString();
  }

  String convertDateSytem(String date) {
    DateTime parseDate = DateFormat('dd/MM/yyyy').parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat("yyyy-MM-dd'T'00:00:00+00:00");
    var outputDate = outputFormat.format(inputDate);
    return outputDate.toString();
  }

  String convertDateToString(DateTime date) {
    var outputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    var outputDate = outputFormat.format(date);
    return outputDate.toString();
  }

  String convertDate(DateTime date) {
    var outputFormat = DateFormat('dd/MM/yyyy');
    var outputDate = outputFormat.format(date);
    return outputDate.toString();
  }

  static bool isNullOrEmpty(dynamic obj) => obj == '' || obj == null || (((obj is String && obj.toLowerCase() == 'null') || obj is List || obj is Map) && obj.isEmpty);
}
