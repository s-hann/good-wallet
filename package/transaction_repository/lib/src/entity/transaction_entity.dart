// ignore_for_file: sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

///
class TransactionEntity extends Equatable {
  ///
  const TransactionEntity({
    this.id,
    this.label,
    this.type,
    this.category,
    this.wallet,
    this.currency,
    this.amount,
    this.date,
    this.note,
  });

  ///
  final String? id;

  ///
  final String? label;

  ///
  final TransactionType? type;

  ///
  final String? category;

  ///
  final String? wallet;

  ///
  final String? currency;

  ///
  final double? amount;

  ///
  final DateTime? date;

  ///
  final String? note;

  ///
  TransactionEntity copyWith({
    String? id,
    String? label,
    TransactionType? type,
    String? category,
    String? wallet,
    String? currency,
    double? amount,
    DateTime? date,
    String? note,
  }) {
    return TransactionEntity(
      id: id ?? this.id,
      label: label ?? this.label,
      type: type ?? this.type,
      category: category ?? this.category,
      wallet: wallet ?? this.wallet,
      currency: currency ?? this.currency,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      note: note ?? this.note,
    );
  }

  @override
  List<Object?> get props => [
        id,
        label,
        type,
        category,
        wallet,
        currency,
        amount,
        date,
        note,
      ];

  ///
  factory TransactionEntity.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> data,
    _,
  ) {
    return TransactionEntity(
      id: data.id,
      label: data['label'] as String?,
      type: TransactionType.fromJson(data['type'] as String),
      category: data['category'] as String?,
      wallet: data['wallet'] as String?,
      currency: data['currency'] as String?,
      amount: (data['amount'] as num?)?.toDouble(),
      date: (data['date'] as Timestamp?)?.toDate(),
      note: data['note'] as String?,
    );
  }

  ///
  Map<String, dynamic> toFirestore() {
    return {
      'label': label,
      'type': type?.toJson(),
      'category': category,
      'wallet': wallet,
      'currency': currency ?? 'idr',
      'amount': amount,
      'date': date,
      'note': note,
    };
  }
}

///
enum TransactionType {
  ///
  income,

  ///
  expense,

  ///
  transfer;

  ///
  String toJson() => name;

  ///
  static TransactionType fromJson(String json) => values.byName(json);
}
