//region imports
//author Bruno Tezine
//endregion

class EModule{
	int moduleType;
	String moduleName;
	bool enabled;

	EModule({
		this.moduleType,
		this.moduleName,
		this.enabled
});

	factory EModule.fromJson(Map<String, dynamic> json){
		return EModule(
			moduleType: json['moduleType'] as int,
			moduleName: json['moduleName'] as String,
			enabled: json['enabled'] as bool,
		);
	}

	Map<String, dynamic> toJson() {
		return <String, dynamic>{
			'moduleType': moduleType,
			'moduleName': moduleName,
			'enabled': enabled,
		};
	}}