class DolarApiModel {
  USD uSD;
  USD uSDT;
  USD cAD;
  USD eUR;
  USD gBP;
  USD aRS;
  USD bTC;
  USD lTC;
  USD jPY;
  USD cHF;
  USD aUD;
  USD cNY;
  USD iLS;
  USD eTH;
  USD xRP;

  DolarApiModel(
      {this.uSD,
      this.uSDT,
      this.cAD,
      this.eUR,
      this.gBP,
      this.aRS,
      this.bTC,
      this.lTC,
      this.jPY,
      this.cHF,
      this.aUD,
      this.cNY,
      this.iLS,
      this.eTH,
      this.xRP});

  DolarApiModel.fromJson(Map<String, dynamic> json) {
    uSD = json['USD'] != null ? new USD.fromJson(json['USD']) : null;
    uSDT = json['USDT'] != null ? new USD.fromJson(json['USDT']) : null;
    cAD = json['CAD'] != null ? new USD.fromJson(json['CAD']) : null;
    eUR = json['EUR'] != null ? new USD.fromJson(json['EUR']) : null;
    gBP = json['GBP'] != null ? new USD.fromJson(json['GBP']) : null;
    aRS = json['ARS'] != null ? new USD.fromJson(json['ARS']) : null;
    bTC = json['BTC'] != null ? new USD.fromJson(json['BTC']) : null;
    lTC = json['LTC'] != null ? new USD.fromJson(json['LTC']) : null;
    jPY = json['JPY'] != null ? new USD.fromJson(json['JPY']) : null;
    cHF = json['CHF'] != null ? new USD.fromJson(json['CHF']) : null;
    aUD = json['AUD'] != null ? new USD.fromJson(json['AUD']) : null;
    cNY = json['CNY'] != null ? new USD.fromJson(json['CNY']) : null;
    iLS = json['ILS'] != null ? new USD.fromJson(json['ILS']) : null;
    eTH = json['ETH'] != null ? new USD.fromJson(json['ETH']) : null;
    xRP = json['XRP'] != null ? new USD.fromJson(json['XRP']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.uSD != null) {
      data['USD'] = this.uSD.toJson();
    }
    if (this.uSDT != null) {
      data['USDT'] = this.uSDT.toJson();
    }
    if (this.cAD != null) {
      data['CAD'] = this.cAD.toJson();
    }
    if (this.eUR != null) {
      data['EUR'] = this.eUR.toJson();
    }
    if (this.gBP != null) {
      data['GBP'] = this.gBP.toJson();
    }
    if (this.aRS != null) {
      data['ARS'] = this.aRS.toJson();
    }
    if (this.bTC != null) {
      data['BTC'] = this.bTC.toJson();
    }
    if (this.lTC != null) {
      data['LTC'] = this.lTC.toJson();
    }
    if (this.jPY != null) {
      data['JPY'] = this.jPY.toJson();
    }
    if (this.cHF != null) {
      data['CHF'] = this.cHF.toJson();
    }
    if (this.aUD != null) {
      data['AUD'] = this.aUD.toJson();
    }
    if (this.cNY != null) {
      data['CNY'] = this.cNY.toJson();
    }
    if (this.iLS != null) {
      data['ILS'] = this.iLS.toJson();
    }
    if (this.eTH != null) {
      data['ETH'] = this.eTH.toJson();
    }
    if (this.xRP != null) {
      data['XRP'] = this.xRP.toJson();
    }
    return data;
  }
}

class USD {
  String code;
  String codein;
  String name;
  String high;
  String low;
  String varBid;
  String pctChange;
  String bid;
  String ask;
  String timestamp;
  String createDate;

  USD(
      {this.code,
      this.codein,
      this.name,
      this.high,
      this.low,
      this.varBid,
      this.pctChange,
      this.bid,
      this.ask,
      this.timestamp,
      this.createDate});

  USD.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    codein = json['codein'];
    name = json['name'];
    high = json['high'];
    low = json['low'];
    varBid = json['varBid'];
    pctChange = json['pctChange'];
    bid = json['bid'];
    ask = json['ask'];
    timestamp = json['timestamp'];
    createDate = json['create_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['codein'] = this.codein;
    data['name'] = this.name;
    data['high'] = this.high;
    data['low'] = this.low;
    data['varBid'] = this.varBid;
    data['pctChange'] = this.pctChange;
    data['bid'] = this.bid;
    data['ask'] = this.ask;
    data['timestamp'] = this.timestamp;
    data['create_date'] = this.createDate;
    return data;
  }
}
