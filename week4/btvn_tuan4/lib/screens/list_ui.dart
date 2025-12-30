import 'package:btvn_tuan4/models/ui_item.dart';
import 'package:flutter/material.dart';
import '../models/ui_list_basic_widget.dart';
import '../models/ui_list_input_form_demo.dart';
import '../models/ui_list_layout_scrolling.dart';
import '../models/ui_list_material_components.dart';

class ListUIScreen extends StatelessWidget {
  const ListUIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UI Components List')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text(
              'Basic Widgets',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ...UiListBasicWidget.getItems().map((item) {
              return UI_Item(item: item);
            }),
            SizedBox(height: 20),
            Text(
              'Input Form Demos',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ...UiListInputFormDemo.getItems().map((item) {
              return UI_Item(item: item);
            }),
            SizedBox(height: 20),
            Text(
              'Layout & Scrolling',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ...UiListLayoutScrolling.getItems().map((item) {
              return UI_Item(item: item);
            }),
            SizedBox(height: 20),
            Text(
              'Components',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ...UiListMaterialComponents.getItems().map((item) {
              return UI_Item(item: item);
            }),
          ],
        ),
      ),
    );
  }
}

class UI_Item extends StatelessWidget {
  final UIItem item;
  const UI_Item({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 10,
      ), // Giãn cách giữa các thẻ
      decoration: BoxDecoration(
        color: const Color.fromARGB(122, 65, 149, 218),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(
          item.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        subtitle: Text(item.description),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => item.widget),
          );
        },
      ),
    );
  }
}
