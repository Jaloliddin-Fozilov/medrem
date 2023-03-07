import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../provider/notifications_provider.dart';
import '../screens/add_notification.dart';

class HomeNotificationItem extends StatelessWidget {
  const HomeNotificationItem({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    final notificationProvider = Provider.of<NotificationsProvider>(context);
    final notification = notificationProvider.getNotificationById(id);
    String timeRanges = '';

    notification.times.forEach((time) {
      int index = notification.times.indexOf(time);

      String formattedTime = DateFormat('HH:mm').format(time);

      String timeRange = formattedTime;

      if (index == 0) {
        timeRanges = timeRange;
      } else {
        timeRanges += ' • ' + timeRange;
      }
    });
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.title,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              if (notification.description.isNotEmpty)
                Text(
                  notification.description,
                  style: const TextStyle(color: Colors.grey),
                ),
              if (notification.description.isNotEmpty)
                const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/notification.svg',
                    width: 25,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    timeRanges,
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => AddNotification(
                          id: notification.id,
                        ))),
                child: Image.asset(
                  'assets/edit.png',
                  width: 45,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => notificationProvider.removeNotification(id),
                child: Image.asset(
                  'assets/delete.png',
                  width: 45,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
