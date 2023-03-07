import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medrem/widgets/custom_button.dart';
import 'package:provider/provider.dart';

import '../provider/notifications_provider.dart';
import '../services/tab_indicator.dart';
import '../widgets/home_categories.dart';
import '../widgets/home_diseases.dart';
import '../widgets/home_empty.dart';
import '../widgets/home_notification_item.dart';
import '../widgets/widget_title.dart';
import 'add_notification.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationsProvider = Provider.of<NotificationsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: false,
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Hayrli kun,\n',
                style: TextStyle(
                  color: Color(0xff424259),
                  fontSize: 20.0,
                ),
              ),
              TextSpan(
                text: 'Ahmad!',
                style: TextStyle(
                  color: Color(0xff20202F),
                  fontSize: 24.0,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/notification.svg'),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  labelText: 'Shifokorlani qidiring',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xff64637A),
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            const WidgetTitle(title: 'Ommabop bo’limlar'),
            const HomeCategories(),
            const SizedBox(height: 16),
            const WidgetTitle(title: 'Sizni nima bezovta qilayapti?'),
            const HomeDiseases(),
            const WidgetTitle(title: 'Dorilar eslatmasi'),
            notificationsProvider.notifications.isEmpty
                ? const HomeEmpty()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: notificationsProvider.notifications.length,
                      itemBuilder: (ctx, index) {
                        return HomeNotificationItem(
                          id: notificationsProvider.notifications[index].id,
                        );
                      },
                    ),
                  ),
            if (notificationsProvider.notifications.isNotEmpty)
              CustomButton(
                title: 'Qo’shish',
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => AddNotification())),
                icon: Icons.add,
                color: Colors.black,
                backgroundColor: const Color(0xffF1F1F3),
                size: const Size(double.infinity, 50),
              ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TabIndicators(
              activeIdx: 0,
              activeColor: Theme.of(context).primaryColor,
              numTabs: 3,
              padding: 35,
              height: 3,
            ),
            BottomNavigationBar(
              backgroundColor: Colors.white,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/home.svg'),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/chats.svg',
                  ),
                  label: 'Chats',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/profile.svg',
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
