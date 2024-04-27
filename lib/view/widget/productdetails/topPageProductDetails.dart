import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_food/controller/home/productdetalis_controller.dart';

import '../../../core/constant/color.dart';
import '../../../likeapi.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {
  const TopProductPageDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: size.height / 3.5,
          decoration: const BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
        ),
        controller.itemsModel.itemsDescount != "0"
            ? Positioned(
                left: 10,
                top: 10,
                child: Image.asset(
                  "assets/images/dis.png",
                  width: 80,
                ))
            : const Text(""),
        Positioned(
          top: -8,
          right: Get.width / 8,
          left: Get.width / 8,
          child: Hero(
            tag: "${controller.itemsModel.itemsId}",
            child: CachedNetworkImage(
              imageUrl:
                  "${AppLink.imageItems}/${controller.itemsModel.itemsImage}",
              height: size.height / 2,
              width: size.width,
// fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
