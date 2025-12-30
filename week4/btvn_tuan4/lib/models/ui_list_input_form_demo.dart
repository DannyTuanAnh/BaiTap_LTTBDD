import '../demo/input_form/text_field_demo.dart';
import '../demo/input_form/checkbox_demo.dart';
import '../demo/input_form/radio_demo.dart';
import '../demo/input_form/switch_demo.dart';
import '../demo/input_form/password_field_demo.dart';
import './ui_item.dart';

class UiListInputFormDemo {
  static List<UIItem> getItems() {
    return [
      UIItem(
        title: 'Basic Input Form',
        description: 'Demo text field input form đơn giản',
        widget: TextFieldDemo(),
      ),
      UIItem(
        title: 'Checkbox Input Form',
        description:
            'Cho phép người dùng xác nhận, đồng ý hoặc lựa chọn nhiều giá trị',
        widget: CheckboxDemo(),
      ),
      UIItem(
        title: 'Radio Button Input Form',
        description:
            'Người dùng chỉ đc chọn một phương án trong nhiều lựa chọn',
        widget: RadioDemo(),
      ),
      UIItem(
        title: 'Switch Input Form',
        description: 'Cho phép người dùng chuyển đổi giữa hai trạng thái',
        widget: SwitchDemo(),
      ),
      UIItem(
        title: 'Password Input Form',
        description: 'Demo nhập password với TextField và obscureText',
        widget: PasswordFieldDemo(),
      ),
    ];
  }
}
