import 'package:flutter/material.dart';
import 'package:nav_test/app_state/app_state.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';


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
        elevation: 0,
        title: Text('Settings', style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
      ),
      body: SettingsList(
        backgroundColor: Theme.of(context).colorScheme.primary,
        //lightBackgroundColor: Theme.of(context).colorScheme.primary,
        sections: [
          SettingsSection(
            titleTextStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 18.0),
            title: 'Common',
            tiles: [
              SettingsTile(
                titleTextStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                subtitleTextStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                title: 'Language',
                subtitle: 'English',
                leading: Icon(Icons.language, color: Theme.of(context).colorScheme.onPrimary),
                onTap: () {

                },
              ),
              SettingsTile(
                titleTextStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                subtitleTextStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                title: 'Environment',
                subtitle: 'Production',
                leading: Icon(Icons.cloud_queue,  color: Theme.of(context).colorScheme.onPrimary),
                onTap: () => print("Environment"),
              ),
            ],
          ),
          SettingsSection(
            titleTextStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 18.0),
            title: 'Account',
            tiles: [
              SettingsTile(
                titleTextStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                title: 'Phone number',
                leading: Icon(Icons.phone,  color: Theme.of(context).colorScheme.onPrimary),
              ),
              SettingsTile(
                titleTextStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                title: 'Email',
                leading: Icon(Icons.email, color: Theme.of(context).colorScheme.onPrimary),
              ),
              SettingsTile(
                titleTextStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                title: 'Sign out',
                leading: Icon(Icons.exit_to_app,  color: Theme.of(context).colorScheme.onPrimary),
              ),
            ],
          ),
          SettingsSection(
            titleTextStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 18.0),
            title: 'Security',
            tiles: [
              SettingsTile.switchTile(
                titleTextStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                title: 'Lock app in background',
                leading: Icon(Icons.phonelink_lock,  color: Theme.of(context).colorScheme.onPrimary),
                switchValue: lockInBackground,
                onToggle: (bool value) {
                  setState(() {
                    lockInBackground = value;
                    notificationsEnabled = value;
                  });
                },
              ),
              SettingsTile.switchTile(
                  titleTextStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                  title: 'Use Fingerprint',
                  leading: Icon(Icons.fingerprint,  color: Theme.of(context).colorScheme.onPrimary),
                  onToggle: (bool value) {},
                  switchValue: false),
              SettingsTile.switchTile(
                  titleTextStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                  title: 'Change Password',
                  leading: Icon(Icons.lock,  color: Theme.of(context).colorScheme.onPrimary),
                  onToggle: (bool value) {},
                  switchValue: true),
              SettingsTile.switchTile(
                  titleTextStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                  title: 'Enable notifications',
                  leading: Icon(Icons.notifications,  color: Theme.of(context).colorScheme.onPrimary),
                  enabled: notificationsEnabled,
                  onToggle: (bool value) {},
                  switchValue: true
              ),
              SettingsTile.switchTile(
                  titleTextStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                  title: 'Dark Mode',
                  leading: Icon(Icons.brightness_medium,  color: Theme.of(context).colorScheme.onPrimary),
                  onToggle: (bool value) {
                    Provider.of<AppState>(context, listen: false).updateTheme(value);
                  },
                  switchValue: Provider.of<AppState>(context).isDarkModeOn)
            ],
          ),
          SettingsSection(
            titleTextStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 18.0),
            title: 'Misc',
            tiles: [
              SettingsTile(
                titleTextStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                leading: Icon(Icons.description, color: Theme.of(context).colorScheme.onPrimary),
                title: 'Terms of service',
              ),
              SettingsTile(
                titleTextStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                leading: Icon(Icons.collections_bookmark,  color: Theme.of(context).colorScheme.onPrimary),
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
    );
  }
}
