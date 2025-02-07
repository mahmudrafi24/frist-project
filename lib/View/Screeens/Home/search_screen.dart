import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frist_project/Utils/StaticString/static_string.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import 'package:frist_project/View/Widgets/CustomTextField/custome_text_field.dart';

import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/AppIcons/app_icons.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> recentSearch = [
    AppString.recentsearch1,
    AppString.recentsearch2,
    AppString.recentsearch3
  ];
  void _onSearchSubmitted(String query) {
    if (query.isNotEmpty && recentSearch.contains(query)) {
      setState(() {
        recentSearch.insert(0, query);
      });
    }
  }


  void _removeSearchItem(int index) {
    setState(() {
      recentSearch.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        /// App Bar for all the pages
        appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          title: SvgPicture.asset(AppIcons.mainIcon),
          centerTitle: true,
          actions: [
            IconButton(
              icon: SvgPicture.asset(AppIcons.notification),
              onPressed: () {},
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white100,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      color: AppColors.black50,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CustomTextField(
                      textEditingController: _searchController,
                      hintText: AppString.adulthealth,
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: AppColors.white700,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _onSearchSubmitted(_searchController.text);
                      },
                      icon: SvgPicture.asset(AppIcons.serachResult),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: AppString.recentsearch,
                    fontSize: 16,
                    color: AppColors.white700,
                    fontWeight: FontWeight.w600,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {},
                          child: CustomText(
                            text: "See All",
                            fontSize: 12,
                            color: AppColors.blue500,
                          )),
                      SizedBox(
                        width: 2,
                      ),
                      SvgPicture.asset(AppIcons.forward),
                    ],
                  ),
                ],
              ),

              /// Recent Search Results
              // Recent Search List
              Expanded(
                  child: ListView.builder(
                itemCount: recentSearch.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(recentSearch[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.close, color: Colors.grey),
                      onPressed: () => _removeSearchItem(index),
                    ),
                  );
                },
              ))
            ],
          ),
        ));
  }
}
