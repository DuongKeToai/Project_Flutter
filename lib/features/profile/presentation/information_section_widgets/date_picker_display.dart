import 'package:flutter/material.dart';

class DatePickerDisplay extends StatelessWidget {
  final void Function()? onTap;
  final DateTime? selectedDate;

  const DatePickerDisplay({super.key, required this.selectedDate, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Text(
              selectedDate == null
                  ? "Chọn thời gian"
                  : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              width: 8,
            ),
            const Icon(Icons.calendar_month, color: Colors.white)
          ],
        ),
      ),
    );
  }
}
