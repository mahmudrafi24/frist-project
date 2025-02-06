import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frist_project/Utils/AppColors/app_colors.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';

class ExpandableContainer extends StatefulWidget {
  final String title;
  final String description;
  final String expandIcon;
  final String collapseIcon;
  final Color expandedColor1;
  final Color expandedColor2;
  final Color collapsedColor;
  final Color textColor;
  final Color expandedTextColor;
  final bool isTable;
  final String? column1;
  final String? column2;
  final List<List<String>> tableData; // The data for the table

  const ExpandableContainer({
    super.key,
    required this.title,
    required this.description,
    required this.expandIcon,
    required this.collapseIcon,
    required this.expandedColor1,
    required this.collapsedColor,
    required this.textColor,
    required this.expandedTextColor,
    this.isTable = false, // Default is not table format
    this.tableData = const [],
    this.column1,
    this.column2,
    required this.expandedColor2,
  });

  @override
  State createState() => _ExpandableContainerState();
}

class _ExpandableContainerState extends State<ExpandableContainer> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
            decoration: BoxDecoration(
              color:
                  _isExpanded ? widget.expandedColor1 : widget.collapsedColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                CustomText(
                  text: widget.title,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: _isExpanded ? AppColors.white100 : AppColors.black500,
                ),
                // Text(
                //   widget.title,
                //   style: TextStyle(
                //     fontSize: 12,
                //     fontWeight: FontWeight.w500,
                //     color: _isExpanded
                //         ? widget.expandedTextColor
                //         : widget.textColor,
                //   ),
                // ),
                Spacer(),
                SvgPicture.asset(
                  _isExpanded ? widget.collapseIcon : widget.expandIcon,
                ),
              ],
            ),
          ),
        ),
        if (_isExpanded)
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: widget.expandedColor2,
              borderRadius: BorderRadius.circular(5),
            ),
            child: widget.isTable
                ? _buildTable() // If it's a table, build the table widget
                : Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: widget.textColor,
                    ),
                    maxLines: 15,
                    textAlign: TextAlign.start,
                  ),
          ),
      ],
    );
  }

  // Helper function to build the table
  Widget _buildTable() {
    return Table(
      border: TableBorder.all(),
      columnWidths: {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(2),
      },
      children: [
        // Header Row
        TableRow(
          children: [
            TableCell(
                child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                widget.column1 ?? 'Column 1', // Default text if null
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            )),
            TableCell(
                child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                widget.column2 ?? 'Column 2', // Default text if null
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            )),
          ],
        ),
        // Data Rows
        for (var row in widget.tableData)
          TableRow(
            children: row.map((cellData) {
              return TableCell(
                  child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(cellData),
              ));
            }).toList(),
          ),
      ],
    );
  }
}
