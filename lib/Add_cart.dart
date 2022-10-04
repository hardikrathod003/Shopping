import 'package:flutter/material.dart';

import 'global.dart';

class Add_cart extends StatefulWidget {
  const Add_cart({Key? key}) : super(key: key);

  @override
  State<Add_cart> createState() => _Add_cartState();
}

class _Add_cartState extends State<Add_cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add cart Page"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ...Global.allCarts
              .map(
                (e) => Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 5, bottom: 2.5, top: 2.5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.network(
                              e['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e['name'],
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "₹ ${e['price']}",
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  Global.allCarts.remove(e);
                                  for (int i = 0;
                                      i < Global.value.length;
                                      i++) {
                                    Global.subtotal -= Global.value[i];
                                  }
                                  Global.gst = Global.subtotal * 18 / 100;
                                  Global.total =
                                      Global.subtotal - Global.gst - 95;
                                });
                              },
                              icon: Icon(Icons.remove_circle))
                        ],
                      ),
                    ],
                  ),
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
