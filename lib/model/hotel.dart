class Hotel {
  int id;
  String name;
  String place;
  double rating;
  int cost;
  String? popularamenities;
  String hotelimages;
  dynamic availableroomtype;
  String description;
  String cancellationpolicy;
  String rulesandregulations;
  dynamic reviews;

  Hotel({
    required this.id,
    required this.name,
    required this.place,
    required this.rating,
    this.popularamenities,
    required this.cost,
    required this.hotelimages,
    this.availableroomtype,
    required this.description,
    required this.cancellationpolicy,
    required this.rulesandregulations,
    this.reviews,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'],
      name: json['hotelname'],
      place: json['hotellocation'],
      rating: double.parse(json['hotelrating']),
      popularamenities: json['popularamenities'],
      hotelimages: json['hotelimages'],
      cost: json['cost'],
      availableroomtype: json['availableroomtype'],
      description: json['hoteldescription'],
      cancellationpolicy: json['cancellationpolicy'],
      rulesandregulations: json['rulesandregulations'],
      reviews: json['reviews'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hotelname': name,
      'hotellocation': place,
      'hotelrating': rating,
      'popularamenities': popularamenities,
      'hotelimages': hotelimages,
      'cost': cost,
      'availableroomtype': availableroomtype,
      'hoteldescription': description,
      'cancellationpolicy': cancellationpolicy,
      'rulesandregulations': rulesandregulations,
      'reviews': reviews,
    };
  }
}
