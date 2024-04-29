import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_food/core/constant/color.dart';
import 'package:home_food/core/constant/routes.dart';
import 'package:home_food/data/model/itemsmodel.dart';
import 'package:home_food/view/widget/home/listitems.dart';
import '../../../controller/home/home_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/functions/translatedordatabase.dart';
import '../../../likeapi.dart';
import '../../widget/home/customappbar.dart';
import '../../widget/home/customtitlehome.dart';
import '../../widget/home/listcategorieshome.dart';

int? currentIndex = 0;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: GetBuilder<HomeControllerImp>(
            builder: (controller) => Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: ListView(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      CustomAppBar(
                        onPressedIconFavorite: () {
                          Get.toNamed(AppRoute.myFavorite);
                        },
                        titleAppBar: "${translateDataBase("ابحث عن طعامك", "Find food")}",
                        onPressedSearch: () {
                          controller.onSearchItems();
                        },
                        onChanged: (val) {
                          controller.checkSearch(val);
                        },
                        myController: controller.search!,
                      ),
                      // const CustomCardHome(
                      //   title: "A Summer Surprise",
                      //   body: "Cashback 20%",
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      !controller.isSearch == true
                          ? HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CarouselSlider(
                                  items: controller.banner.map((imageUrl) {
                                    return Container(
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10.0)),
                                      child: CachedNetworkImage(
                                          imageUrl:
                                          "${AppLink.imageBanner}/${imageUrl['banner_image']}",
                                          width: double.infinity,
                                          fit: BoxFit.fill),
                                    );
                                  }).toList(),
                                  options: CarouselOptions(
                                    viewportFraction: 1,
                                    aspectRatio: 2.0,
                                    initialPage: 2,
                                    // height: size.height * 0.25,
                                    enableInfiniteScroll: true,
                                    reverse: false,
                                    autoPlay: true,
                                    autoPlayInterval:
                                    const Duration(seconds: 3),
                                    autoPlayAnimationDuration:
                                    const Duration(milliseconds: 800),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enlargeCenterPage: true,
                                    scrollDirection: Axis.horizontal,
                                    onPageChanged: (index, _) {
                                      setState(() {
                                        currentIndex = index;
                                      });
                                    },
                                  )),
                              // This trailing comma makes auto-formatting nicer for build methods.
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: controller.banner.map((url) {
                                  int index = controller.banner
                                      .lastIndexOf(url)
                                      .toInt();
                                  // print(index);
                                  return AnimatedContainer(
                                    duration: const Duration(
                                      milliseconds: 800,
                                    ),
                                    width: currentIndex == index ? 25 : 5,
                                    height: 5,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(5),
                                      color: currentIndex == index
                                          ? AppColor.primaryColor
                                          : AppColor.gray,
                                    ),
                                  );
                                }).toList(),
                              ),
                              CustomTitleHome(title: "Chefs".tr),
                              const SizedBox(
                                height: 5,
                              ),
                              const ListCategoriesHome(),
                              if (controller.itemsTopSelling.isNotEmpty)
                                CustomTitleHome(title: "${translateDataBase("عروض اليوم", "Offer Daily")}".tr),
                              if (controller.itemsTopSelling.isNotEmpty)
                                const ItemsViewTopSelling(),
                            ],
                          ))
                          : ListItemsSearch(
                          listData: controller.listDataControl)
                    ]))));
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listData;

  const ListItemsSearch({Key? key, required this.listData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listData.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.goToProductDetails(listData[index]);
          },
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                      child: Hero(
                        tag: "${listData[index].itemsId}",
                        child: CachedNetworkImage(
                            imageUrl:
                            "${AppLink.imageItems}/${listData[index].itemsImage}"),
                      )),
                  Expanded(
                      flex: 2,
                      child: ListTile(
                        title: Text(
                          translateDataBase(
                              listData[index].itemsNameAr.toString(),
                              listData[index].itemsName.toString()),
                          style: const TextStyle(
                              color: AppColor.black),
                        ),
                        subtitle: Text("${listData[index].itemsPrice}",
                            style: const TextStyle(
                                color: AppColor.primaryColor)),
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
