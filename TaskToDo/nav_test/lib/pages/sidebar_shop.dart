import 'package:flutter/material.dart';
import 'package:nav_test/pages/sidebar_home.dart';
import 'package:nav_test/pages/silver_appbar_delegate.dart';


class SidebarShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        bottom: TabBar(
//          tabs: [
//            Tab(text: 'Cat',),
//            Tab(text: 'Dog',),
//            Tab(text: 'Monkey',),
//          ],
//        ),
//      ),
//      body: DefaultTabController(
//        length: 3,
//        child: TabBarView(
//          children: [
//            Image(image: AssetImage('assets/images/Inlay_1.jpg'),),
//            Image(image: AssetImage('assets/images/Inlay_2.jpg'),),
//            Image(image: AssetImage('assets/images/Inlay_3.jpg'),),
//          ],
//
//        ),
//      ),



        body: Container(
          color: mainColor,
          child: DefaultTabController(
            length: 3,
            child: NestedScrollView( ///CustomScrollView is not ok for me so I used NestedScrollView
              body: Center(
                child: Text('Hello guy',  style: TextStyle(
                  color: Colors.white,
                ),),
              ),
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 200.0,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text('Collapsing Toolbar', style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0
                      ),),
                      background: Image.asset('assets/images/Inlay_5.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
//                bottom: TabBar(
//                  labelColor: Colors.black87,
//                  labelPadding: EdgeInsets.all(10.0),
//                  unselectedLabelColor: Colors.grey,
//                  tabs: [
//                    Tab(text: 'Food', icon: Icon(Icons.fastfood),),
//                    Tab(text: 'Drink', icon: Icon(Icons.local_drink),),
//                    Tab(text: 'Feelings', icon: Icon(Icons.insert_emoticon),)
//                  ],
//                ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: SilverAppbarDelegate(
                      TabBar(
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(text: 'Food',  icon: Icon(Icons.fastfood, size: 20.0, color: Colors.white,),),
                          Tab(text: 'Drink', icon: Icon(Icons.local_drink, size: 20.0, color: Colors.white),),
                          Tab(text: 'Feelings', icon: Icon(Icons.insert_emoticon, size: 20.0, color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
                ];
              },
            ),
          ),
        )
    );
  }
}
