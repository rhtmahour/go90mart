import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:grocery_onboarding_app/screens/emaillogin.dart';
import 'package:grocery_onboarding_app/screens/myheaderdrawer.dart';
import 'package:grocery_onboarding_app/screens/contacts.dart';
import 'package:grocery_onboarding_app/screens/privacy_policy.dart';
import 'package:grocery_onboarding_app/screens/send_feedback.dart';
import 'package:grocery_onboarding_app/screens/settings.dart';
import 'dashboard.dart';
import 'events.dart';
import 'notes.dart';
import 'notifications.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    var contar;
    if (currentPage == DrawerSections.dashboard) {
      contar = const DashboardPage();
    } else if (currentPage == DrawerSections.contacts) {
      contar = const ContactsPage();
    } else if (currentPage == DrawerSections.events) {
      contar = const EventsPage();
    } else if (currentPage == DrawerSections.notes) {
      contar = const NotesPage();
    } else if (currentPage == DrawerSections.settings) {
      contar = const SettingsPage();
    } else if (currentPage == DrawerSections.notifications) {
      contar = const NotificationsPage();
    } else if (currentPage == DrawerSections.privacy_policy) {
      contar = const PrivacyPolicyPage();
    } else if (currentPage == DrawerSections.send_feedback) {
      contar = const SendFeedbackPage();
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              mydrawerlist(),
              const SizedBox(
                height: 50,
              ),
              MaterialButton(
                minWidth: 300,
                height: 50,
                color: Colors.green,
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacementNamed('/emaillogin');
                },
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(50)),
                child: const Text(
                  "Logout",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mydrawerlist() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Contacts", Icons.people_alt_outlined,
              currentPage == DrawerSections.contacts ? true : false),
          menuItem(3, "Events", Icons.event,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "Notes", Icons.notes,
              currentPage == DrawerSections.notes ? true : false),
          const Divider(),
          menuItem(5, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(6, "Notifications", Icons.notifications_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          const Divider(),
          menuItem(7, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(8, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected
          ? const Color.fromRGBO(224, 224, 224, 1)
          : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  contacts,
  events,
  notes,
  settings,
  notifications,
  // ignore: constant_identifier_names
  privacy_policy,
  // ignore: constant_identifier_names
  send_feedback,
}
