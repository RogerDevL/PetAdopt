import 'package:flutter/material.dart';

class CardAnimals extends StatelessWidget {
  final String name;
  final String age;
  final String color;
  final String imagePath;

  const CardAnimals({
    Key? key,
    required this.name,
    required this.age,
    required this.color,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 140,
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Image.network(
            imagePath,
            height: 80,
            fit: BoxFit.fill,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                height: 80,
                width: 140,
                alignment: Alignment.center,
                color: Colors.grey[300],
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                      : null,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return _fallbackImage();
            },
          ),
          SizedBox(height: 5),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$age | $color',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Icon(Icons.favorite_border),
        ],
      ),
    );
  }

  Widget _fallbackImage() {
    return Container(
      height: 80,
      width: 140,
      alignment: Alignment.center,
      color: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.broken_image, size: 50, color: Colors.grey[600]),
          SizedBox(height: 8),
          Text(
            'Imagem inválida.',
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
        ],
      ),
    );
  }
}
