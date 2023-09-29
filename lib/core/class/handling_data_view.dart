import 'package:flutter/material.dart';
import 'package:admin/core/class/status_request.dart';
import 'package:lottie/lottie.dart';
import 'package:admin/core/constants/image_asset.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.cartLoading,
                width: 300, height: 300),
          )
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset(AppImageAsset.offline,
                    width: 300, height: 300),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(AppImageAsset.server,
                        width: 300, height: 300),
                  )
                : statusRequest == StatusRequest.nodatafailure
                    ? Center(
                        child: Lottie.asset(AppImageAsset.noData,
                            width: 300, height: 300))
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.cartLoading,
                width: 300, height: 300),
          )
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset(AppImageAsset.offline,
                    width: 300, height: 300),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(AppImageAsset.server,
                        width: 300, height: 300),
                  )
                : widget;
  }
}
