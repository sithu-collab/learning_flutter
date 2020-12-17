import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_event/app_state.dart';
import 'package:local_event/model/category.dart';
import 'package:local_event/styleGuide.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;

  CategoryWidget({this.category});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final isSelected = appState.selectedCategoryId == category.categoryId;
    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          appState.updateCategoryId(category.categoryId);
        }
      },
      child: Container(
        margin: EdgeInsets.only(left: 8.0, right: 10.0, bottom: 8.0, top: 8.0),
        height: 90.0,
        width: 90.0,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          border: Border.all(
            color: isSelected ? Colors.white : Color(0x99FFFFFF),
            width: 1.0
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              category.icon,
              color: isSelected ? Theme.of(context).primaryColor : Colors.white,
              size: 32.0,),
            SizedBox(height: 10.0,),
            Text(
              category.name,
              style: isSelected ? selectedCategoryTextStyle : categoryTextStyle,)
          ],
        ),
      ),
    );
  }
}

