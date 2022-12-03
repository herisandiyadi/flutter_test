class OrderModels {
  OrderModels(
      {this.id,
      required this.name,
      required this.amountBean,
      required this.levelGrind,
      required this.levelSugar,
      required this.amount,
      this.total,
      required this.status,
      required this.serve});
  int? id;
  String name;
  String amountBean;
  String levelGrind;
  String levelSugar;
  int amount;
  int? total;
  String serve;
  String status;

  factory OrderModels.fromJson(Map<String, dynamic> json) => OrderModels(
        id: json["id"],
        name: json["name"],
        amountBean: json["amount_bean"],
        levelGrind: json["level_grind"],
        levelSugar: json["level_sugar"],
        amount: json["amount"],
        total: json["total"],
        status: json["status"],
        serve: json["serve"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "amount_bean": amountBean,
        "level_grind": levelGrind,
        "level_sugar": levelSugar,
        "amount": amount,
        "total": total,
        "status": status,
        "serve": serve,
      };

  Map<String, dynamic> toMap() => {
        "name": name,
        "amount_bean": amountBean,
        "level_grind": levelGrind,
        "level_sugar": levelSugar,
        "amount": amount,
        "total": total,
        "status": status,
        "serve": serve,
      };
}
