import 'package:flutter/material.dart';
import 'package:trojonmovieapp/model/cast_model.dart';
import 'package:trojonmovieapp/services/cast_services.dart';

class CastScreen extends StatefulWidget {
  final int index;
  const CastScreen({super.key, required this.index});

  @override
  State<CastScreen> createState() => _CastScreenState();
}

class _CastScreenState extends State<CastScreen> {
  late List<CastModel>? _castList = [];
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    _getShowCastData();
  }

  void _getShowCastData() async {
    _castList = (await CastServices().getCast(widget.index.toString()))!;

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            onTap: (() {
              print(_castList![1].person!['name']);
            }),
            child: Text('Cast names')),
      ),
      body: Container(
        // color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: _castList!.length,
            itemBuilder: (context, index) => Card(
                child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    // bool isChecked = false;

                    return Container(
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 2,
                            decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              image: DecorationImage(
                                  image: NetworkImage(_castList![index]
                                      .person!['image']['medium']
                                      .toString()),
                                  fit: BoxFit.fitWidth),
                            ),
                          ),
                          Row(
                            children: [
                              StatefulBuilder(
                                builder: (context,StateSetter setState) {
                                  return Checkbox(
                                      value: isChecked,
                                      onChanged: (value) {
                                        print('isChecked  : $isChecked');
                                        print('value  : $value');
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      });
                                }
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        showDialog(
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                child: Container(
                                                  height: 500,
                                                  child: Center(
                                                      child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text('Successful'),
                                                      ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text('exit'))
                                                    ],
                                                  )),
                                                ),
                                              );
                                            },
                                            context: context);
                                      },
                                      child: Text('Click'))),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      _castList![index].person!['image']['medium'].toString()),
                  backgroundColor: Colors.transparent,
                ),
                title: Text(_castList![index].person!['name'].toString()),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_castList![index].person!['gender'].toString()),
                    Text(_castList![index].person!['birthday'].toString()),
                    Text(
                        _castList![index].person!['country']['name'].toString())
                  ],
                ),
              ),
            )),
          ),
        ),
      ),
    );
  }
}
