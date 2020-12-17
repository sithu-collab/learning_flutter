import 'package:flutter/material.dart';

const Color mainColor = Color(0xFF4A4A56);

class SidebarHomePage extends StatefulWidget {
  @override
  _SidebarHomePageState createState() => _SidebarHomePageState();
}

class _SidebarHomePageState extends State<SidebarHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: NestedScrollView( ///CustomScrollView is not ok
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 180.0,
                pinned: true,
                elevation: 5,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text('Toolbar Test', style: TextStyle(color: Colors.white, fontSize: 16.0),),
                  background: Image.asset(
                    'assets/images/Inlay_4.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ];
          },
          body: ListView.separated(
            itemBuilder: (context, index) {
              return Center(child: Text('Hello', style: TextStyle(color: Colors.white),));
            },
          separatorBuilder: (context, index) {
              return Divider(height: 16.0,);
          },
          itemCount: 20)

          ///Tried CustomScrollView to build CollapsingToolbar but it's not ok
          ///but NestedScrollView is fine for me!
//          SliverFillRemaining(
//              child: ListView.separated(itemBuilder: (context, index) {
//                return Card(
//                  elevation: 8,
//                  child: ListTile(
//                    title: Text('Window', style: TextStyle(color: Color(0xFF4A4A56), fontSize: 17.0),),
//                    subtitle: Text('Microsoft', style: TextStyle(color: Colors.grey),),),
//                );
//              },
//                  separatorBuilder: (context, index) {
//                    return Divider(height: 16.0,);
//                  },
//                  itemCount: 10)
//          ),
//            SliverFillRemaining(
//            child: ListView(
//            scrollDirection: Axis.vertical,
//            physics: ClampingScrollPhysics(),
//            children: [
//              Column(
//                children: List<int>.generate(10, (index) => index)
//                    .map((index) => Container(
//                          height: 40,
//                          margin: EdgeInsets.symmetric(vertical: 10),
//                          color: Colors.grey[300],
//                          alignment: Alignment.center,
//                          child: Text('$index item'),
//                        ))
//                    .toList(),
//              ),
//            ],
//          ),
//        ),
        ),
      ),
    );
  }
}
