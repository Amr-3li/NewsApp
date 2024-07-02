import 'package:flutter/material.dart';
import 'package:newsapp/Apis/models/news_model.dart';
import 'package:newsapp/Apis/repository/news_reposeitory.dart';
import 'package:newsapp/Apis/wepServices/news_wep_ser.dart';
import 'package:newsapp/views/screens/search_news_page.dart';
import 'package:newsapp/views/widgets/news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<News>? allNews;
  bool isLoading = true;
  final myController = TextEditingController();
  @override
  void initState() {
    super.initState();
    getNews();
  }

  Future<void> getNews() async {
    allNews = await NewsRepository(NewsWepService()).getNews();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //
        title: Center(child: Text("World News 🌍")),
      ),
      endDrawer: Drawer(
        shape: Border.all(color: Colors.grey, width: 7),
        backgroundColor: Color.fromARGB(220, 24, 24, 24),
        child: ListView(
          children: [
            Container(
              color: Colors.grey,
              height: 50,
              child: const Center(
                  child: Text(
                "choose your carigory ",
                style: TextStyle(fontSize: 20),
              )),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SearchPage(
                      text: "Sports",
                    );
                  },
                ));
              },
              title: const Text(
                "Sports 🏅",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color:Colors.white),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SearchPage(
                      text: "Science",
                    );
                  },
                ));
              },
              title: const Text(
                "Science 📖",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SearchPage(
                      text: "Art",
                    );
                  },
                ));
              },
              title: const Text(
                "Art 🎨",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SearchPage(
                      text: "Business",
                    );
                  },
                ));
              },
              title: const Text(
                "Business 💸",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SearchPage(
                      text: "Wars",
                    );
                  },
                ));
              },
              title: const Text(
                "Wars 🚀",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SearchPage(
                      text: "health",
                    );
                  },
                ));
              },
              title: const Text(
                "health 🩺",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),
            ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SearchPage(
                        text: "Economy",
                      );
                    },
                  ));
                },


                title: const Text(
                  "Economy 📶",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
                ))
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color.fromARGB(255, 218, 217, 217),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 300,
                        height: 80,
                        padding: const EdgeInsets.only(top: 10, left: 15),
                        child: TextFormField(
                          controller: myController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            alignLabelWithHint: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            hintStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            labelText: "Search",
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: const Icon(
                          Icons.search,
                          size: 35,
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return SearchPage(
                                text: myController.text,
                              );
                            },
                          ));
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                isLoading
                    ? Center(child: CircularProgressIndicator())
                    : allNews != null && allNews!.isNotEmpty
                        ? ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: allNews!.length,
                            itemBuilder: (context, index) {
                              if (allNews![index].title != "[Removed]") {
                                return NewsWidget(news: allNews![index]);
                              } else {
                                return SizedBox(
                                  width: 1,
                                );
                              }
                            },
                          )
                        : const Text('No news available'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
