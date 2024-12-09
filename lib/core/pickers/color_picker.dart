
import 'package:edusys_client/enums/tuition_fee_status.dart';
import 'package:flutter/material.dart';

Color colorPicker(TuitionFeeStatus? status) {
    if (status == TuitionFeeStatus.PAID) {
      return Colors.green;
    } else if (status == TuitionFeeStatus.PENDING) {
      return Colors.yellow[800]!;
    } else if (status == TuitionFeeStatus.LATE) {
      return Colors.red;
    } else {
      return Colors.black;
    }
    
  }


    Text textPicker(TuitionFeeStatus? status) {
    if (status == TuitionFeeStatus.PAID) {
      return const Text('Mensalidade atual paga', style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600));
    } else if (status == TuitionFeeStatus.PENDING) {
      return Text('Mensalidade atual pendente',  style: TextStyle(color: Colors.yellow[800], fontWeight: FontWeight.w600));
    } else if (status == TuitionFeeStatus.LATE) {
      return const Text('Mensalidade atual atrasada',  style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600));
    } else {
      return const Text('Não possui mensalidade',  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600));
    }
  }