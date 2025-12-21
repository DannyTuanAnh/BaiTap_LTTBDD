import 'package:thanh_toan_oop_072205000267_tran_tuan_anh/payment/abstract_payment.dart';
import 'package:thanh_toan_oop_072205000267_tran_tuan_anh/payment/child_payment.dart';

class PaymentController {
  final List<Payment> payments = [
    PaypalPayment(),
    GooglePayPayment(),
    ApplePayPayment(),
  ];

  Payment? _selectedPayment;

  Payment? get selectedPayment => _selectedPayment;

  void selectPayment(Payment payment) {
    _selectedPayment = payment;
  }

  void pay(double amount) {
    _selectedPayment?.pay(amount);
  }
}
