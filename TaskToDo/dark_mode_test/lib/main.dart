import 'package:dark_mode_test/app_state.dart';
import 'package:dark_mode_test/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => AppState(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Dark Mode',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: Provider.of<AppState>(context).isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
          home: TaskPage(),
        );
      },
    );
  }
}

class TaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.menu,
            )),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Today', style: Theme.of(context).textTheme.headline1,),
                Icon(Icons.add_circle_outline,),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Card(
              color: Theme.of(context).colorScheme.primary,
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              child: ListTile(
                title: Text('Conference Call', style: Theme.of(context).textTheme.bodyText1,),
                subtitle: Text('30 mins', style: Theme.of(context).textTheme.bodyText2,),
                leading: Icon(Icons.phone, color: Theme.of(context).iconTheme.color,),
                trailing: Icon(Icons.check_circle_outline, color: Theme.of(context).colorScheme.secondary,),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dark Mode', style: Theme.of(context).textTheme.bodyText2,),
                Switch(
                  activeColor: Colors.blue,
                  value: Provider.of<AppState>(context).isDarkModeOn,
                  onChanged: (bool value) {
                    Provider.of<AppState>(context, listen: false).updateTheme(value);
                  },

                ),
              ],
            ),

          )
        ],
      ),
    );
  }
}
