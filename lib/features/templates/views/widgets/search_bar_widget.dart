import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          controller: controller,
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
          ),
          elevation: WidgetStatePropertyAll(0),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          hintText: 'Search your template',
          hintStyle: WidgetStateProperty.all(
            TextStyle(
              color: Colors.grey[500], 
              fontSize: 15.sp,
            ),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
              side: BorderSide(color: Colors.grey[300]!, width: 1.5),
            ),
          ),
          onTap: () => controller.openView(),
          onChanged: (_) => controller.openView(),
          leading: Icon(Icons.search, color: Colors.grey[500], size: 30),
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(5, (int index) {
          final String item = 'item $index';
          return ListTile(
            title: Text(item),
            onTap: () => setState(() => controller.closeView(item)),
          );
        });
      },
    );
  }
}
