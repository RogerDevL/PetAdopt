import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:projeto_flutter/View/cadastro_pet.dart';
import 'package:projeto_flutter/View/card_detalhe_pet.dart';
import 'package:projeto_flutter/View/dashboard.dart';
import 'package:projeto_flutter/View/telaLogin.dart';
import 'package:projeto_flutter/View/tela_usuario.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_flutter/models/card_pet.dart';
import 'package:projeto_flutter/widgets/card_animals.dart';
 // Import da página de detalhes

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> animals = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchAnimals();
  }

  Future<void> fetchAnimals() async {
    const String apiUrl = 'https://pet-adopt-dq32j.ondigitalocean.app/pet/pets';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          animals = data['pets'];
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage =
              'Falha ao carregar os dados. Código: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Erro: $e';
        isLoading = false;
      });
    }
  }

  String getFirstImage(dynamic images) {
    if (images is List && images.isNotEmpty) {
      return images[0];
    }
    return 'https://via.placeholder.com/150';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 235, 235, 235),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  color: const Color.fromARGB(255, 206, 223, 240),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Pet Adopt",
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 145.0),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dashboard()),
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.person_rounded),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TelaUsuario()),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Pesquisar',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Text(
                        "Pets",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(Icons.pets),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          isLoading
                              ? Center(child: CircularProgressIndicator())
                              : animals.isEmpty
                                  ? Center(
                                                                          child: Text(
                                        'Nenhum pet encontrado.',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    )
                                  : GridView.builder(
                                      shrinkWrap: true,
                                      primary: false,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: animals.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.8,
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                      ),
                                      itemBuilder: (context, index) {
                                        CardModel pet =
                                            CardModel.fromJson(animals[index]);
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => CardDetalhePet(
                                                  dogName: pet.name,
                                                  dogAge: pet.age != null
                                                      ? '${pet.age} meses'
                                                      : 'Idade desconhecida',
                                                  imageUrl: getFirstImage(pet.images),
                                                ),
                                              ),
                                            );
                                          },
                                          child: CardAnimals(
                                            name: pet.name,
                                            age: 'Idade: ${pet.age} | ',
                                            color: 'Cor: ${pet.color} ',
                                            imagePath: pet.imageUrl,
                                          ),
                                        );
                                      },
                                    ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  width: double.infinity,
                  color: const Color.fromARGB(255, 220, 232, 243),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text("Você realmente não pode manter esse animal?"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Telalogin()),
                            );
                          },
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CadastroPet()),
                              );
                            },
                            child: Text(
                              "Divulgue",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
                                     