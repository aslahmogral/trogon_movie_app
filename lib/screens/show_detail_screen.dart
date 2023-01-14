import 'package:flutter/material.dart';
import 'package:trojonmovieapp/model/shows_model.dart';
import 'package:trojonmovieapp/screens/cast_screen.dart';

class ShowDetailScreen extends StatefulWidget {
  final int index;
  final ShowModel show;
  const ShowDetailScreen({super.key, required this.index, required this.show});

  @override
  State<ShowDetailScreen> createState() => _ShowDetailScreenState();
}

class _ShowDetailScreenState extends State<ShowDetailScreen> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show details'),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    image: DecorationImage(
                        image: NetworkImage(widget.show.image!['medium']),
                        fit: BoxFit.fitWidth),
                  ),
                ),
                Positioned(
                    bottom: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.show.name.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        ),
                        Row(
                          children: [
                            Text(
                              'rating',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(widget.show.rating!['average'].toString(),
                                style: TextStyle(color: Colors.white))
                          ],
                        )
                      ],
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.show.summary.toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
            Expanded(child: SizedBox()),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.white)),
                  onPressed: (){
                   Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CastScreen(index: widget.index),
                          ));
            
                }, child: Text('CAST',style: TextStyle(color: Colors.black),)),
              ),
            )
           ,
           SizedBox(height: 100,)
          ],
        ),
      ),
    );
  }
}
