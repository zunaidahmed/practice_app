import 'package:flutter/material.dart';
import 'data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

int get totalAmount {
  return data.fold(0,
      (total, product) => total + product['price'] * product['count'] as int);
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(234, 233, 233, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(234, 233, 233, 1.0),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            iconSize: 30,
            color: Colors.black,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'My Bag',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      height: 135,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            data[index]['image'],
                            fit: BoxFit.fitHeight,
                            height: 135,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8, left: 3),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data[index]['name'] ?? '',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  style: DefaultTextStyle.of(
                                                          context)
                                                      .style,
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: 'Color: ',
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        // Color for "Size"
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          '${data[index]['color']}',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              RichText(
                                                text: TextSpan(
                                                  style: DefaultTextStyle.of(
                                                          context)
                                                      .style,
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: 'Size: ',
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        // Color for "Size"
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          '${data[index]['size']}',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 28)),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.more_vert),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        if (data[index]['count'] > 1) {
                                          data[index]['count'] -= 1;
                                        }
                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.grey,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        elevation: 5,
                                      ),
                                    ),
                                    Text(data[index]['count'].toString()),
                                    ElevatedButton(
                                      onPressed: () {
                                        data[index]['count'] += 1;
                                        setState(() {
                                          if (data[index]['count'] == 5) {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Center(
                                                      child: Text(
                                                    'Congratulations!',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                  content: Text(
                                                    'You have added \n5 \nT-shirt on your bag!',
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        TextStyle(fontSize: 25),
                                                  ),
                                                  actions: [
                                                    ElevatedButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                        'OKAY',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 25),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Color
                                                                      .fromRGBO(
                                                                          219,
                                                                          48,
                                                                          34,
                                                                          1),
                                                              fixedSize: Size(
                                                                  250, 50)),
                                                    )
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        });
                                      },
                                      child:
                                          Icon(Icons.add, color: Colors.grey),
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        elevation: 5,
                                      ),
                                    ),
                                    // SizedBox(width: 20),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15)),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          '${data[index]['price'] * data[index]['count']}\$',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 140),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total amount:',
                      style: TextStyle(fontSize: 20, color: Colors.grey)),
                  Text('${totalAmount}\$',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('CHECK OUT', style: TextStyle(fontSize: 20)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
