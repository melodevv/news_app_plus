import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_plus/articlesData.dart';

import 'defaults.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

var indexClicked = 0;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pages = [
    // Tech Articles
    ListView.builder(
      itemCount: Articles.techArticles.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Card(
              elevation: 7,
              child: ArticleDetails(
                  articleNumber: index, articlesForPage: Articles.techArticles),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        );
      },
    ),

    // Sports Articles
    ListView.builder(
      itemCount: Articles.sportsArticles.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Card(
              elevation: 7,
              child: ArticleDetails(
                articleNumber: index,
                articlesForPage: Articles.sportsArticles,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        );
      },
    ),

    // Politics Articles
    ListView.builder(
      itemCount: Articles.politicsArticles.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Card(
              elevation: 7,
              child: ArticleDetails(
                articleNumber: index,
                articlesForPage: Articles.politicsArticles,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        );
      },
    ),
    // Entertainment Articles
    ListView.builder(
      itemCount: Articles.techArticles.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Card(
              elevation: 7,
              child: ArticleDetails(
                  articleNumber: index,
                  articlesForPage: Articles.entertainmentArticles),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        );
      },
    ),
  ];

  Function() updateState(int index) {
    return () {
      setState(() {
        indexClicked = index;
      });
      Navigator.pop(context);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.lightBlue,
        backgroundColor: Colors.white,
        elevation: 7,
        title: const Text.rich(
          TextSpan(
              text: 'News',
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
                fontWeight: FontWeight.w900,
              ),
              children: [
                TextSpan(
                  text: 'App+',
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ]),
        ),
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: Container(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const CircleAvatar(
                      radius: 42,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text.rich(
                      TextSpan(
                          text: 'News',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.w900,
                          ),
                          children: [
                            TextSpan(
                              text: 'App+',
                              style: TextStyle(
                                color: Colors.lightBlue,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ]),
                    ),
                    Text(
                      'News On The Go',
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  AppDrawerTile(
                    index: 0,
                    onTap: updateState(0),
                  ),
                  AppDrawerTile(
                    index: 1,
                    onTap: updateState(1),
                  ),
                  AppDrawerTile(
                    index: 2,
                    onTap: updateState(2),
                  ),
                  AppDrawerTile(
                    index: 3,
                    onTap: updateState(3),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: Column(children: [
        Expanded(child: pages[indexClicked]),
      ]),
    );
  }
}

class AppDrawerTile extends StatelessWidget {
  const AppDrawerTile({
    Key? key,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final int index;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        onTap: onTap,
        selected: indexClicked == index,
        selectedColor: Defaults.drawerSelectedTileColor,
        leading: Icon(
          Defaults.drawerItemIcon[index],
          size: 35,
          color: indexClicked == index
              ? Defaults.drawerItemSelectedColor
              : Defaults.drawerItemColor,
        ),
        title: Text(
          Defaults.drawerItemText[index],
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: indexClicked == index
                ? Defaults.drawerItemSelectedColor
                : Defaults.drawerItemColor,
          ),
        ),
      ),
    );
  }
}

class ArticleDetails extends StatelessWidget {
  const ArticleDetails(
      {Key? key,
      // required this.articleTitle,
      required this.articleNumber,
      required this.articlesForPage
      // required this.currentPage,
      })
      : super(key: key);

  // final String articleTitle;
  final int articleNumber;
  final List articlesForPage;
  // final int currentPage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.newspaper,
        color: Color.fromARGB(255, 105, 165, 255),
      ),
      title: Text(
        articlesForPage[articleNumber],
        style: GoogleFonts.montserrat(),
      ),
      subtitle: Row(
        children: const [
          Icon(Icons.share),
          Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
          Icon(Icons.lock_clock_outlined),
          Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
          Text('7 hours ago')
        ],
      ),
      trailing: const Image(
        image: AssetImage('assets/images/placeholder.png'),
      ),
    );
  }
}
