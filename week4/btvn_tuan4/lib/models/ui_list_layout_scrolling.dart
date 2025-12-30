import './ui_item.dart';
import '../demo/layout/grid_view_demo.dart';
import '../demo/layout/single_child_scroll_view_demo.dart';
import '../demo/layout/expanded_demo.dart';
import '../demo/layout/sized_box_demo.dart';

class UiListLayoutScrolling {
  static List<UIItem> getItems() {
    return [
      UIItem(
        title: 'GridView Demo',
        description:
            'GridView dùng để hiển thị danh sách các widget theo dạng lưới',
        widget: GridViewDemo(),
      ),
      UIItem(
        title: 'SingleChildScrollView Demo',
        description: 'SingleChildScrollView để tạo một vùng cuộn',
        widget: SimpleChildScrollViewDemo(),
      ),
      UIItem(
        title: 'SizedBox Demo',
        description: 'SizedBox dùng để tạo khoảng cách giữa các widget',
        widget: SizedBoxDemo(),
      ),
      UIItem(
        title: 'Expanded Demo',
        description:
            'Expanded widget tự động mở rộng để lấp đầy không gian trống trong một hàng hoặc cột.',
        widget: ExpandedDemo(),
      ),
    ];
  }
}
