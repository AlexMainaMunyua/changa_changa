// ignore_for_file: non_constant_identifier_names

class Account {
  String? account_no;
  String? account_type;
  String? is_verified;
  String? verified_date_utc;
  String? verification_status_id;

  Account({
    this.account_no,
    this.account_type,
    this.is_verified,
    this.verified_date_utc,
    this.verification_status_id,
  });
}