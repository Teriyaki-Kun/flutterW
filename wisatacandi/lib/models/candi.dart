class Candi {
  final String name;
  final String location;
  final String description;
  final String built;
  final String type;
  final String imageAsset;
  final List<String> imageUrls;
  bool isFavorite;

  Candi({
    required this.name,
    required this.location,
    required this.description,
    required this.built,
    required this.type,
    required this.imageAsset,
    required this.imageUrls,
    this.isFavorite = false,
  });

  // Convert Candi object to Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location': location,
      'description': description,
      'built': built,
      'type': type,
      'imageAsset': imageAsset,
      'imageUrls': imageUrls.join(','), // Convert list to comma-separated string
      'isFavorite': isFavorite ? 1 : 0,
    };
  }

  // Create Candi object from Map
  factory Candi.fromMap(Map<String, dynamic> map) {
    return Candi(
      name: map['name'],
      location: map['location'],
      description: map['description'],
      built: map['built'],
      type: map['type'],
      imageAsset: map['imageAsset'],
      imageUrls: map['imageUrls'].split(','), // Convert comma-separated string back to list
      isFavorite: map['isFavorite'] == 1,
    );
  }
}

