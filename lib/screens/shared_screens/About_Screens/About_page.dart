import 'package:fcaihu/constants/constants.dart';
import 'package:fcaihu/screens/shared_screens/About_Screens/ui/Developers/Developer.dart';
import 'package:fcaihu/screens/shared_screens/About_Screens/ui/developerdetails/developer_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  final List<Developer> _Developers = [
    Developer(
      avatar: "assets/images/abdoRagab.jpg",
      name: "Abdelrahman Ragab",
      email: "abdoragab38@gmail.com",
      university: "Computer science,Helwan University",
      address: "Maadi,Cairo",
      age: '21',
      description: [
        'Abdelrahman Ragab, Level 3',
        'Worked before as',
        '1-Web Application Developer at Nat solution.',
        '2-Freelance Flutter Developer.',
        '3-Machine learning intern at inetworks.',
      ],
      about:
          'Data science self learner with a great passion to learn and work in this field with a demonstrated history of working in the non-profit organization management industry. Skilled in Coding, Public Speaking, Microsoft Office, Research, Teamwork, and Leadership.',
      portfolioImagesUrls: [''],
      facebookPage: 'https://www.facebook.com/abdo.mohamed.374',
      githubPage: 'https://github.com/AbdelrahmanRagab38',
      twitterPage: 'https://twitter.com/A_R_M_M_S',
      whatsAppNumber: '+201208648921',
      phoneNumber: '+201155400075',
      title: 'Software Engineer',
    ),
    Developer(
      avatar: 'assets/images/salahTaha.jpg',
      name: "Salah Taha",
      email: "salahtaha065@gmail.com",
      university: "Computer science,Helwan University",
      address: 'Nahia,Giza',
      facebookPage: 'https://www.facebook.com/salahtahaabohemed',
      about:
          'Computer Scince Student who has a great desire to be milestone in Software Engeneering Field',
      whatsAppNumber: '+201063851921',
      phoneNumber: '+201033046302',
      twitterPage: 'https://twitter.com/as_motion',
      githubPage: 'https://github.com/salah-taha',
      portfolioImagesUrls: [''],
      description: [
        'Salah Taha, Level 1',
        'Worked before as',
        '1-Flutter Developer Freelancer.',
        '2-Motion Graphics Freelancer.',
        '3-Graphic Designer Freelancer.',
      ],
      age: '20',
      title: 'Software Engineer',
    ),
    Developer(
      avatar: 'assets/images/saiedAhmed.jpg',
      name: "Saied Ahmed",
      email: "saiedahmedsaied821@gmail.com",
      university: "Computer science,Helwan University",
      address: 'Nahia,Giza',
      facebookPage: 'https://www.facebook.com/profile.php?id=100006625578162',
      about:
          'Computer Scince Student who has a great desire to be milestone in Software Engeneering Field',
      whatsAppNumber: '+201159097857',
      phoneNumber: '+201159097857',
//      twitterPage: 'https://twitter.com/as_motion',
      githubPage: 'https://github.com/siaed',
      portfolioImagesUrls: [''],
      description: [
        'Saied Ahmed, Level 1',
        'Worked before as',
        '1-Flutter Developer Freelancer.',
        '2-Web Developer Freelancer.',
        '3-Web Designer Freelancer.',
      ],
      age: '19',
      title: 'Web Developer',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsScheme.grey,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: MediaQuery.of(context).size.width - 30.0,
                height: MediaQuery.of(context).size.height - 200,
                child: GridView.count(
                  crossAxisCount: 2,
                  primary: false,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 15.0,
                  childAspectRatio: 0.8,
                  children: <Widget>[
                    _buildCard(_Developers[0], context),
                    _buildCard(_Developers[1], context),
                    _buildCard(_Developers[2], context),
                  ],
                )),
          ),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(Developer dev, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      DeveloperDetailsPage(dev, avatarTag: 1)));
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: ColorsScheme.white),
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                  ),
                  Container(
                      child: Container(
                    height: 75.0,
                    width: 75.0,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(dev.avatar),
                      radius: 50.0,
                      backgroundColor: Colors.white,
                    ),
                  )),
                  SizedBox(height: 7.0),
                  Text(dev.name,
                      style: TextStyle(
                          color: Colors.deepPurple[800],
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Text(dev.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                  Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SignInButton(
                            Buttons.GitHub,
                            onPressed: () async {
                              final url = dev.githubPage;

                              if (await canLaunch(url)) {
                                await launch(url, forceSafariVC: true);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            mini: true,
                          ),
                          SignInButton(
                            Buttons.Facebook,
                            onPressed: () async {
                              final url = dev.facebookPage;

                              if (await canLaunch(url)) {
                                await launch(url, forceSafariVC: true);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            mini: true,
                          ),
                          SignInButton(
                            Buttons.Twitter,
                            onPressed: () async {
                              final url = dev.twitterPage;

                              if (await canLaunch(url)) {
                                await launch(url, forceSafariVC: true);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            mini: true,
                          ),
                        ],
                      ))
                ]))));
  }
}
