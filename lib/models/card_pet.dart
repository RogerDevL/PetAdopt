class CardModel {
  final String name;
  final int age;
  final double weight;
  final String color;
  final List<String> images;

  CardModel({
    required this.name,
    required this.age,
    required this.weight,
    required this.color,
    required this.images,
  });

  /// Converte um JSON em uma instância de [PetModel].
  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      name: json['name'] ?? 'Unknown', // Nome padrão se for null
      age: json['age'] ?? 0, // Idade padrão
      weight: (json['weight'] ?? 0)
          .toDouble(), // Peso padrão, convertido para double
      color: json['color'] ?? 'Unknown',
      images: List<String>.from(
          json['images'] ?? []), // Garante uma lista vazia se null
    );
  }

  /// Converte uma instância de [PetModel] em JSON.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'weight': weight,
      'color': color,
      'images': images,
    };
  }

  /// Retorna a URL da imagem principal (primeira imagem na lista).
  String get imageUrl {
    return images.isNotEmpty
        ? images[0]
        : ''; // Retorna a primeira imagem ou vazio
  }

  /// Retorna uma descrição fixa ou personalizada para o pet.
  String get description {
    return "Este é um pet adorável que está à espera de um lar.";
  }

  /// Retorna o gênero do pet, fixo ou baseado na lógica da aplicação.
  String get gender {
    return "Masculino"; // Exemplo fixo; ajuste conforme necessário
  }
}
