import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_food/core/class/handlingdataview.dart';
import 'package:home_food/data/model/itemsmodel.dart';
import 'package:home_food/view/screen/items/customlistitems.dart';

import '../../../controller/items/favorite_controller.dart';
import '../../../controller/items/items_controller.dart';
import '../../widget/home/listitemsitems.dart';
import 'home.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Menu"),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(children: [
            const ListCategoriesItems(),
            GetBuilder<ItemsControllerImp>(
              builder: (controller) => HandlingDataViewNot(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearch
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.items.length,
                          physics: const NeverScrollableScrollPhysics(),
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
