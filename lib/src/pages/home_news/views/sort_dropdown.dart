import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../controllers/home_news_controller.dart';

class SortDropdown extends StatelessWidget {
  const SortDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeNewsController>(
      id: "SORT_BY",
      builder: (_) => DropdownButton<String>(
        // value: _.blogModel.category,
        value: _.sortBy,
        onChanged: _.changeSortCategory,
        // value: "Popular",
        // onChanged: (s) {},
        items: const [
          DropdownMenuItem(
            value: "popularity",
            child: Text('Popular'),
          ),
          DropdownMenuItem(
            value: "publishedAt",
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
