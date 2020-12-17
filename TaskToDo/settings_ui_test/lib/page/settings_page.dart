import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:settings_ui_test/app_state/app_state.dart';
import 'package:settings_ui_test/page/language_page.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool lockInBackground = true;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: 'Common',
            tiles: [
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading: Icon(Icons.language),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => LanguagePage()
                  ));
                },
              ),
              SettingsTile(
                title: 'Environment',
                subtitle: 'Production',
                leading: Icon(Icons.cloud_queue),
                onTap: () => print("Environment"),
              ),
            ],
          ),
          SettingsSection(
            title: 'Account',
            tiles: [
              SettingsTile(
                title: 'Phone number',
                leading: Icon(Icons.phone),
              ),
              SettingsTile(
                title: 'Email',
                leading: Icon(Icons.email),
              ),
              SettingsTile(
                title: 'Sign out',
                leading: Icon(Icons.exit_to_app),
              ),
            ],
          ),
          SettingsSection(
            title: 'Security',
            tiles: [
              SettingsTile.switchTile(
                title: 'Lock app in background',
                leading: Icon(Icons.phonelink_lock),
                switchValue: lockInBackground,
                onToggle: (bool value) {
                  setState(() {
                    lockInBackground = value;
                    notificationsEnabled = value;
                  });
                },
              ),
              SettingsTile.switchTile(
                  title: 'Use Fingerprint',
                  leading: Icon(Icons.fingerprint),
                  onToggle: (bool value) {},
                  switchValue: false),
              SettingsTile.switchTile(
                  title: 'Change Password',
                  leading: Icon(Icons.lock),
                  onToggle: (bool value) {},
                  switchValue: true),
              SettingsTile.switchTile(
                  title: 'Enable notifications',
                  leading: Icon(Icons.notifications),
                  enabled: notificationsEnabled,
                  onToggle: (bool value) {},
                  switchValue: true
              ),
              SettingsTile.switchTile(
                  title: 'Dark Mode',
                  leading: Icon(Icons.brightness_medium),
                  onToggle: (bool value) {
                    Provider.of<AppState>(context, listen: false).updateTheme(value);
                  },
                  switchValue: Provider.of<AppState>(context).isDarkModeOn)
            ],
          ),
          SettingsSection(
            title: 'Misc',
            tiles: [
              SettingsTile(
                leading: Icon(Icons.description),
                title: 'Terms of service',
              ),
              SettingsTile(
                leading: Icon(Icons.collections_bookmark),
                title: 'Opens sources licenses',
              ),
            ],
          ),
          CustomSection(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0, top: 16.0),
              child: Column(
                children: [
//                Image.asset(
//                  'assets/images/Inlay_1.jpg',
//                  height: 50.0,
//                  width: 50.0,
//                  color: Color(0xFF777777),
//                ),
                  Text(
                    'Version: 0.1.0',
                    style: TextStyle(color: Color(0xFF777777)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){
          _settingModalBottomSheet(context);
        },
        child: new Icon(Icons.add),
      ),
    );
  }
}


void _settingModalBottomSheet(context){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc){
        return Container(
          height: MediaQuery.of(context).size.height,
         child: Column(
           children: [
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(icon: Icon(Icons.clear), onPressed: () => Navigator.of(context).pop(),)),
              ListTile(
                 leading: new Icon(Icons.music_note),
                 title: new Text('Music'),
                 onTap: () => {}
             ),
              ListTile(
               leading: new Icon(Icons.videocam),
               title: new Text('Video'),
               onTap: () => {},
             ),

           ],
         ),
        );
      }
  );
}
