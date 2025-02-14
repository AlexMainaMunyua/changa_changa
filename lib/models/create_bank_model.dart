import 'dart:io';

class VerificationDocumentModel {
  File? verificationDocument;
  String? bankAccountNumber;
  int? bankId;
  String? branchName;

  VerificationDocumentModel({
     this.verificationDocument,
     this.bankAccountNumber,
     this.bankId,
     this.branchName,
  });

  factory VerificationDocumentModel.fromJson(Map<String, dynamic> json) {
    return VerificationDocumentModel(
      verificationDocument: json['verification_document'],
      bankAccountNumber: json['bank_account_number'],
      bankId: json['bank_id'],
      branchName: json['branch_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'verification_document': verificationDocument,
      'bank_account_number': bankAccountNumber,
      'bank_id': bankId,
      'branch_name': branchName,
    };
  }

  @override
  String toString() {
    return 'VerificationDocumentModel{verificationDocument: $verificationDocument, bankAccountNumber: $bankAccountNumber, bankId: $bankId, branchName: $branchName}';
  }
}
