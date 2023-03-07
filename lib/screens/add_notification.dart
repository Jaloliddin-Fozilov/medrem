import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medrem/widgets/custom_button.dart';
import 'package:provider/provider.dart';

import '../models/notification_model.dart';
import '../provider/notifications_provider.dart';
import '../services/theme.dart';

class AddNotification extends StatefulWidget {
  String? id;
  AddNotification({
    super.key,
    this.id,
  });

  @override
  State<AddNotification> createState() => _AddNotificationState();
}

class _AddNotificationState extends State<AddNotification> {
  final _formKey = GlobalKey<FormState>();
  NotificationModel notificationModel = NotificationModel(
    id: UniqueKey().toString(),
    title: '',
    description: '',
    times: [DateTime.now()],
  );
  @override
  void initState() {
    final notificationProvider =
        Provider.of<NotificationsProvider>(context, listen: false);

    if (widget.id != null) {
      notificationModel = notificationProvider.getNotificationById(widget.id!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final notificationProvider =
        Provider.of<NotificationsProvider>(context, listen: false);
    void _submit() {
      _formKey.currentState!.save();
      if (_formKey.currentState!.validate()) {
        if (widget.id != null) {
          notificationProvider.editNotification(notificationModel);
        } else {
          notificationProvider.addNotification(notificationModel);
        }
        Navigator.of(context).pop();
      }
    }

    void _editTime(int index) async {
      DateTime? dateTime;
      await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      ).then(
        (value) {
          print(value);
          if (value != null) {
            dateTime = DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
              value.hour,
              value.minute,
            );
          }
        },
      );
      setState(() {
        notificationModel.times[index] = dateTime ?? DateTime.now();
      });
    }

    void _addTime() {
      notificationModel.times.add(DateTime.now());
      _editTime(notificationModel.times.length - 1);
    }

    void _removeTime(int index) {
      setState(() {
        notificationModel.times.removeAt(index);
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: textColor,
        centerTitle: false,
        title: Text(widget.id != null
            ? 'Dori eslatmasi o’zgartirish'
            : 'Dori eslatmasi qo’shish'),
        actions: [
          IconButton(
            onPressed: () => _submit(),
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Dori nomi'),
                const SizedBox(height: 10),
                TextFormField(
                    initialValue: notificationModel.title,
                    decoration: InputDecoration(
                      hintText: 'Dori nomini kiriting',
                      filled: true,
                      fillColor: const Color(0xffFAF9FA),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xff000000),
                          width: 2,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        notificationModel = NotificationModel(
                          id: notificationModel.id,
                          title: value,
                          description: notificationModel.description,
                          times: notificationModel.times,
                        );
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Dori nomi kiriting';
                      }
                    }),
                const SizedBox(height: 20),
                const Text('Qo’shimcha ma’lumot (ixtiyoriy)'),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffFAF9FA),
                    hintText: 'Masalan “och qoringa issiq suv bilan”',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color(0xff000000),
                        width: 2,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      notificationModel = NotificationModel(
                        id: notificationModel.id,
                        title: notificationModel.title,
                        description: value,
                        times: notificationModel.times,
                      );
                    });
                  },
                  initialValue: notificationModel.description,
                  maxLines: 3,
                  buildCounter: (context,
                      {required currentLength, required isFocused, maxLength}) {
                    return Container(
                      transform:
                          Matrix4.translationValues(0, -kToolbarHeight + 20, 0),
                      child: Text("$currentLength/$maxLength"),
                    );
                  },
                  maxLength: 80,
                ),
                const Divider(),
                const SizedBox(height: 10),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: notificationModel.times.length,
                  itemBuilder: (ctx, i) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text('Eslatmalar vaqti #${i + 1}'),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () => _editTime(i),
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.all(10),
                                height: 50,
                                width: MediaQuery.of(context).size.width -
                                    (i > 0 ? 92 : 32),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xff000000),
                                      width: 0.5),
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffFAF9FA),
                                ),
                                child: Text(
                                  DateFormat('HH:mm')
                                      .format(notificationModel.times[i]),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              if (i > 0)
                                GestureDetector(
                                  onTap: () {
                                    _removeTime(i);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: Image.asset(
                                      'assets/delete.png',
                                      width: 50,
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  title: 'Yana eslatma vaqti qo’shish',
                  onPressed: () => _addTime(),
                  icon: Icons.add,
                  color: Colors.black,
                  backgroundColor: const Color(0xffF1F1F3),
                  size: const Size(double.infinity, 50),
                  padding: 0,
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: CustomButton(
        title: widget.id != null ? 'O’zgarishlarni saqlash' : 'Qo’shish',
        onPressed: () => _submit(),
        icon: widget.id != null ? Icons.done : Icons.add,
        color: Colors.white,
        backgroundColor: const Color(0xff2689B0),
        overlayColor: const Color.fromARGB(255, 25, 107, 139),
        size: const Size(double.infinity, 50),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
