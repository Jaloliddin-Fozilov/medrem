import 'package:flutter/material.dart';

import '../models/notification_model.dart';

class NotificationsProvider extends ChangeNotifier {
  List<NotificationModel> _notifications = [
    NotificationModel(
      id: '01',
      title: 'Yodamarin',
      times: [
        DateTime.now(),
      ],
    ),
    NotificationModel(
      id: '02',
      title: 'Slezovit',
      description: 'Och qoringa issiq suv bilan',
      times: [
        DateTime.now(),
        DateTime(2022),
      ],
    ),
  ];

  List<NotificationModel> get notifications => [..._notifications];

  NotificationModel getNotificationById(String id) {
    return _notifications.firstWhere((notification) => notification.id == id);
  }

  void addNotification(NotificationModel notification) {
    _notifications.add(notification);
    notifyListeners();
  }

  void editNotification(NotificationModel notification) {
    final index = _notifications
        .indexWhere((notificat) => notificat.id == notification.id);
    _notifications[index] = notification;
    notifyListeners();
  }

  void removeNotification(String id) {
    _notifications.removeWhere((notificat) => notificat.id == id);
    notifyListeners();
  }
}
