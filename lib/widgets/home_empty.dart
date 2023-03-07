import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:medrem/screens/add_notification.dart';
import 'package:medrem/widgets/custom_button.dart';

class HomeEmpty extends StatelessWidget {
  const HomeEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: DottedBorder(
        color: Colors.grey,
        strokeWidth: 1,
        borderType: BorderType.RRect,
        dashPattern: const [
          9,
          9,
        ],
        radius: const Radius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/empty.png',
                width: 220,
              ),
              const SizedBox(height: 16),
              const Text(
                'Dori eslatmalari yo’q',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              CustomButton(
                title: 'Qo’shish',
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => AddNotification())),
                icon: Icons.add,
                color: Colors.black,
                backgroundColor: const Color(0xffF1F1F3),
                size: const Size(double.infinity, 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
