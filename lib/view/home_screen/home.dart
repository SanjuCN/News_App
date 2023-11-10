import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:newsapp1/contoller/homescreencontroller.dart';

import 'package:newsapp1/view/detail_screen/detail.dart';
import 'package:provider/provider.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  void initState() {
    Provider.of<homescreenprovider>(context, listen: false).Fetchnews();
    super.initState();
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final homescreen_providerState = Provider.of<homescreenprovider>(context);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 20, 18, 18),
        appBar: AppBar(
          title: Center(
            child: Text(
              "NEWS APP",
              style: GoogleFonts.lilyScriptOne(
                  textStyle: TextStyle(fontWeight: FontWeight.w100)),
            ),
          ),
          backgroundColor: Colors.black,
        ),
        floatingActionButton: FloatingActionButton(onPressed: () async {
          Provider.of<homescreenprovider>(context, listen: false).Fetchnews();
        }),
        body: homescreen_providerState.is_loading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : RefreshIndicator(
                onRefresh: () async {
                  await Provider.of<homescreenprovider>(context, listen: false)
                      .Fetchnews();
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                          width: 320,
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(fillColor: Colors.white,
                            filled: true,
                                prefixIcon: Icon(Icons.search),
                                hintText: "Search...",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            controller: searchController,
                            onChanged: (value) {
                              // fetchData(searchquery:searchController.text);
                              if (searchController.text.length % 2 == 0) {
                                Provider.of<homescreenprovider>(context,
                                        listen: false)
                                    .Fetchnews(
                                        searchQuery: searchController.text);
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CarouselSlider(
                            items: List.generate(
                                10,
                                (index) => Container(
                                      height: 180,
                                      width: MediaQuery.of(context).size.width*0.9,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 200,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                      "${homescreen_providerState.datamodel?.articles?[index].urlToImage}",
                                                    ),
                                                    fit: BoxFit.cover),
                                                color: Colors.amber,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                                " ${homescreen_providerState.datamodel?.articles?[index].title.toString() ?? ""}",
                                                style: GoogleFonts.podkova(
                                                    textStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold),),maxLines: 2,),
                                          ),
                                        ],
                                      ),
                                    )),
                            options: CarouselOptions(
                              animateToClosest: true,
                              autoPlayCurve: Curves.linear,
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              enlargeCenterPage: true,
                              viewportFraction: 1,
                              height: 270,
                              autoPlay: true,
                            )),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: ListView.builder(
                            itemCount: homescreen_providerState
                                .datamodel?.articles?.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),

                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  detail(itemIndex: index),
                                            ));
                                      },
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 200,
                                                width: MediaQuery.of(context).size.width*0.9,
                                                color: Colors.black,
                                                child: Image.network(
                                                  "${homescreen_providerState.datamodel?.articles?[index].urlToImage}",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 10,
                                                left: 10,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: SizedBox(width: 350,
                                                    child: Text(
                                                      "${homescreen_providerState.datamodel?.articles?[index].title.toString() ?? ""}",
                                                      style: GoogleFonts.aleo(
                                                          textStyle: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight.w500)),
                                                                  maxLines: 3,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
