import 'package:flutter/material.dart';
import 'package:projeto_flutter/View/dashboard.dart';
import 'package:projeto_flutter/View/telaCards.dart';
import 'package:projeto_flutter/models/card_pet.dart';

class CardDetalhePet extends StatelessWidget {
  final String dogName;
  final String dogAge;
  final String imageUrl;

  const CardDetalhePet({
    required this.dogName,
    required this.dogAge,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 250, 247, 247),
                    ),
                    child: Stack(
                      children: [
                        Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error,
                                size: 100, color: Colors.red);
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [ 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Nome: ${dogName.toUpperCase()}",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Icon(Icons.favorite_border)
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 290.0),
                          child: Text(
                            dogAge.toString(),
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 1,
                              color: const Color.fromARGB(255, 204, 196, 196)),
                          top: BorderSide(
                              width: 1,
                              color: const Color.fromARGB(255, 204, 196, 196)),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 253, bottom: 8.0, top: 8.0),
                            child: Text(
                              "Descricao",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 13.0),
                            child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse vehicula sem eros, in pharetra mi venenatis in. Vivamus imperdiet diam ut justo suscipit, ac vehicula augue eleifend. Aliquam dapibus ac dui sed auctor. Nullam hendrerit convallis elit, ut gravida ante auctor molestie. In feugiat enim eget molestie aliquet. "),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Container(
                      width: 340,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 160, 212, 255),
                      ),
                      child: TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 240, 240, 240)),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                          );
                        },
                        child: Text(
                          'Voltar',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
