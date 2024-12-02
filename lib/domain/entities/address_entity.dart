class AddressEntity {
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

  AddressEntity({
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
}
