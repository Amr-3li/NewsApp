import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Apis/models/news_model.dart';
import 'package:newsapp/Apis/repository/news_reposeitory.dart';
import 'package:newsapp/Apis/wepServices/news_wep_ser.dart';
import 'package:newsapp/bloc_control/cubit/news_cubit.dart';
import 'package:newsapp/views/screens/search_news_page.dart';
import 'package:newsapp/views/widgets/news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<News>? allNews;
  final myController = TextEditingController();
  NewsCubit? newsCubit;
  @override
  void initState() {
    super.initState();
    newsCubit = BlocProvider.of<NewsCubit>(context);
    getNews();
  }

  Future<void> getNews() async {
    try {
      List<News>? list = await newsCubit!.getNews();
      setState(() {
        allNews = list;
      });
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            //
            title: const Center(child: Text("World News 🌍")),
          ),
          endDrawer: Drawer(
            shape: Border.all(color: Colors.grey, width: 7),
            backgroundColor: const Color.fromARGB(220, 24, 24, 24),
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
                        return const SearchPage(
                          text: "Sports",
                        );
                      },
                    ));
                  },
                  title: const Text(
                    "Sports 🏅",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const SearchPage(
                          text: "Science",
                        );
                      },
                    ));
                  },
                  title: const Text(
                    "Science 📖",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const SearchPage(
                          text: "Art",
                        );
                      },
                    ));
                  },
                  title: const Text(
                    "Art 🎨",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const SearchPage(
                          text: "Business",
                        );
                      },
                    ));
                  },
                  title: const Text(
                    "Business 💸",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const SearchPage(
                          text: "Wars",
                        );
                      },
                    ));
                  },
                  title: const Text(
                    "Wars 🚀",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const SearchPage(
                          text: "health",
                        );
                      },
                    ));
                  },
                  title: const Text(
                    "health 🩺",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const SearchPage(
                            text: "Economy",
                          );
                        },
                      ));
                    },
                    title: const Text(
                      "Economy 📶",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ))
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
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
                        color: const Color.fromARGB(255, 218, 217, 217),
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
                                  return BlocProvider(
                                    create: (context) => NewsCubit(
                                        NewsRepository(NewsWepService())),
                                    child: SearchPage(
                                      text: myController.text,
                                    ),
                                  );
                                },
                              ));
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    state is NewsLoading
                        ? const Center(child: CircularProgressIndicator())
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
                                    return const SizedBox(
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
      },
    );
  }
}
