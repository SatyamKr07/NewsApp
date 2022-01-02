import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:news_app/src/controllers/home_news_controller.dart';

class SortDropdown extends StatelessWidget {
  const SortDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeNewsController>(
      id: "FILTER_CATEGORY_DROPDOWN",
      builder: (_) => DropdownButton<String>(
        // value: _.blogModel.category,
        // value: _.filterCategory,
        // onChanged: _.changeFilter,
        value: "Popular",
        onChanged: (s) {},
        items: const [
          DropdownMenuItem(
            value: "Popular",
            child: Text('Popular'),
          ),
          DropdownMenuItem(
            value: "Newest",
            child: Text('Newest'),
          ),
          DropdownMenuItem(
            value: "Oldest",
            child: Text('Oldest'),
          ),
        ],
      ),
    );
  }
}
