import 'dart:developer';

import 'package:alison_ecommerce/service/api_services.dart';
import 'package:alison_ecommerce/view/home/model/home_model.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  ApiServices apiServices = ApiServices();
  HomeModel? homedata;
  getHomeData() async {
    homedata = await apiServices.getHomeData();
    log(homedata!.banner1![0].image.toString());
    notifyListeners();
  }
}
