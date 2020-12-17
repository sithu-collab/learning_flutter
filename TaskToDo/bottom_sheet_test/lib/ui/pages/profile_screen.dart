import 'package:animations/animations.dart';
import 'package:bottom_sheet_test/model/meal.dart';
import 'package:bottom_sheet_test/ui/pages/meal_detail_screen.dart';
import 'package:bottom_sheet_test/ui/pages/workout_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final today = DateTime.now();
    return Scaffold(
      backgroundColor: Color(0xFFE9E9E9),

//      bottomNavigationBar: ClipRRect(
//      borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
//      child: BottomNavigationBar(
//        iconSize: 25.0,
//        currentIndex: 0,
//        selectedIconTheme: IconThemeData(color: Color(0xFF200087)),
//        unselectedIconTheme: IconThemeData(color: Colors.black12),
//        items: [
//          BottomNavigationBarItem(
//              icon: Icon(Icons.home), title: Text('Home')),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.search), title: Text('Search')),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.settings), title: Text('Settings')),
//        ],
//      ),
//    ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            height: height * 0.35,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(40.0)),
              child: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text('Date, Year'),
                          subtitle: Text(
                            'Hello, David',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                          trailing: ClipOval(
                              child: Image.asset(
                            'assets/images/Inlay_2.jpg',
                          )),
                        ),
                        Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                                child: _RadialProgress(
                                  width: width * 0.3,
                                  height: height * 0.2,
                                  progress: 0.7,
                                )),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                _IngredientProgress(
                                  ingredient: 'proteins',
                                  progressColor: Colors.green,
                                  progress: 0.6,
                                  leftAmount: 70,
                                  width: width * 0.4,
                                ),
                                SizedBox(height: 8.0,),
                                _IngredientProgress(
                                  ingredient: 'carbs',
                                  progressColor: Colors.deepPurple,
                                  progress: 0.4,
                                  leftAmount: 48,
                                  width: width * 0.4,
                                ),
                                SizedBox(height: 8.0,),
                                _IngredientProgress(
                                  ingredient: 'fats',
                                  progressColor: Colors.red,
                                  progress: 0.3,
                                  leftAmount: 30,
                                  width: width * 0.4,
                                )
                              ],
                            )

                          ],

                        ),

                      ],
                    )),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: height * 0.36,
            child: Container(
              height: height * 0.63,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: 10.0, left: 16.0),
                      child: Text(
                        'MEALS FOR TODAY',
                        style: const TextStyle(
                            color: Color(0xff200087),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      )),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15.0,
                          ),
                          for (int i = 0; i < meals.length; i++)
                            _MealCard(
                              meal: meals[i],
                            )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: OpenContainer(
                      openBuilder: (context, _) {
                        return WorkoutScreen();
                      },
                      closedBuilder: (BuildContext context, void openContainer) {
                        return GestureDetector(
                          onTap: () => openContainer,
                          child: Container(
                            width: width,
                            margin:
                            EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.deepPurple,
                                      Color(0xff200087),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.bottomRight
                                )
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text('YOUR NEXT WORKOUT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14.0),),
                                  SizedBox(height: 5.0,),
                                  Text('Upper Body', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 23.0),),
                                  SizedBox(height: 10.0,),
                                  Row(
                                    children: [
                                      DetailPage(imgPath: 'assets/images/Inlay_1.jpg',),
                                      SizedBox(width: 20.0,),
                                      DetailPage(imgPath: 'assets/images/Inlay_2.jpg',),
                                      SizedBox(width: 20.0,),
                                      DetailPage(imgPath: 'assets/images/Inlay_3.jpg',),

                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _IngredientProgress extends StatelessWidget {
  final String ingredient;
  final Color progressColor;
  final double progress, width;
  final int leftAmount;

  _IngredientProgress({this.ingredient, this.progressColor, this.progress,
      this.width, this.leftAmount});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(ingredient.toUpperCase(), style: TextStyle(color: Colors.black,),),
        Row(
          children: [
            Stack(
              children: [
                Container(
                  height: 8.0,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                Container(
                  height: 8.0,
                  width: width * progress,
                  decoration: BoxDecoration(
                    color: progressColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ],
            ),
            SizedBox(width: 8.0,),
            Text('${leftAmount}g left', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),)
          ],

        ),
      ],
    );
  }
}


class DetailPage extends StatelessWidget {
  final String imgPath;

  DetailPage({this.imgPath});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 70.0,
      width: 70.0,
      decoration: BoxDecoration(
          color: Colors.blue,
          border: Border.all(
              width: 1.0,
              color: Colors.white24
          ),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          image: DecorationImage(
              image: AssetImage('assets/images/Inlay_1.jpg', ),
              fit: BoxFit.cover
          )
      ),

    );
  }
}


class _RadialProgress extends StatelessWidget {
  final double width, height, progress;

  const _RadialProgress({
    @required this.width,
    @required this.height,
    @required this.progress
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RadialPainter(progress: progress),
      child: Container(
        width: width,
        height: height,
        child: Center(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '1731', style: TextStyle(color: Color(0xff200087), fontSize: 20.0, fontWeight: FontWeight.w700),
                ),
                TextSpan(text: '\n'),
                TextSpan(
                  text: 'kcal left', style: TextStyle(color: Color(0xff200087), fontWeight: FontWeight.w600, fontSize: 16.0)
                )
              ]
            ),
          ),
        )
      ),
    );
  }
}

class _RadialPainter extends CustomPainter {
  final double progress;

  _RadialPainter({this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 7
      ..color = Color(0xff200087)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    Offset center = Offset(size.width / 2, size.height / 2);
    double relativeProgress = 360 * progress;
    // canvas.drawCircle(center, size.width/ 2, paint);
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90),
        math.radians(-relativeProgress),
        false,
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _MealCard extends StatelessWidget {
  final Meal meal;

  const _MealCard({
    @required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      openBuilder: (context, _) {
        return MealDetailScreen(meal: meal,);
      },
      closedBuilder: (BuildContext context, void openContainer) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => MealDetailScreen(meal: meal,)
            ));
          },
          child: Container(
            margin: EdgeInsets.only(right: 20.0, bottom: 5.0),
            child: Material(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              elevation: 4.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        child: Image.asset(
                          meal.imgPath,
                          width: 135.0,
                          fit: BoxFit.fill,
                        )),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 7.0, bottom: 7.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            meal.mealTime,
                            style: TextStyle(
                                color: Colors.grey, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            meal.name,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 17.0),
                          ),
                          Text(
                            '${meal.kcal} kcal',
                            style: TextStyle(
                                color: Colors.grey, fontWeight: FontWeight.w500),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '${meal.timeTaken} mins',
                                style: TextStyle(
                                    color: Colors.grey, fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
