class DataProductResponse {
    DataProductResponse({
        required this.jsonrpc,
        this.id,
        required this.result,
    });

    String jsonrpc;
    dynamic id;
    DataProductTemporary result;

    factory DataProductResponse.fromJson(Map<String, dynamic> json) => DataProductResponse(
        jsonrpc: json["jsonrpc"],
        id: json["id"],
        result: DataProductTemporary.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "jsonrpc": jsonrpc,
        "id": id,
        "result": result.toJson(),
    };
}

class DataProductTemporary {
    DataProductTemporary({
        required this.data,
    });

    List<DataProduct> data;

    factory DataProductTemporary.fromJson(Map<String, dynamic> json) => DataProductTemporary(
        data: List<DataProduct>.from(json["data"].map((x) => DataProduct.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DataProduct {
  DataProduct({
    required this.id,
    required this.name,
    required this.date,
    required this.description,
    required this.userId,
    required this.state,
    required this.fromIds,
    required this.toIds,
    required this.byproductIds,
  });

  int id;
  String name;
  String date;
  String description;
  List<dynamic> userId;
  String state;
  List<FromIdElement> fromIds;
  List<FromIdElement> toIds;
  List<ByproductId> byproductIds;

  factory DataProduct.fromJson(Map<String, dynamic> json) =>
      DataProduct(
        id: json["id"],
        name: json["name"],
        date: json["date"],
        description: json["description"],
        userId: List<dynamic>.from(json["user_id"].map((x) => x)),
        state: json["state"],
        fromIds: List<FromIdElement>.from(
            json["from_ids"].map((x) => FromIdElement.fromJson(x))),
        toIds: List<FromIdElement>.from(
            json["to_ids"].map((x) => FromIdElement.fromJson(x))),
        byproductIds: List<ByproductId>.from(
            json["byproduct_ids"].map((x) => ByproductId.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "date":
            date,
        "description": description,
        "user_id": List<dynamic>.from(userId.map((x) => x)),
        "state": state,
        "from_ids": List<dynamic>.from(fromIds.map((x) => x.toJson())),
        "to_ids": List<dynamic>.from(toIds.map((x) => x.toJson())),
        "byproduct_ids":
            List<dynamic>.from(byproductIds.map((x) => x.toJson())),
      };
}

class ByproductId {
  ByproductId({
    required this.id,
    required this.productId,
    required this.qty,
    required this.uomId,
  });

  int id;
  List<dynamic> productId;
  double qty;
  List<dynamic> uomId;

  factory ByproductId.fromJson(Map<String, dynamic> json) => ByproductId(
        id: json["id"],
        productId: List<dynamic>.from(json["product_id"].map((x) => x)),
        qty: json["qty"],
        uomId: List<dynamic>.from(json["uom_id"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": List<dynamic>.from(productId.map((x) => x)),
        "qty": qty,
        "uom_id": List<dynamic>.from(uomId.map((x) => x)),
      };
}

class FromIdElement {
  FromIdElement({
    required this.id,
    required this.productId,
    required this.qty,
    required this.uomId,
    required this.secondQty,
    required this.secondUom,
  });

  int id;
  List<dynamic> productId;
  double qty;
  List<dynamic> uomId;
  double secondQty;
  bool secondUom;

  factory FromIdElement.fromJson(Map<String, dynamic> json) => FromIdElement(
        id: json["id"],
        productId: List<dynamic>.from(json["product_id"].map((x) => x)),
        qty: json["qty"],
        uomId: List<dynamic>.from(json["uom_id"].map((x) => x)),
        secondQty: json["second_qty"],
        secondUom: json["second_uom"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": List<dynamic>.from(productId.map((x) => x)),
        "qty": qty,
        "uom_id": List<dynamic>.from(uomId.map((x) => x)),
        "second_qty": secondQty,
        "second_uom": secondUom,
      };
}
