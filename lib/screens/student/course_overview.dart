import 'package:cached_network_image/cached_network_image.dart';
import 'package:fcaihu/constants/constants.dart';
import 'package:fcaihu/services/courses_services.dart';
import 'package:flutter/material.dart';

class CourseOverview extends StatelessWidget {
  static String id = 'courseOverview';

  final String courseImageUrl;
  final String teacherImageUrl;
  final String courseTitle;
  final String teacherName;
  final String description;
  final String courseID;

  CourseOverview({
    this.courseImageUrl,
    this.teacherName,
    this.teacherImageUrl,
    this.description,
    this.courseTitle,
    this.courseID,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsScheme.grey,
      appBar: AppBar(
        title: Text(
          'Course Preview',
          style: appBarTextStyle,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: ColorsScheme.purple,
        ),
        backgroundColor: ColorsScheme.grey,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'PL Course',
                    style: TextStyle(
                      color: ColorsScheme.darkGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 36.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(courseImageUrl),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.purple,
                      backgroundImage:
                          CachedNetworkImageProvider(teacherImageUrl),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Dr.Amr S. Ghonaim',
                    style: TextStyle(
                      color: ColorsScheme.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'description',
                    style: TextStyle(color: ColorsScheme.midPurple),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: ColorsScheme.grey,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 8),
                          spreadRadius: 2,
                          blurRadius: 5,
                          color: ColorsScheme.brightPurple),
                    ],
                  ),
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 25,
                    ),
                    child: Text(
                      description,
                      textAlign: TextAlign.center,
                      maxLines: 8,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RaisedButton(
                    onPressed: () {
                      CoursesServices.enrollCourse(
                        context: context,
                        courseID: courseID,
                      );
                      Navigator.pop(context);
                    },
                    color: ColorsScheme.purple,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Enroll Now',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
