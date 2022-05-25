import 'package:flutter/material.dart';
 import 'package:twigconnect/views/chat_details.dart';
import 'package:twigconnect/views/home.dart';
import 'package:twigconnect/views/landing.dart';
import 'package:twigconnect/views/login.dart';
import 'package:twigconnect/views/register.dart';
import 'package:twigconnect/views/reset_password.dart';
import 'package:twigconnect/views/user_details.dart';

import 'featursKeys.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case landingViewRoute:
      return MaterialPageRoute(builder: (context) => LandingPage());
    case homeViewRoute:
      return MaterialPageRoute(builder: (context) => HomePage());
    case loginViewRoute:
      return MaterialPageRoute(builder: (context) => LoginPage());
    case registerViewRoute:
      return MaterialPageRoute(builder: (context) => RegisterPage());
    case resetPasswordViewRoute:
      return MaterialPageRoute(builder: (context) => ResetPasswordPage());
    case chatDetailsViewRoute:
      return MaterialPageRoute(builder: (context) => ChatDetailsPage(userId: settings.arguments));
    case userDetailsViewRoute:
      return MaterialPageRoute(builder: (context) => UserDetailsPage(userId: settings.arguments));
      break;
    default:
      return MaterialPageRoute(builder: (context) => LandingPage());
  }
}
