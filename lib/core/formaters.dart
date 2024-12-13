import 'package:edusys_client/domain/entities/address_entity.dart';

String formatDate(DateTime? date) {
  if (date == null) return '';

  if (date.month <= 9) {
    return '${date.day}/0${date.month}/${date.year}';
  }

  if(date.day <= 9 && date.month <= 9){
    return '0${date.day}/${date.month}/${date.year}';
  }

  if(date.day <= 9){
    return '0${date.day}/${date.month}/${date.year}';
  }

  return '${date.day}/${date.month}/${date.year}';
}

String formatAddress(AddressEntity address){
  return '${address.street}, ${address.number} - ${address.neighborhood}, ${address.city} - ${address.state}';
}

String formatDay(DateTime date) {
   if (date.month < 9) {
    return '0${date.day}';
  }
  return '${date.day}';
}