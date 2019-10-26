//region imports
//author Bruno Tezine
//endregion

class EDeliveryProduct{
	String id;
	String companyID;
	String categoryID;
	String name;
	int unitPrice;
	String brief;
	String description;
	bool available;
	bool allowHalf;
	String option1ParentGroupID;
	String option2ParentGroupID;
	String option3ParentGroupID;
	String addon1ParentGroupID;
	String addon2ParentGroupID;
	String addon3ParentGroupID;
	DateTime creationDateUTC;
	DateTime modificationDateUTC;
	String pictureURL;
	bool isCategory;
	String categoryName;
	int selectedQuantity;
	String option1ParentGroupName;
	String option2ParentGroupName;
	String addon1ParentGroupName;
	String addon2ParentGroupName;
	String addon3ParentGroupName;

	EDeliveryProduct({
		this.id,
		this.companyID,
		this.categoryID,
		this.name,
		this.unitPrice,
		this.brief,
		this.description,
		this.available,
		this.allowHalf,
		this.option1ParentGroupID,
		this.option2ParentGroupID,
		this.option3ParentGroupID,
		this.addon1ParentGroupID,
		this.addon2ParentGroupID,
		this.addon3ParentGroupID,
		this.creationDateUTC,
		this.modificationDateUTC,
		this.pictureURL,
		this.isCategory,
		this.categoryName,
		this.selectedQuantity,
		this.option1ParentGroupName,
		this.option2ParentGroupName,
		this.addon1ParentGroupName,
		this.addon2ParentGroupName,
		this.addon3ParentGroupName
});

	factory EDeliveryProduct.fromJson(Map<String, dynamic> json){
		return EDeliveryProduct(
			id: json['id'] as String,
			companyID: json['companyID'] as String,
			categoryID: json['categoryID'] as String,
			name: json['name'] as String,
			unitPrice: json['unitPrice'] as int,
			brief: json['brief'] as String,
			description: json['description'] as String,
			available: json['available'] as bool,
			allowHalf: json['allowHalf'] as bool,
			option1ParentGroupID: json['option1ParentGroupID'] as String,
			option2ParentGroupID: json['option2ParentGroupID'] as String,
			option3ParentGroupID: json['option3ParentGroupID'] as String,
			addon1ParentGroupID: json['addon1ParentGroupID'] as String,
			addon2ParentGroupID: json['addon2ParentGroupID'] as String,
			addon3ParentGroupID: json['addon3ParentGroupID'] as String,
			creationDateUTC: DateTime.parse(json['creationDateUTC'] as String),
			modificationDateUTC: DateTime.parse(json['modificationDateUTC'] as String),
			pictureURL: json['pictureURL'] as String,
			isCategory: json['isCategory'] as bool,
			categoryName: json['categoryName'] as String,
			selectedQuantity: json['selectedQuantity'] as int,
			option1ParentGroupName: json['option1ParentGroupName'] as String,
			option2ParentGroupName: json['option2ParentGroupName'] as String,
			addon1ParentGroupName: json['addon1ParentGroupName'] as String,
			addon2ParentGroupName: json['addon2ParentGroupName'] as String,
			addon3ParentGroupName: json['addon3ParentGroupName'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'id': id,
			'companyID': companyID,
			'categoryID': categoryID,
			'name': name,
			'unitPrice': unitPrice,
			'brief': brief,
			'description': description,
			'available': available,
			'allowHalf': allowHalf,
			'option1ParentGroupID': option1ParentGroupID,
			'option2ParentGroupID': option2ParentGroupID,
			'option3ParentGroupID': option3ParentGroupID,
			'addon1ParentGroupID': addon1ParentGroupID,
			'addon2ParentGroupID': addon2ParentGroupID,
			'addon3ParentGroupID': addon3ParentGroupID,
			'creationDateUTC': creationDateUTC?.toIso8601String(),
			'modificationDateUTC': modificationDateUTC?.toIso8601String(),
			'pictureURL': pictureURL,
			'isCategory': isCategory,
			'categoryName': categoryName,
			'selectedQuantity': selectedQuantity,
			'option1ParentGroupName': option1ParentGroupName,
			'option2ParentGroupName': option2ParentGroupName,
			'addon1ParentGroupName': addon1ParentGroupName,
			'addon2ParentGroupName': addon2ParentGroupName,
			'addon3ParentGroupName': addon3ParentGroupName,
		};
	}}