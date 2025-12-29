import 'package:flutter/material.dart';
import 'package:thanh_toan_oop_072205000267_tran_tuan_anh/widget/checked_widget.dart';

class PaymentOption {
  final String title;
  final String shortName;

  const PaymentOption({required this.title, required this.shortName});
}

class PaymentItem extends StatelessWidget {
  final PaymentOption option;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentItem({
    super.key,
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 350,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0083F5).withOpacity(0.2),
              blurRadius: 5,
              offset: Offset.zero,
              spreadRadius: 2,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            CheckedCircle(isSelected: isSelected),
            const SizedBox(width: 16),
            Text(
              option.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Text(
              option.shortName,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
