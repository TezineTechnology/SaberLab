//region imports
//author Bruno Tezine
import 'package:saberlab_frontend_web/entities/restinpeace/eiuguconfiguration.dart';
import 'package:saberlab_frontend_web/entities/restinpeace/eiuguinformation.dart';
//endregion

class EIuguGetAccountInfoResponse{
	String id;
	String name;
	bool is_verified;
	DateTime created_at;
	DateTime updated_at;
	String last_verification_request_status;
	dynamic last_verification_request_data;
	dynamic last_verification_request_feedback;
	int change_plan_type;
	int subscriptions_trial_period;
	dynamic subscriptions_billing_days;
	bool disable_emails;
	dynamic last_withdraw;
	String reply_to;
	bool webapp_on_test_mode;
	bool marketplace;
	dynamic default_return_url;
	bool credit_card_verified;
	bool fines;
	int late_payment_fine;
	bool per_day_interest;
	bool old_advancement;
	bool early_payment_discount;
	dynamic early_payment_discount_days;
	dynamic early_payment_discount_percent;
	bool auto_withdraw;
	bool payment_email_notification;
	String payment_email_notification_receiver;
	bool auto_advance;
	dynamic auto_advance_type;
	int auto_advance_option;
	String balance;
	String balance_in_protest;
	String balance_available_for_withdraw;
	String protected_balance;
	String payable_balance;
	String receivable_balance;
	String commission_balance;
	String volume_last_month;
	String volume_this_month;
	int total_subscriptions;
	int total_active_subscriptions;
	String taxes_paid_last_month;
	String taxes_paid_this_month;
	dynamic permissions;
	dynamic custom_logo_url;
	dynamic custom_logo_small_url;
	EIuguConfiguration configuration;
	dynamic commissions;
	dynamic early_payment_discounts;
	EIuguInformation informations;

	EIuguGetAccountInfoResponse({
		this.id,
		this.name,
		this.is_verified,
		this.created_at,
		this.updated_at,
		this.last_verification_request_status,
		this.last_verification_request_data,
		this.last_verification_request_feedback,
		this.change_plan_type,
		this.subscriptions_trial_period,
		this.subscriptions_billing_days,
		this.disable_emails,
		this.last_withdraw,
		this.reply_to,
		this.webapp_on_test_mode,
		this.marketplace,
		this.default_return_url,
		this.credit_card_verified,
		this.fines,
		this.late_payment_fine,
		this.per_day_interest,
		this.old_advancement,
		this.early_payment_discount,
		this.early_payment_discount_days,
		this.early_payment_discount_percent,
		this.auto_withdraw,
		this.payment_email_notification,
		this.payment_email_notification_receiver,
		this.auto_advance,
		this.auto_advance_type,
		this.auto_advance_option,
		this.balance,
		this.balance_in_protest,
		this.balance_available_for_withdraw,
		this.protected_balance,
		this.payable_balance,
		this.receivable_balance,
		this.commission_balance,
		this.volume_last_month,
		this.volume_this_month,
		this.total_subscriptions,
		this.total_active_subscriptions,
		this.taxes_paid_last_month,
		this.taxes_paid_this_month,
		this.permissions,
		this.custom_logo_url,
		this.custom_logo_small_url,
		this.configuration,
		this.commissions,
		this.early_payment_discounts,
		this.informations
});

	factory EIuguGetAccountInfoResponse.fromJson(Map<String, dynamic> json){
		return EIuguGetAccountInfoResponse(
			id: json['id'] as String,
			name: json['name'] as String,
			is_verified: json['is_verified'] as bool,
			created_at: DateTime.parse(json['created_at'] as String),
			updated_at: DateTime.parse(json['updated_at'] as String),
			last_verification_request_status: json['last_verification_request_status'] as String,
			last_verification_request_data: json['last_verification_request_data'] as dynamic,
			last_verification_request_feedback: json['last_verification_request_feedback'] as dynamic,
			change_plan_type: json['change_plan_type'] as int,
			subscriptions_trial_period: json['subscriptions_trial_period'] as int,
			subscriptions_billing_days: json['subscriptions_billing_days'] as dynamic,
			disable_emails: json['disable_emails'] as bool,
			last_withdraw: json['last_withdraw'] as dynamic,
			reply_to: json['reply_to'] as String,
			webapp_on_test_mode: json['webapp_on_test_mode'] as bool,
			marketplace: json['marketplace'] as bool,
			default_return_url: json['default_return_url'] as dynamic,
			credit_card_verified: json['credit_card_verified'] as bool,
			fines: json['fines'] as bool,
			late_payment_fine: json['late_payment_fine'] as int,
			per_day_interest: json['per_day_interest'] as bool,
			old_advancement: json['old_advancement'] as bool,
			early_payment_discount: json['early_payment_discount'] as bool,
			early_payment_discount_days: json['early_payment_discount_days'] as dynamic,
			early_payment_discount_percent: json['early_payment_discount_percent'] as dynamic,
			auto_withdraw: json['auto_withdraw'] as bool,
			payment_email_notification: json['payment_email_notification'] as bool,
			payment_email_notification_receiver: json['payment_email_notification_receiver'] as String,
			auto_advance: json['auto_advance'] as bool,
			auto_advance_type: json['auto_advance_type'] as dynamic,
			auto_advance_option: json['auto_advance_option'] as int,
			balance: json['balance'] as String,
			balance_in_protest: json['balance_in_protest'] as String,
			balance_available_for_withdraw: json['balance_available_for_withdraw'] as String,
			protected_balance: json['protected_balance'] as String,
			payable_balance: json['payable_balance'] as String,
			receivable_balance: json['receivable_balance'] as String,
			commission_balance: json['commission_balance'] as String,
			volume_last_month: json['volume_last_month'] as String,
			volume_this_month: json['volume_this_month'] as String,
			total_subscriptions: json['total_subscriptions'] as int,
			total_active_subscriptions: json['total_active_subscriptions'] as int,
			taxes_paid_last_month: json['taxes_paid_last_month'] as String,
			taxes_paid_this_month: json['taxes_paid_this_month'] as String,
			permissions: json['permissions'] as dynamic,
			custom_logo_url: json['custom_logo_url'] as dynamic,
			custom_logo_small_url: json['custom_logo_small_url'] as dynamic,
			configuration: json['configuration'] as EIuguConfiguration == null ? null : EIuguConfiguration.fromJson(json['configuration'] as Map<String, dynamic>),
			commissions: json['commissions'] as dynamic,
			early_payment_discounts: json['early_payment_discounts'] as dynamic,
			informations: json['informations'] as EIuguInformation == null ? null : EIuguInformation.fromJson(json['informations'] as Map<String, dynamic>),
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'name': name,
			'is_verified': is_verified,
			'created_at': created_at?.toIso8601String(),
			'updated_at': updated_at?.toIso8601String(),
			'last_verification_request_status': last_verification_request_status,
			'last_verification_request_data': last_verification_request_data,
			'last_verification_request_feedback': last_verification_request_feedback,
			'change_plan_type': change_plan_type,
			'subscriptions_trial_period': subscriptions_trial_period,
			'subscriptions_billing_days': subscriptions_billing_days,
			'disable_emails': disable_emails,
			'last_withdraw': last_withdraw,
			'reply_to': reply_to,
			'webapp_on_test_mode': webapp_on_test_mode,
			'marketplace': marketplace,
			'default_return_url': default_return_url,
			'credit_card_verified': credit_card_verified,
			'fines': fines,
			'late_payment_fine': late_payment_fine,
			'per_day_interest': per_day_interest,
			'old_advancement': old_advancement,
			'early_payment_discount': early_payment_discount,
			'early_payment_discount_days': early_payment_discount_days,
			'early_payment_discount_percent': early_payment_discount_percent,
			'auto_withdraw': auto_withdraw,
			'payment_email_notification': payment_email_notification,
			'payment_email_notification_receiver': payment_email_notification_receiver,
			'auto_advance': auto_advance,
			'auto_advance_type': auto_advance_type,
			'auto_advance_option': auto_advance_option,
			'balance': balance,
			'balance_in_protest': balance_in_protest,
			'balance_available_for_withdraw': balance_available_for_withdraw,
			'protected_balance': protected_balance,
			'payable_balance': payable_balance,
			'receivable_balance': receivable_balance,
			'commission_balance': commission_balance,
			'volume_last_month': volume_last_month,
			'volume_this_month': volume_this_month,
			'total_subscriptions': total_subscriptions,
			'total_active_subscriptions': total_active_subscriptions,
			'taxes_paid_last_month': taxes_paid_last_month,
			'taxes_paid_this_month': taxes_paid_this_month,
			'permissions': permissions,
			'custom_logo_url': custom_logo_url,
			'custom_logo_small_url': custom_logo_small_url,
			'configuration': configuration,
			'commissions': commissions,
			'early_payment_discounts': early_payment_discounts,
			'informations': informations,
		};
	}}