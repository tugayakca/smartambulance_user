import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartambulance_user2/states/settingState.dart';

class SettingsUI extends StatefulWidget {
  @override
  _SettingsUIState createState() => _SettingsUIState();
}

class _SettingsUIState extends State<SettingsUI> {
  @override
  Widget build(BuildContext context) {
    final settingState = Provider.of<SettingState>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Settings',
        style: TextStyle(
          fontSize: 16,
        ),
      )),
      body: ListView(
        children: ListTile.divideTiles(context: context, tiles: [
          ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('images/darkmode.png'),
              ),
              title: Text('Dark Mode'),
              trailing: ChangeNotifierProvider<SettingState>(
                builder: (_) => SettingState(),
                child: Switch(
                  value: settingState.darkModeEnabled,
                  onChanged: (newValue) {
                    settingState.setTheme(newValue);
                  },
                ),
              )),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('images/creators.png'),
            ),
            title: Text('Creators'),
          ),
          ListTile(
            leading:
                CircleAvatar(backgroundImage: AssetImage('images/call.png')),
            title: Text("Contact"),
          ),
          ListTile(
            leading:
                CircleAvatar(backgroundImage: AssetImage('images/aboutus.png')),
            title: Text("About Us"),
          ),
        ]).toList(),
      ),
    );
  }
}
