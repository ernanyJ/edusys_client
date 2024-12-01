class AddressModel {
  final int id;
  final String street;
  final String city;
  final String state;
  final String zipCode;
  final String country;
  final String number;
  final String complement;
  final String neighborhood;
  final String reference;

  AddressModel({
    required this.id,
    required this.street,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
    required this.number,
    required this.complement,
    required this.neighborhood,
    required this.reference,
  });

  // Método para converter de JSON para AddressModel
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'] as int,
      street: json['street'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      zipCode: json['zipCode'] as String,
      country: json['country'] as String,
      number: json['number'] as String,
      complement: json['complement'] as String,
      neighborhood: json['neighborhood'] as String,
      reference: json['reference'] as String,
    );
  }

  // Método para converter AddressModel para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'street': street,
      'city': city,
      'state': state,
      'zipCode': zipCode,
      'country': country,
      'number': number,
      'complement': complement,
      'neighborhood': neighborhood,
      'reference': reference,
    };
  }
}
