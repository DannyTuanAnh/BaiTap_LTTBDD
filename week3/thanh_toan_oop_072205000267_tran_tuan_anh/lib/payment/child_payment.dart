import 'package:thanh_toan_oop_072205000267_tran_tuan_anh/payment/abstract_payment.dart';

class PaypalPayment implements Payment {
  final String _titlePrivate = "PayPal";
  final String _titleShortName = "PPal";

  @override
  String get title => _titlePrivate;

  @override
  String get shortName => _titleShortName;

  @override
  void pay(double amount) {
    print("Thanh toán $amount bằng PayPal");
  }
}

class GooglePayPayment implements Payment {
  final String _titlePrivate = "Google Pay";
  final String _titleShortName = "GPay";

  @override
  String get title => _titlePrivate;

  @override
  String get shortName => _titleShortName;

  @override
  void pay(double amount) {
    print("Thanh toán $amount bằng Google Pay");
  }
}

class ApplePayPayment implements Payment {
  final String _titlePrivate = "Apple Pay";
  final String _titleShortName = "APay";

  @override
  String get title => _titlePrivate;

  @override
  String get shortName => _titleShortName;

  @override
  void pay(double amount) {
    print("Thanh toán $amount bằng Apple Pay");
  }
}
