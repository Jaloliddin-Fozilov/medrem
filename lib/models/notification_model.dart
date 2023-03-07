class NotificationModel {
  final String id;
  final String title;
  final String description;
  final List<DateTime> times;

  NotificationModel({
    required this.id,
    required this.title,
    this.description = '',
    required this.times,
  });
}
