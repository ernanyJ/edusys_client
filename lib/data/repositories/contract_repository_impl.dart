import 'package:edusys_client/data/datasources/contract_datasource.dart';
import 'package:edusys_client/domain/converters/contract_converter.dart';
import 'package:edusys_client/domain/entities/contract_entity.dart';
import 'package:edusys_client/domain/repositories/contract_repository.dart';

class ContractRepositoryImpl implements ContractRepository {
  
  ContractDatasource contractDatasource = ContractDatasource(); 
  ContractInConverter inConverter = ContractInConverter();
  
  @override
  Future<List<ContractEntity>> getContracts() {
    return contractDatasource.getContracts().then((e) => e.map((e) => inConverter.convert(e)).toList());
  }
  
}