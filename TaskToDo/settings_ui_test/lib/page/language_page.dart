import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  int languageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            tiles: [
              SettingsTile(
                title: 'English',
                trailing: trailingWidget(0),
                onTap: () {
                  changeLanguage(0);
                },
              ),
              SettingsTile(
                title: 'Myanmar',
                trailing: trailingWidget(1),
                onTap: () {
                  changeLanguage(1);
                },
              ),
              SettingsTile(
                title: 'German',
                trailing: trailingWidget(2),
                onTap: () {
                  changeLanguage(2);
                },
              ),
              SettingsTile(
                title: 'Spanish',
                trailing: trailingWidget(3),
                onTap: () {
                  changeLanguage(3);
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget trailingWidget(int index) {
    return (languageIndex == index) ? Icon(Icons.check, color: Colors.blue,) : Icon(null);
  }

  void changeLanguage(int index) {
    setState(() {
      languageIndex = index;
    });
  }

}
