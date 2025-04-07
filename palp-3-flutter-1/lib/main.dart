import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Shop',
      home: const ProductListScreen(),
      debugShowCheckedModeBanner: false,
    );
  } 
}

String formatRupiah(int number) {
  final formatCurrency = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 2,
  );
  return formatCurrency.format(number);
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FilledButton(
            style: ButtonStyle(
              padding: WidgetStateProperty.all(EdgeInsets.zero),
              minimumSize: WidgetStateProperty.all<Size>(Size.square(50))
            ),
            onPressed: (){
              Scaffold.of(context).openDrawer();
            },
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              "https://images.pexels.com/photos/2341350/pexels-photo-2341350.jpeg?auto=compress&cs=tinysrgb&w=600",
              width: 50,  // Set image width
              height: 50, // Set image height
              fit: BoxFit.cover,
            )
          ),
          Text(
            "Warung Pak Tani",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              padding: WidgetStateProperty.all(EdgeInsets.all(5)),
              minimumSize: WidgetStateProperty.all<Size>(Size.square(50))
            ),
            onPressed: () => print('Hello!'),
            child: Icon(
              Icons.notifications_outlined,
              size: 30,
              color: Colors.black,
            )
          )
        ]
      ),
    );
  }
}

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List products = [];
  bool isLoading = true;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final String apiUrl = 'http://127.0.0.1:8000/api/products';

  Future<void> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        setState(() {
          products = json.decode(response.body);
          isLoading = false;
        });
      } else {
        throw Exception('Gagal memuat data');
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Widget _buildStatusCards(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
      child: Row(
        children: [
          // Orders
          Container(
            padding: EdgeInsets.all(15),
            width: 200,
            decoration: BoxDecoration(
              color: Colors.amber.shade100,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.amber.shade800
                        ),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Orders",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.amber.shade700
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "27",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: Colors.amber.shade700
                  ),
                )
              ],
            )
          ),
          
          SizedBox(width: 10),
          
          // Pending
          Container(
            padding: EdgeInsets.all(15),
            width: 200,
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade800
                        ),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Pending",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue.shade700
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "16",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue.shade700
                  ),
                )
              ],
            )
          ),
          
          SizedBox(width: 10),
          
          // Processing
          Container(
            padding: EdgeInsets.all(15),
            width: 200,
            decoration: BoxDecoration(
              color: Colors.red.shade100,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.red.shade800
                        ),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Processing",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.red.shade700
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "12",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: Colors.red.shade700
                  ),
                )
              ],
            )
          ),
        ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(),
        body:
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        _buildStatusCards(),
                        MasonryGridView.builder(
                          gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2
                          ),
                          padding: EdgeInsets.all(15),
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          itemCount: products.length,
                          shrinkWrap: true, // ✅ Allows MasonryGridView to wrap its content
                          physics: NeverScrollableScrollPhysics(), 
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.black12,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Image.network(
                                          product['photo'],
                                          width: double.infinity,
                                        ),

                                        Positioned(
                                          top: 5,
                                          right: 5,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.more_horiz, 
                                                color: Colors.black,
                                                size: 20,
                                              ),
                                              onPressed: () {
                                                // Handle button press
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product['name'],
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                formatRupiah(product['price']),
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w800
                                                ),
                                              ),
                                              product['is_promo']
                                              ? 
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                                                  decoration: BoxDecoration(
                                                    color: Colors.red.shade800,
                                                    borderRadius: BorderRadius.circular(10)
                                                  ),
                                                  child: Text(
                                                    'Promo',
                                                    style: TextStyle(
                                                      color: Colors.white
                                                    )
                                                  ),
                                                )
                                              :
                                              SizedBox.shrink()
                                            ],
                                          ),
                                        ]
                                      ),
                                    )
                                  ],
                                )
                              )
                            );
                          },
                        )
                      ],
                    ),
                  ),
        drawer: Drawer(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    "https://images.pexels.com/photos/2341350/pexels-photo-2341350.jpeg?auto=compress&cs=tinysrgb&w=600",
                    width: 100,
                    height: 100
                  ),
                )
              ],
            )
          )
        ),
      )
    );
  }
}
