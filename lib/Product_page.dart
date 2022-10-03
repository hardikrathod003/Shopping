import 'package:flutter/material.dart';

import 'global.dart';

class Product_page extends StatefulWidget {
  const Product_page({Key? key}) : super(key: key);

  @override
  State<Product_page> createState() => _Product_pageState();
}

class _Product_pageState extends State<Product_page> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          padding: EdgeInsets.only(top: 70, left: 11, bottom: 10),
          child: Text(
            "E- commerce App",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ),
        Expanded(
          child: Container(
            height: 650,
            width: double.infinity,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...Global.allProducts
                      .map(
                        (e) => Container(
                          margin: const EdgeInsets.only(
                              left: 10, right: 6, bottom: 3, top: 3),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Global.allCarts.add(e);
                                        Global.value.add(e['price']);
                                        for (int i = 0;
                                            i < Global.value.length;
                                            i++) {
                                          Global.subtotal += Global.value[i];
                                        }
                                        Global.gst = Global.subtotal * 18 / 100;
                                        Global.total =
                                            Global.subtotal + Global.gst + 95;
                                      });
                                    },
                                    child: const Icon(Icons.add),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Colors.grey,
                                thickness: 0.5,
                                indent: 59,
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
