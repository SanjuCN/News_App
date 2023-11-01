import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp1/contoller/homescreencontroller.dart';
import 'package:provider/provider.dart';

class detail extends StatefulWidget {
  final int itemIndex;

  const detail({super.key, required this.itemIndex});

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Provider.of<homescreenprovider>(context, listen: false).Fetchnews();
        },
      ),
      body: homescreen_providerState.is_loading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 200,
                        width: 350,
                        color: Colors.black,
                        child: Image.network(
                          "${homescreen_providerState.datamodel?.articles?[widget.itemIndex].urlToImage}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100, left: 10),
                      child: Text(
                        "${homescreen_providerState.datamodel?.articles?[widget.itemIndex].title.toString() ?? ""}",
                        style: GoogleFonts.aleo(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(
                          "${homescreen_providerState.datamodel?.articles?[widget.itemIndex].description.toString() ?? ""}",
                          style: GoogleFonts.aleo(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                        ),
                 ),
                 
              ],
            ),
    );
  }
}
