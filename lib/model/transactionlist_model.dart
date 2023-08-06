class TransactionData {
  final String? errorFlag;
  final String message;
  final bool hasMore;
  final List<Transaction> data;

  TransactionData({
    required this.errorFlag,
    required this.message,
    required this.hasMore,
    required this.data,
  });

  factory TransactionData.fromJson(json) {
    return TransactionData(
      errorFlag: json['error_flag']??"",
      message: json['message']??"",
      hasMore: json['has_more']??false,
      data: List<Transaction>.from(
        json['data'].map((transactionJson) => Transaction.fromJson(transactionJson)),
      ),
    );
  }
}

class Transaction {
  final String id;
  final String amount;
  final String status;
  final String sourceId;
  final String sourceType;
  final String transactionType;
  final String currency;
  final String createdAt;
  final double fee;
  final String description;
  final String? settledAt;
  final String estimatedSettledAt;
  final String currency1;

  Transaction({
    required this.id,
    required this.amount,
    required this.status,
    required this.sourceId,
    required this.sourceType,
    required this.transactionType,
    required this.currency,
    required this.createdAt,
    required this.fee,
    required this.description,
    this.settledAt,
    required this.estimatedSettledAt,
    required this.currency1,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id']??"",
      amount: json['amount']??"",
      status: json['status']??"",
      sourceId: json['sourceId']??"",
      sourceType: json['sourceType']??"",
      transactionType: json['transactionType']??"",
      currency: json['currency']??"",
      createdAt: json['createdAt']??"",
      fee: json['fee'].toDouble()??0.0,
      description: json['description']??"",
      estimatedSettledAt: json['estimatedSettledAt']??"",
      currency1: json['currency1']??"",
    );
  }
}
