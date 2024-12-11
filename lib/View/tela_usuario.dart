import 'package:flutter/material.dart';

class TelaUsuario extends StatelessWidget {
  const TelaUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do Usuário'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 206, 223, 240),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                child: Image.asset('assets/images/man.png'),
              ),
              SizedBox(height: 20),
              Text(
                'Roger Lemos',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 121, 186, 240)),
              ),
              SizedBox(height: 10),
              Text(
                'rogeralveslemos@gmail.com',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 160, 212, 255),
                ),
                child: Text(
                  'Editar Perfil',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Sobre mim',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 147, 195, 235)),
              ),
              SizedBox(height: 10),
              Text(
                'A procura de um Pet companheiro.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 253, 253, 253),
    );
  }
}
