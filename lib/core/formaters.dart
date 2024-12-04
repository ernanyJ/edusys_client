import 'package:edusys_client/domain/entities/address_entity.dart';

String formatDate(DateTime? date) {
  if (date == null) return '';

  if (date.month < 9) {
    return '${date.day}/0${date.month}/${date.year}';
  }

  return '${date.day}/${date.month}/${date.year}';
}

String formatAddress(AddressEntity address){
  return '${address.street}, ${address.number} - ${address.neighborhood}, ${address.city} - ${address.state}';
}