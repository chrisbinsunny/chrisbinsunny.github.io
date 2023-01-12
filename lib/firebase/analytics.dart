import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/foundation.dart';

class AnalyticsService extends ChangeNotifier{
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  static FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: analytics);

  Future<void> setCurrentScreen(String screen) async {
    print('Setting current screen to $screen');
    await analytics.setCurrentScreen(
      screenName: screen,
    );
  }

  Future<void> logCurrentScreen(String screen) async {
    print('Setting current screen to $screen');

    await analytics.setCurrentScreen(
      screenName: screen,
    );
    await analytics.logScreenView(
      screenName: screen,
    );
  }

  static Future<void> logEvent(String name) async {
    await FirebaseAnalytics.instance.logEvent(
      name: name,
    );
  }


  static Future<void> logAppBarButton(String name, {String type="AppBar"}) async {
    await FirebaseAnalytics.instance.logEvent(
      name: "appBarButtonClicked",
      parameters: {
        "name": name,
        "type": type
      },
    );
  }

  static Future<void> logProjectGitLaunched(String project) async {
    await FirebaseAnalytics.instance.logEvent(
      name: "projectGitHubView",
      parameters: {
        "project": project,
      },
    );
  }

  static Future<void> logProjectLaunched(String project) async {
    await FirebaseAnalytics.instance.logEvent(
      name: "projectLaunched",
      parameters: {
        "project": project,
      },
    );
  }

  static Future<void> logProject(String project) async {
    await FirebaseAnalytics.instance.logEvent(
      name: "projectViewed",
      parameters: {
        "project": project,
      },
    );
  }



  static Future logContact(String a) async {
    await analytics.logEvent(
      name: "contactClicked",
      parameters: {'item': a,},
    );
  }
}
