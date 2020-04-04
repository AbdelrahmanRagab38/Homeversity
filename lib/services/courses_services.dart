import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fcaihu/constants/constants.dart';
import 'package:fcaihu/models/provider_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoursesServices {
  static Future enrollCourse({BuildContext context, String courseID}) async {
    String userID = Provider.of<ProviderData>(context, listen: false).user.id;
    await Firestore.instance
        .collection('users')
        .document(userID)
        .collection('enrolledCourses')
        .document(courseID)
        .setData({});
    await Firestore.instance
        .collection('available_courses')
        .document(courseID)
        .collection('studens')
        .document(userID)
        .setData({});
    return;
  }

  static Future completeLecture(
      BuildContext context, String courseID, String lectureID) async {
    String userID = Provider.of<ProviderData>(context, listen: false).user.id;
    Firestore.instance
        .collection('users')
        .document(userID)
        .collection('enrolledCourses')
        .document(courseID)
        .collection('completedLectures')
        .document(lectureID)
        .setData({});
    return;
  }

  static Future<Map> getCourseLectures(
      BuildContext context, String courseID) async {
    String userID = Provider.of<ProviderData>(context, listen: false).user.id;
    QuerySnapshot lectures = await availableCoursesRef
        .document(courseID)
        .collection('lectures')
        .orderBy('order')
        .getDocuments();
    QuerySnapshot completedLectures = await Firestore.instance
        .collection('users')
        .document(userID)
        .collection('enrolledCourses')
        .document(courseID)
        .collection('completedLectures')
        .getDocuments();
    Map allLectures = {
      'lectures': lectures,
      'completedLectures': completedLectures,
    };
    return allLectures;
  }
}
