import 'package:flutter/material.dart';
import "main.dart";
import "createEvent.dart";
import "view_events.dart";
import "invited_events.dart";
import "account_settings.dart";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const UserHome(),
    const CreateEvent(),
    const ViewEvents(),
    const InvitedEvents(),
    const AccountSettings(),
    LogOutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add), label: 'Create Event'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_outlined),
                label: 'View Events'),
            BottomNavigationBarItem(
                icon: Icon(Icons.inbox_outlined), label: 'Invited Events'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Account Settings'),
            BottomNavigationBarItem(
                icon: Icon(Icons.exit_to_app_outlined), label: 'Log Out'),
          ],
        ));
  }
}
