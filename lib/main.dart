import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(miniProjectTeam());
}

class miniProjectTeam extends StatefulWidget {
  const miniProjectTeam({super.key});

  @override
  State<miniProjectTeam> createState() => _miniProjectTeamState();
}

class _miniProjectTeamState extends State<miniProjectTeam> {
  int _Sindex = 0;
  int _SCIndex = 0;
  List<String> categories = ["Most views", "Nearby", "Latest", "Top Rated"];
  final List<Map<String, String>> myPlaces = [
    {
      "name": "Hollow knight, Team Cherry",
      "image":
          "assets/my_image/MV5BMGIyYmJmZDgtOWQ1Ny00NDFiLTk2OTgtM2Q2ZWQ4OWIxZjg3XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg",
      "location": "Adelaide, South Australia, Australia",
    },

    {
      "name": "Clock, Europe",
      "image": "assets/my_image/photo_2026-01-28_22-01-55.jpg",
      "location": "Europe",
    },

    {
      "name": "Chess, Europe",
      "image": "assets/my_image/photo_2026-01-28_22-01-58.jpg",
      "location": "Europe",
    },
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi, Flutter",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "Explore the World",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 127, 128, 129),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(
                        "assets/my_image/What_is_Flutter_f648a606af.png",
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,

                    hintText: "search",
                    suffixIcon: Icon(Icons.settings, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Places",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("view all", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...List.generate(categories.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _SCIndex = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          margin: const EdgeInsets.symmetric(horizontal: 0),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 0,
                          ),
                          decoration: BoxDecoration(
                            color: _SCIndex == index
                                ? Colors.black
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: Center(
                            child: Text(
                              categories[index],
                              style: TextStyle(
                                color: _SCIndex == index
                                    ? Colors.white
                                    : Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),

              Expanded(
                child: _SCIndex == 0
                    ? Transform.translate(
                        offset: const Offset(0, 0),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: myPlaces.length,
                          itemBuilder: (context, index) {
                            return Align(
                              alignment: Alignment.topCenter,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => InformationOfImage(
                                        itemData: myPlaces[index],
                                      ),
                                    ),
                                  );
                                },

                                child: Hero(
                                  tag: myPlaces[index]["image"].toString(),
                                  child: Container(
                                    width: 240,
                                    height: 360,
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 10,
                                          offset: const Offset(0, 20),
                                        ),
                                      ],
                                    ),

                                    child: Stack(
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        Container(
                                          height: 380,
                                          width: 280,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                myPlaces[index]["image"]!,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 5,
                                          left: 5,
                                          right: 5,

                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),

                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                sigmaX: 10,
                                                sigmaY: 10,
                                              ),
                                              child: Container(
                                                height: 80,
                                                decoration: BoxDecoration(
                                                  color: Colors.black.withAlpha(
                                                    1,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    15,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        myPlaces[index]["name"]!,
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        myPlaces[index]["location"]!,
                                                        style: const TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : Center(
                        child: Text(
                          "No items in ${categories[_SCIndex]} yet",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                      ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _Sindex,
          onTap: (index) {
            setState(() {
              _Sindex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          showSelectedLabels: true,

          items: [
            BottomNavigationBarItem(
              icon: Icon(
                _Sindex == 0 ? Icons.home : Icons.home_outlined,
                color: _Sindex == 0 ? Colors.black : Colors.grey,
              ),
              label: '•',
            ),

            BottomNavigationBarItem(
              icon: Icon(
                _Sindex == 1 ? Icons.explore : Icons.explore_outlined,
                color: _Sindex == 1 ? Colors.black : Colors.grey,
              ),

              label: '•',
            ),

            BottomNavigationBarItem(
              icon: Icon(
                _Sindex == 2 ? Icons.favorite : Icons.favorite_border,
                color: _Sindex == 2 ? Colors.black : Colors.grey,
              ),
              label: '•',
            ),

            BottomNavigationBarItem(
              icon: Icon(
                _Sindex == 3 ? Icons.person : Icons.person_outline,
                color: _Sindex == 3 ? Colors.black : Colors.grey,
              ),
              label: '•',
            ),
          ],
        ),
      ),
    );
  }
}

class InformationOfImage extends StatefulWidget {
  final Map itemData;
  const InformationOfImage({super.key, required this.itemData});

  @override
  State<InformationOfImage> createState() => _InformationOfImageState();
}

class _InformationOfImageState extends State<InformationOfImage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 700,
            child: Stack(
              children: [
                Hero(
                  tag: widget.itemData["image"].toString(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 700,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          height: 700,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(widget.itemData["image"]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          left: 5,
                          right: 5,

                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),

                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.black.withAlpha(1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        widget.itemData["name"],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        widget.itemData["location"],
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
            ],
          ),
        ],
      ),
    );
  }
}
