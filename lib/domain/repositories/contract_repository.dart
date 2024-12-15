import 'package:edusys_client/domain/entities/contract_entity.dart';

abstract interface class ContractRepository {
  
  Future<List<ContractEntity>> getContracts();
  
}