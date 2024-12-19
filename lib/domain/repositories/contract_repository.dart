import 'package:edusys_client/data/models/out/contract_model_out.dart';
import 'package:edusys_client/domain/entities/contract_entity.dart';

abstract interface class ContractRepository {
  
  Future<List<ContractEntity>> getContracts();

  Future<void> addContract(ContractModelOut contract);
  
}