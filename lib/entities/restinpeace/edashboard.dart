//region imports
//author Bruno Tezine
//endregion

class EDashboard{
	int clients;
	int billsToPay;
	int billsToReceive;
	int suppliers;
	int employees;
	int proposals;
	int orders;
	int products;
	int categories;

	EDashboard({
		this.clients,
		this.billsToPay,
		this.billsToReceive,
		this.suppliers,
		this.employees,
		this.proposals,
		this.orders,
		this.products,
		this.categories
});

	factory EDashboard.fromJson(Map<String, dynamic> json){
		return EDashboard(
			clients: json['clients'] as int,
			billsToPay: json['billsToPay'] as int,
			billsToReceive: json['billsToReceive'] as int,
			suppliers: json['suppliers'] as int,
			employees: json['employees'] as int,
			proposals: json['proposals'] as int,
			orders: json['orders'] as int,
			products: json['products'] as int,
			categories: json['categories'] as int,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'clients': clients,
			'billsToPay': billsToPay,
			'billsToReceive': billsToReceive,
			'suppliers': suppliers,
			'employees': employees,
			'proposals': proposals,
			'orders': orders,
			'products': products,
			'categories': categories,
		};
	}}