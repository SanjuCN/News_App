import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:newsapp1/contoller/homescreencontroller.dart';

import 'package:newsapp1/view/detail.dart';
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
            : ListView.builder(
                itemCount: homescreen_providerState.datamodel?.articles?.length,
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
                              child: Stack(
                                children: [
                                  Container(
                                    height: 200,
                                    width: 350,
                                    color: Colors.black,
                                    child: Image.network(
                                      "${homescreen_providerState.datamodel?.articles?[index].urlToImage}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 100,
                                      left: 10,
                                    ),
                                    child: Text(
                                      "${homescreen_providerState.datamodel?.articles?[index].title.toString() ?? ""}",
                                      style: GoogleFonts.aleo(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )));
  }
}
