import 'package:food_app/models/menuItemsModel.dart';
import 'package:food_app/providers/cartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemDetailsPage extends StatefulWidget {
  const ItemDetailsPage({Key? key}) : super(key: key);

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  bool isBookMark = false;

  List quantityList = [];

  bool start = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MenuItemsModel res =
        ModalRoute.of(context)!.settings.arguments as MenuItemsModel;

    if (start) {
      quantityList.clear();
      for (var element in res.items) {
        quantityList.add(1);
      }
      start = false;
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    color: const Color.fromARGB(255, 245, 134, 52),
                  ),
                ),
                Expanded(
                  flex: 3,
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
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
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
                  Container(
                    padding: const EdgeInsets.all(40),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      res.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 5),
                    ),
                  ),
                  // Opcoes
                  Column(
                    children: res.items.map(
                      (e) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 40),
                              alignment: Alignment.center,
                              width: width * 0.65,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, blurRadius: 3),
                                ],
                              ),
                              // Detalhes da opcao
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      e.name.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      "\n⭐  ${e.rating} ",
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      "${e.weight} ",
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        "${e.price} Rs.",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                            fontSize: 21),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Imagem e acoes
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed('detailsPage', arguments: e);
                              },
                              child: Container(
                                width: (width * 0.65) + 70,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  color: Colors.transparent,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: AssetImage(e.image),
                                          backgroundColor: Colors.transparent,
                                          radius: 35,
                                        ),
                                        FloatingActionButton(
                                          heroTag: null,
                                          backgroundColor: const Color.fromARGB(
                                              255, 32, 106, 93),
                                          onPressed: () {
                                            e.selectedItem = quantityList[
                                                res.items.indexOf(e)];
                                            Provider.of<CartProvider>(context,
                                                    listen: false)
                                                .addToCart(items: e);
                                            Navigator.of(context).pop();
                                          },
                                          child: const Icon(
                                            Icons.add_shopping_cart,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 100,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            color: Color.fromARGB(
                                                255, 129, 178, 20)),
                                        height: 55,
                                        width: 175,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  if (quantityList[res.items
                                                          .indexOf(e)] >
                                                      1) {
                                                    setState(() {
                                                      quantityList[res.items
                                                          .indexOf(e)]--;
                                                    });
                                                  }
                                                },
                                                icon: const Icon(Icons.remove)),
                                            Text(
                                              "${quantityList[res.items.indexOf(e)]}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    quantityList[
                                                        res.items.indexOf(e)]++;
                                                  });
                                                },
                                                icon: const Icon(Icons.add)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      },
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
