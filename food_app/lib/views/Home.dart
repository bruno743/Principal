import 'package:food_app/res/menuItems.dart';
import 'package:flutter/material.dart';

//#F58634 (255, 245, 134, 52) // orange
//#81B214 (255, 129, 178, 20) // green
//#206A5D (255, 32, 106, 93) // blue
//#DF2E38 (255, 223, 46, 56) // red
//#C7E8CA (255, 221, 247, 227) // white green

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    color: const Color.fromARGB(255, 245, 134, 52),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    color: const Color.fromARGB(255, 221, 247, 227),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  // Header
                  Row(
                    children: [
                      const SizedBox(
                        width: 50,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('cartPage');
                        },
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: Color.fromARGB(255, 245, 134, 52),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // Lista da itens
                  Column(
                    children: MenuItemsModelList.map(
                      (e) => Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            height: 100,
                            width: width * 0.6,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 3),
                              ],
                            ),
                            alignment: const Alignment(-0.25, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  e.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                Text(
                                  "${e.totalItem} items",
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          // Container de cada item
                          Container(
                            height: 100,
                            width: (width * 0.6) + 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: const Alignment(-1.5, 0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: AssetImage(e.image),
                                    radius: 35,
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(1.3, 0),
                                  child: FloatingActionButton(
                                    heroTag: null,
                                    backgroundColor:
                                        Color.fromARGB(255, 245, 134, 52),
                                    child: Icon(Icons.arrow_forward_ios),
                                    onPressed: () {
                                      print("done");
                                      Navigator.of(context).pushNamed(
                                          "itemDetailsPage",
                                          arguments: e);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ).toList(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
