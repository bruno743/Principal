import 'package:food_app/models/itemsModel.dart';
import 'package:food_app/providers/cartProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// Área de detalhamento do produto

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  TextStyle txtStyle = GoogleFonts.ubuntu(
    color: Colors.grey,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  bool favouriteStatus = false;

  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    ItemsModel res = ModalRoute.of(context)!.settings.arguments as ItemsModel;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 129, 178, 20),
      body: Column(
        children: [
          const SizedBox(height: 42),
          // Header
          Row(
            children: [
              const SizedBox(width: 12),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 45,
                  width: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                "Detalhes do lanche",
                style: GoogleFonts.ubuntu(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
            ],
          ),
          const Spacer(),
          Stack(
            alignment: const Alignment(0, -1.40),
            children: [
              // Informacoes do produto
              Container(
                height: height * 0.7,
                width: width,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 253, 218, 193),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(42),
                    topRight: Radius.circular(42),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.16),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${res.name}",
                              style: GoogleFonts.ubuntu(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Rs ${res.price}",
                              style: GoogleFonts.ubuntu(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 28),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                            color: Color.fromARGB(255, 32, 106, 93)),
                        height: 60,
                        width: 175,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {
                                if (quantity > 1) {
                                  setState(() {
                                    quantity--;
                                  });
                                }
                              },
                              icon: Icon(Icons.remove),
                              color: Colors.white,
                            ),
                            Text(
                              "${quantity}",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                                icon: Icon(Icons.add),
                                color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                    /*const SizedBox(height: 28),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("⭐ ${res.rating}", style: txtStyle),
                        Text(
                          "🩸 100 Kcal",
                          style: txtStyle,
                        ),
                        Text("⌚ 30 min", style: txtStyle),
                      ],
                    ),*/
                    const SizedBox(height: 44),
                    Text(
                      "Sobre",
                      style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      "${res.detail}",
                      style: GoogleFonts.ubuntu(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    const Spacer(),
                    // Botao de adicionar ao carrinho
                    Container(
                      height: 65,
                      width: width,
                      margin: const EdgeInsets.symmetric(vertical: 18),
                      child: ElevatedButton(
                        onPressed: () {
                          res.selectedItem = quantity;
                          Provider.of<CartProvider>(context, listen: false)
                              .addToCart(items: res);
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 129, 178, 20),
                          textStyle: GoogleFonts.ubuntu(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        child: const Text("Adicionar ao carrinho"),
                      ),
                    ),
                  ],
                ),
              ),
              // Imagem do produto
              Container(
                height: 175,
                width: 175,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage(res.image))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
