enum TuitionFeeStatus {
  PAID('Pago'),
  PENDING('Pendente'),
  LATE('Atrasado');

  final String value;

  const TuitionFeeStatus(this.value);
}
