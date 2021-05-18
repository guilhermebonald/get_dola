import 'package:dolaNow/repository/request.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  RxString dolarValue = ''.obs;
  RxDouble valueConvert = 0.0.obs;

  RxString euroValue = ''.obs;
  RxString dolarTValue = ''.obs;
  RxString dolarCadValue = ''.obs;
  RxString dolarAusValue = ''.obs;
  RxString bitValue = ''.obs;
  RxString libraValue = ''.obs;
  RxString pesoValue = ''.obs;
  RxString ieneValue = ''.obs;
  RxString francoValue = ''.obs;
  RxString yuanValue = ''.obs;
  RxString liteValue = ''.obs;
  RxString ethereumValue = ''.obs;
  RxString rippleValue = ''.obs;

  RxList listValue = [].obs;

  //----------------------------------------------------------------------------

  //Preciso usar o [.value] no final da variavel para que [RxType]
  //receba o tipo da variavel.
  setOneCoin() async {
    var datas = await RequestData().getApi();
    dolarValue.value = datas.uSD.bid;
    euroValue.value = datas.eUR.bid;
  }

  setAllCoins() async {
    var datas = await RequestData().getApi();
    dolarValue.value = datas.uSD.bid;
    euroValue.value = datas.eUR.bid;
    dolarTValue.value = datas.uSDT.bid;
    dolarCadValue.value = datas.cAD.bid;
    dolarAusValue.value = datas.aUD.bid;
    bitValue.value = datas.bTC.bid;
    libraValue.value = datas.gBP.bid;
    pesoValue.value = datas.aRS.bid;
    ieneValue.value = datas.jPY.bid;
    francoValue.value = datas.cHF.bid;
    yuanValue.value = datas.cNY.bid;
    liteValue.value = datas.lTC.bid;
    ethereumValue.value = datas.eTH.bid;
    rippleValue.value = datas.xRP.bid;
  }

  setListChart() async {
    var chart = await RequestData().getListApi();
    listValue.value = chart;
  }

  //----------------------------------------------------------------------------

  convertDolar(String value) {
    if (value.isEmpty) {
      value = '0';
    }
    valueConvert.value = double.parse(dolarValue.value) * double.parse(value);
  }

  convertReal(String value) {
    if (value.isEmpty) {
      value = '0';
    }
    valueConvert.value = double.parse(value) / double.parse(dolarValue.value);
  }
}
