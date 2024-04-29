import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_food/core/class/handlingdataview.dart';
import 'package:home_food/data/model/itemsmodel.dart';
import 'package:home_food/likeapi.dart';
import 'package:home_food/view/screen/items/customlistitems.dart';
import '../../../controller/items/favorite_controller.dart';
import '../../../controller/items/items_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translatedordatabase.dart';
import '../../widget/home/listitems.dart';
import 'home.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
      body: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
              builder: (controller) => Stack(
                    children: [
                       SizedBox(
                        height: 350.0,
                        width:Get.width,
                      ),
                      SizedBox(
                        height: 200.0,
                        width: Get.width,
                        child: Image.asset(
                          fit: BoxFit.cover,
                          "assets/images/cover1.jpeg",
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 20),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              Get.back();
                            },
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120.0,
                        left: 15.0,
                        right: 15.0,
                        child: Material(
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(7.0),
                          child: Container(
                            height: 200.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 75.0,
                        left: (MediaQuery.of(context).size.width / 2 - 50.0),
                        child: Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  "${AppLink.imageCategories}/${controller.categories.categoriesImage!}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 180.0,
                        left: (MediaQuery.of(context).size.width / 2) - 75.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(text: '${translateDataBase(controller.categories.categoriesNameAr, controller.categories.categoriesName)}'),
                            Text(
                                '${translateDataBase(controller.categories.governorateNameAr, controller.categories.governorateNameEn)}'),
                            Text(
                              controller.categories.addressStreet.toString(),
                              style: const TextStyle(color: Colors.grey,fontSize: 12,height: 1),
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              children: [
                                Wrap(
                                  children: List.generate(5, (index) {
                                    return const Icon(
                                      Icons.star,
                                      color: AppColor.mainColor,
                                      size: 25,
                                    );
                                  }),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SmallText(text: '4.5'),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ListView(children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(text: '${translateDataBase("الاعمال", "Works")}'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
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
                          : ListItemsSearch(
                              listData: controller.listDataControl)),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
