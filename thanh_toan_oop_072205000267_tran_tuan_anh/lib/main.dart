import 'package:flutter/material.dart';
import 'package:thanh_toan_oop_072205000267_tran_tuan_anh/controller/controller_state.dart';
import 'package:thanh_toan_oop_072205000267_tran_tuan_anh/widget/item_widget.dart';

void main() {
  runApp(const MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

final controller = PaymentController();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedPayment = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //hiển thị icon ví tiền hoặc tên phương thức đã chọn
          Expanded(
            child: Center(
              child: selectedPayment == -1
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_balance_wallet,
                          size: 80,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Chọn phương thức thanh toán',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.payment,
                            size: 60,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          controller.payments[selectedPayment].title,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Đã chọn',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
            ),
          ),
          // Đường kẻ ngang
          Center(
            child: Container(
              width: 350,
              height: 1,
              color: const Color(0xFF6C6C6C),
            ),
          ),
          // Expanded thứ hai - danh sách các phương thức thanh toán
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 20),
                ...List.generate(controller.payments.length, (index) {
                  final payment = controller.payments[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: PaymentItem(
                      option: PaymentOption(
                        title: payment.title,
                        shortName: payment.shortName,
                      ),
                      isSelected: selectedPayment == index,
                      onTap: () {
                        setState(() {
                          selectedPayment = index;
                          controller.selectPayment(payment);
                        });
                      },
                    ),
                  );
                }),
                const SizedBox(height: 20),
                //chỉ hiển thị nút continue khi đã chọn phương thức thanh toán
                if (selectedPayment != -1)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: 350,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Gọi phương thức thanh toán từ controller thông qua abstract
                          controller.pay(100.0);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Đang xử lý thanh toán bằng ${controller.payments[selectedPayment].title}',
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0083F5),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 4,
                        ),
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
