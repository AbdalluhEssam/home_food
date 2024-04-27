import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_food/core/class/handlingdataview.dart';
import 'package:home_food/core/constant/color.dart';
import 'package:home_food/data/model/itemsmodel.dart';
import 'package:home_food/view/screen/items/customlistitems.dart';

import '../../../controller/items/favorite_controller.dart';
import '../../../controller/items/items_controller.dart';
import '../../../core/constant/routes.dart';
import '../../widget/home/customappbar.dart';
import '../../widget/home/listitemsitems.dart';
import 'home.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: ListView(children: [
            CustomAppBar(
              onPressedIconFavorite: () {
                Get.toNamed(AppRoute.myFavorite);
              },
              titleAppBar: "findproduct".tr,
              onPressedSearch: () {
                controller.onSearchItems();
              },
              onChanged: (val) {
                controller.checkSearch(val);
              },
              myController: controller.search!,
            ),
            const ListCategoriesItems(),
            GetBuilder<ItemsControllerImp>(
              builder: (controller) => HandlingDataViewNot(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearch
                      ? GridView.builder(
                          shrinkWrap: true,
                          itemCount: controller.items.length,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.57),
                          itemBuilder: (context, index) {
                            controllerFav.isFavorite[controller.items[index]
                                    ['items_id']] =
                                controller.items[index]['favorite'];
                            return CustomListItems(
                                active: false,
                                itemsModel: ItemsModel.fromJson(
                                    controller.items[index]));
                          })
                      : ListItemsSearch(listData: controller.listDataControl)),
            ),
          ])),
    );
  }
}
