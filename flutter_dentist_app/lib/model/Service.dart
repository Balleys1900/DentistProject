class Service {
  final String id;
  final String name;
  final String image;

  Service({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Service.fromJson(Map<dynamic, dynamic> json) {
    return Service(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
    );
  }
}

List<Service> listServiceInstance = [];
