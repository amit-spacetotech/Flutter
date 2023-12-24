import 'package:flutter/material.dart';
import 'screens/feedbackformthankyou.dart';
import 'screens/form.dart';
import 'screens/impove_feedback.dart';
import 'screens/select_feedback.dart';
import 'screens/thankyou.dart';
import 'screens/thankyou2.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => const SelectFeedback(),
  '/thankyou': (context) => const ThankYou(),
  '/feedbackForm': (context) => const FeedBackForm(),
  '/feedback-thankyou': (context) => const FeebbackThankyou(),
  '/feedback-thankyou2': (context) => const FeebbackThankyou2(),
  '/improve-feedback': (context) => const ImproveFeedBack()
};
