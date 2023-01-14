import 'package:flutter/material.dart';
import 'package:trojonmovieapp/model/shows_model.dart';
import 'package:trojonmovieapp/screens/show_detail_screen.dart';
import 'package:trojonmovieapp/services/shows_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<ShowModel>? _showList = [];

  @override
  void initState() {
    super.initState();
    _getShowData();
  }

  void _getShowData() async {
    _showList = (await ShowServices().getShows())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('movie'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 280,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: _showList!.length,
            itemBuilder: (context, index) => Container(
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowDetailScreen(
                              index: index + 1, show: _showList![index]),
                        ));
                  },
                  child: Card(
                      elevation: 2,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        children: [
                          // Image.network(_showList![index].image!['medium']),
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      _showList![index].image!['medium']),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Text(
                            _showList![index].name.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        ],
                      ))),
            ),
          ),
        ));
  }
}
