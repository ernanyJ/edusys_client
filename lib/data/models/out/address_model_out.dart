class AddressModelOut {
  final String street;
  final String number;
  final String neighborhood;
  final String city;
  final String state;
  final String zipCode;
  final String complement;
  final String country;
  final String reference;

  AddressModelOut(
      {required this.street,
      required this.number,
      required this.neighborhood,
      required this.city,
      required this.state,
      required this.zipCode,
      required this.complement,
      required this.country,
      required this.reference});

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'number': number,
      'neighborhood': neighborhood,
      'city': city,
      'state': state,
      'zipCode': zipCode,
      'complement': complement,
      'country': country,
      'reference': reference,
    };
  }
}
