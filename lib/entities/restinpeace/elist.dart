//region imports
//author Bruno Tezine
//endregion

class EList{
	int totalListCount;
	dynamic items;

	EList({
		this.totalListCount,
		this.items
});

	factory EList.fromJson(Map<String, dynamic> json){
		return EList(
			totalListCount: json['totalListCount'] as int,
			items: json['items'] as dynamic,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'totalListCount': totalListCount,
			'items': items,
		};
	}}