//region imports
//author Bruno Tezine
import 'package:saberlab_frontend_web/entities/restinpeace/eiugubankslip.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/eiuguaccountcreditcard.dart';
//endregion

class EIuguConfiguration{
	bool auto_withdraw;
	bool payment_email_notification;
	String payment_email_notification_receiver;
	bool auto_advance;
	dynamic auto_advance_type;
	int auto_advance_option;
	String commission_percent;
	dynamic owner_emails_to_notify;
	bool fines;
	int late_payment_fine;
	bool per_day_interest;
	EIuguBankSlip bank_slip;
	EIuguAccountCreditCard credit_card;
	bool early_payment_discount;
	dynamic early_payment_discount_days;
	dynamic early_payment_discount_percent;

	EIuguConfiguration({
		this.auto_withdraw,
		this.payment_email_notification,
		this.payment_email_notification_receiver,
		this.auto_advance,
		this.auto_advance_type,
		this.auto_advance_option,
		this.commission_percent,
		this.owner_emails_to_notify,
		this.fines,
		this.late_payment_fine,
		this.per_day_interest,
		this.bank_slip,
		this.credit_card,
		this.early_payment_discount,
		this.early_payment_discount_days,
		this.early_payment_discount_percent
});

	factory EIuguConfiguration.fromJson(Map<String, dynamic> json){
		return EIuguConfiguration(
			auto_withdraw: json['auto_withdraw'] as bool,
			payment_email_notification: json['payment_email_notification'] as bool,
			payment_email_notification_receiver: json['payment_email_notification_receiver'] as String,
			auto_advance: json['auto_advance'] as bool,
			auto_advance_type: json['auto_advance_type'] as dynamic,
			auto_advance_option: json['auto_advance_option'] as int,
			commission_percent: json['commission_percent'] as String,
			owner_emails_to_notify: json['owner_emails_to_notify'] as dynamic,
			fines: json['fines'] as bool,
			late_payment_fine: json['late_payment_fine'] as int,
			per_day_interest: json['per_day_interest'] as bool,
			bank_slip: json['bank_slip'] as EIuguBankSlip == null ? null : EIuguBankSlip.fromJson(json['bank_slip'] as Map<String, dynamic>),
			credit_card: json['credit_card'] as EIuguAccountCreditCard == null ? null : EIuguAccountCreditCard.fromJson(json['credit_card'] as Map<String, dynamic>),
			early_payment_discount: json['early_payment_discount'] as bool,
			early_payment_discount_days: json['early_payment_discount_days'] as dynamic,
			early_payment_discount_percent: json['early_payment_discount_percent'] as dynamic,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'auto_withdraw': auto_withdraw,
			'payment_email_notification': payment_email_notification,
			'payment_email_notification_receiver': payment_email_notification_receiver,
			'auto_advance': auto_advance,
			'auto_advance_type': auto_advance_type,
			'auto_advance_option': auto_advance_option,
			'commission_percent': commission_percent,
			'owner_emails_to_notify': owner_emails_to_notify,
			'fines': fines,
			'late_payment_fine': late_payment_fine,
			'per_day_interest': per_day_interest,
			'bank_slip': bank_slip,
			'credit_card': credit_card,
			'early_payment_discount': early_payment_discount,
			'early_payment_discount_days': early_payment_discount_days,
			'early_payment_discount_percent': early_payment_discount_percent,
		};
	}}