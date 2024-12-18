import 'package:edusys_client/domain/entities/address_entity.dart';
import 'package:edusys_client/exceptions/invalid_input.dart';

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

DateTime parseDate(String date) {
  final dateParts = date.split('/');
  if(dateParts.length != 3) throw InvalidInput('Data inválida');
  return DateTime(int.parse(dateParts[2]), int.parse(dateParts[1]), int.parse(dateParts[0]));
}