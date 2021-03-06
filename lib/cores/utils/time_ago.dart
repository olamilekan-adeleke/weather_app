import 'package:intl/intl.dart';

String displayTimeAgo(
  int dt, {
  bool numericDates = false,
}) {
  final DateTime date = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
  final date2 = DateTime.now();
  final difference = date2.difference(date);

  if ((difference.inDays / 365).floor() >= 2) {
    return '${(difference.inDays / 365).floor()} years ago';
  } else if ((difference.inDays / 365).floor() >= 1) {
    return (numericDates) ? '1 year ago' : 'Last year';
  } else if ((difference.inDays / 30).floor() >= 2) {
    return '${(difference.inDays / 365).floor()} months ago';
  } else if ((difference.inDays / 30).floor() >= 1) {
    return (numericDates) ? '1 month ago' : 'Last month';
  } else if ((difference.inDays / 7).floor() >= 2) {
    return '${(difference.inDays / 7).floor()} weeks ago';
  } else if ((difference.inDays / 7).floor() >= 1) {
    return (numericDates) ? '1 week ago' : 'Last week';
  } else if (difference.inDays >= 2) {
    return '${difference.inDays} days ago';
  } else if (difference.inDays >= 1) {
    return (numericDates) ? '1 day ago' : 'Yesterday';
  } else if (difference.inHours >= 2) {
    return '${difference.inHours} hours ago';
  } else if (difference.inHours >= 1) {
    return (numericDates) ? '1 hour ago' : 'An hour ago';
  } else if (difference.inMinutes >= 2) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inMinutes >= 1) {
    return (numericDates) ? '1 minute ago' : 'A minute ago';
  } else if (difference.inSeconds >= 3) {
    return '${difference.inSeconds} seconds ago';
  } else {
    return '${date.hour < 10 ? '0${date.hour}' : date.hour}:${date.minute < 10 ? '0${date.minute}' : date.minute}';
  }
}

String formatDate(int timestamp) {
  final DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  String formatter = DateFormat("MMMEd").format(date);

  return formatter;
}

String formatDateWithoutDay(int timestamp) {
  final DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  String formatter = DateFormat("MMMEd").format(date);

  return formatter;
}

String formatTime(int timestamp) {
  final DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  String formatter = DateFormat("jm").format(date);

  return formatter;
}
