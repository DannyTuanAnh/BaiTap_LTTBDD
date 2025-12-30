import './ui_item.dart';
import '../demo/components/app_bar_demo.dart';
import '../demo/components/elevated_button_demo.dart';
import '../demo/components/text_button_demo.dart';
import '../demo/components/dialog_demo.dart';
import '../demo/components/bottom_navigation_bar_demo.dart';
import '../demo/components/floating_action_button_demo.dart';
import '../demo/components/drawer_demo.dart';

class UiListMaterialComponents {
  static List<UIItem> getItems() {
    return [
      UIItem(
        title: 'AppBar Demo',
        description: 'Giới thiệu AppBar (Thanh tiêu đề của ứng dụng) ',
        widget: AppBarDemo(),
      ),
      UIItem(
        title: 'Elevated Button Demo',
        description: 'Demo ElevatedButton',
        widget: ElevatedButtonDemo(),
      ),
      UIItem(
        title: 'Text Button Demo',
        description: 'Demo TextButton',
        widget: TextButtonDemo(),
      ),
      UIItem(
        title: 'Dialog Demo',
        description: 'Demo cách sử dụng Dialog',
        widget: DialogDemo(),
      ),
      UIItem(
        title: 'Bottom Navigation Bar Demo',
        description: 'Demo cách sử dụng BottomNavigationBar',
        widget: BottomNavigationBarDemo(),
      ),
      UIItem(
        title: 'Floating Action Button Demo',
        description: 'Demo cách sử dụng FloatingActionButton và SnackBar',
        widget: FloatingActionButtonDemo(),
      ),
      UIItem(
        title: 'Drawer Demo',
        description: 'Demo giới thiệu Drawer (menu điều hướng bên cạnh)',
        widget: DrawerDemo(),
      ),
    ];
  }
}
