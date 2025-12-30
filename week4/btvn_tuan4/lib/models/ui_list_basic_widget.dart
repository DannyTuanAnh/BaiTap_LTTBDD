import './ui_item.dart';
import '../screens/detail_ui.dart';
import '../demo/basic_widgets/text_demo.dart';
import '../demo/basic_widgets/image_demo.dart';
import '../demo/basic_widgets/container_demo.dart';
import '../demo/basic_widgets/row_column_demo.dart';
import '../demo/basic_widgets/stack_demo.dart';
import '../demo/basic_widgets/padding_center_demo.dart';

class UiListBasicWidget {
  static List<UIItem> getItems() {
    return [
      UIItem(
        title: 'Text Widget',
        description: 'A widget to display text',
        widget: DetailUIScreen(
          title: 'Text Widget Demo',
          demo: TextDemo(), // Replace with actual text widget demo
        ),
      ),
      UIItem(
        title: 'Image Widget',
        description: 'A widget to display images',
        widget: DetailUIScreen(
          title: 'Image Widget Demo',
          demo: ImageDemo(), // Replace with actual image widget demo
        ),
      ),
      UIItem(
        title: 'Container Widget',
        description: 'A widget to contain other widgets',
        widget: DetailUIScreen(
          title: 'Container Widget Demo',
          demo: ContainerDemo(), // Replace with actual container widget demo
        ),
      ),
      UIItem(
        title: 'Row and Column Widgets',
        description:
            'Widgets to arrange children in horizontal and vertical layouts',
        widget: DetailUIScreen(
          title: 'Row and Column Widget Demo',
          demo:
              RowColumnDemo(), // Replace with actual row and column widget demo
        ),
      ),
      UIItem(
        title: 'Stack Widget',
        description: 'A widget to overlay children on top of each other',
        widget: DetailUIScreen(
          title: 'Stack Widget Demo',
          demo: StackDemo(), // Replace with actual stack widget demo
        ),
      ),
      UIItem(
        title: 'Padding and Center Widgets',
        description: 'Widgets to add padding around children and center them',
        widget: DetailUIScreen(
          title: 'Padding and Center Widget Demo',
          demo:
              PaddingCenterDemo(), // Replace with actual padding and center widget demo
        ),
      ),
    ];
  }
}
