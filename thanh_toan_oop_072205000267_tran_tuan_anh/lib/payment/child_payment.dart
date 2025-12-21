import 'package:thanh_toan_oop_072205000267_tran_tuan_anh/payment/abstract_payment.dart';

class PaypalPayment implements Payment {
  final String _clientId = "paypal_id";

  @override
  String get title => "PayPal";

  @override
  String get shortName => "PayPal";

  @override
  void pay(double amount) {
    _connect();
    print("Thanh toán $amount bằng PayPal");
  }

  void _connect() {
    print("Kết nối PayPal...");
  }
}

class GooglePayPayment implements Payment {
  final String _clientId = "gpay_id";

  @override
  String get title => "Google Pay";

  @override
  String get shortName => "GPay";

  @override
  void pay(double amount) {
    _connect();
    print("Thanh toán $amount bằng Google Pay");
  }

  void _connect() {
    print("Kết nối GooglePay...");
  }
}

class ApplePayPayment implements Payment {
  final String _clientId = "apay_id";

  @override
  String get title => "Apple Pay";

  @override
  String get shortName => "APay";

  @override
  void pay(double amount) {
    _connect();
    print("Thanh toán $amount bằng Apple Pay");
  }

  void _connect() {
    print("Kết nối ApplePay...");
  }
}
