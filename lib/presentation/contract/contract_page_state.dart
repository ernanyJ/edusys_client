import 'package:edusys_client/data/repositories/contract_repository_impl.dart';
import 'package:edusys_client/domain/entities/contract_entity.dart';
import 'package:flutter/material.dart';

class ContractPageState extends ChangeNotifier {
  final ContractRepositoryImpl _repository = ContractRepositoryImpl();

  final _contracts = <ContractEntity>[];
  List<ContractEntity> get contracts => _contracts;

  Future<void> getContracts() async {
    _contracts.clear();
    _contracts.addAll(await _repository.getContracts());
    notifyListeners();
  }
}
