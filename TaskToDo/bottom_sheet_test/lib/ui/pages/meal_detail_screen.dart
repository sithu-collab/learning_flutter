import 'package:bottom_sheet_test/model/meal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MealDetailScreen extends StatelessWidget {
  final Meal meal;

  const MealDetailScreen({Key key, this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe9e9e9),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xff200087),
            expandedHeight: 250,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(40.0)),
                  child: Image.asset(meal.imgPath, fit: BoxFit.cover,)),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 10.0,),
                ListTile(
                  title: Text(
                    meal.mealTime.toUpperCase(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    meal.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 10.0,),
                          Text(
                            '${meal.kcal} kcal',
                            style: TextStyle(color: Colors.black45, fontSize: 14.0),
                          ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Colors.grey,
                            size: 23.0,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            '${meal.timeTaken} mins',
                            style: TextStyle(color: Colors.black45, fontSize: 14.0),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.0,),
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'INGREDIENTS',
                    style: TextStyle(
                        color: Colors .black87,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: 8.0,),
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for(int i = 0; i < meal.ingredients.length; i++)
                        Text('${meal.ingredients[i]}', style: TextStyle(color: Colors.black87, fontSize: 14.0, fontWeight: FontWeight.w400),),
                    ],
                  ),
                ),
                SizedBox(height: 10.0,),

                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                  child: Text(
                    meal.preparation,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ]
            ),
          )
        ],
      ),
    );
  }

}
