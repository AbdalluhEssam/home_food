import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:home_food/core/constant/color.dart';
import 'package:home_food/core/constant/imageassets.dart';
import 'package:home_food/core/localization/changelocal.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../controller/home/settings_controller.dart';
import '../../../core/constant/my_flutter_app_icons.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/translatedordatabase.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: AppColor.primaryColor),
      ),
      body: Container(
        color: AppColor.black,
        child: ListView(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: Get.width / 3,
                  color: AppColor.primaryColor,
                  // child: Image.asset("assets/images/home_food.png",color: AppColor.black,alignment: Alignment.topCenter,),
                ),
                Positioned(
                    top: Get.width / 4,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: AppColor.black,
                              borderRadius: BorderRadius.circular(100)),
                          child: const CircleAvatar(
                            radius: 40,
                            backgroundColor: AppColor.backgroundColor,
                            backgroundImage: AssetImage(AppImageAssets.imageAvatar),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Text("${controller.myServices.sharedPreferences.getString("username")}"),
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: Get.width * 0.25,
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                color: AppColor.primaryColor.withOpacity(0.2),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(
                        "language".tr,
                        style: const TextStyle(color: AppColor.backgroundColor),
                      ),
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              LocaleController controller =
                                  Get.put(LocaleController());
                              return Container(
                                color: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                height: Get.height * 0.27,
                                child: Column(children: [
                                  Text(
                                    translateDataBase(
                                        "تغير اللغة", "Change the language"),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                      controller.changeLang("ar");
                                      Get.forceAppUpdate();
                                      Get.appUpdate();
                                      Get.back();
                                    },
                                    textColor: AppColor.black,
                                    color: AppColor.primaryColor,
                                    minWidth: double.infinity,
                                    child: Text(
                                      translateDataBase(
                                          "اللغة العربية", "Arabic"),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                      controller.changeLang("en");
                                      Get.forceAppUpdate();
                                      Get.appUpdate();
                                      Get.back();
                                    },
                                    textColor: AppColor.black,
                                    color: AppColor.primaryColor,
                                    minWidth: double.infinity,
                                    child: Text(
                                      translateDataBase(
                                          "اللغة الانجليزية", "English"),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ]),
                              );
                            });
                        // Get.toNamed(AppRoute.language);
                      },
                      trailing: const Icon(
                        Icons.language_rounded,
                        color: AppColor.backgroundColor,
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: AppColor.black,
                    ),
                    ListTile(
                      title: Text(
                        "orders".tr,
                        style: const TextStyle(color: AppColor.backgroundColor),
                      ),
                      onTap: () {
                        Get.toNamed(AppRoute.ordersPending);
                      },
                      trailing: const Icon(
                        Icons.card_travel,
                        color: AppColor.backgroundColor,
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: AppColor.black,
                    ),
                    ListTile(
                      title: Text(
                        "Archive".tr,
                        style: const TextStyle(color: AppColor.backgroundColor),
                      ),
                      onTap: () {
                        Get.toNamed(AppRoute.ordersArchive);
                      },
                      trailing: const Icon(
                        Icons.archive_outlined,
                        color: AppColor.backgroundColor,
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: AppColor.black,
                    ),
                    ListTile(
                      title: Text(
                        "address".tr,
                        style: const TextStyle(color: AppColor.backgroundColor),
                      ),
                      onTap: () {
                        Get.toNamed(AppRoute.addressView);
                      },
                      trailing: const Icon(
                        Icons.location_on_outlined,
                        color: AppColor.backgroundColor,
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: AppColor.black,
                    ),
                    ListTile(
                      title: Text(
                        "about".tr,
                        style: const TextStyle(color: AppColor.backgroundColor),
                      ),
                      onTap: () {
                        Get.toNamed(AppRoute.aboutUs);
                      },
                      trailing: const Icon(
                        Icons.info_outline,
                        color: AppColor.backgroundColor,
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: AppColor.black,
                    ),
                    ListTile(
                      title: Text(
                        "help".tr,
                        style: const TextStyle(color: AppColor.backgroundColor),
                      ),
                      onTap: () {
                        Get.toNamed(AppRoute.helpPage);
                      },
                      trailing: const Icon(
                        Icons.phone,
                        color: AppColor.backgroundColor,
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: AppColor.black,
                    ),
                    ListTile(
                      title: Text(
                        "logout".tr,
                        style: const TextStyle(color: AppColor.backgroundColor),
                      ),
                      onTap: () {
                        controller.logout();
                      },
                      trailing: const Icon(
                        Icons.exit_to_app,
                        color: AppColor.backgroundColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: Get.width * 0.70,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildMedia(
                      icon: Icons.facebook,
                      text: "Facebook",
                      onPressed: () {
                        facebook();
                      }),
                  buildMedia(
                      icon: MyFlutterApp.instagram,
                      text: "Instagram",
                      onPressed: () {
                        instagram();
                      }),
                  buildMedia(
                      icon: FontAwesome.whatsapp,
                      text: "Whatsapp",
                      onPressed: () {
                        whatsapp();
                      }),
                  buildMedia(
                      icon: Icons.language,
                      text: "Website",
                      onPressed: () {
                        webSite();
                      }),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Text("home_food | ©2023")],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

whatsapp() async {
  const url = "whatsapp://send?phone=+2001000615819";
  await launch(url);
}

facebook() async {
  const url = 'https://www.facebook.com/abdallh2002/';
  await launch(url);
}

instagram() async {
  const url = 'https://www.instagram.com/abdalluh_essam_22/';
  await launch(url);
}

webSite() async {
  const url = 'https://www.instagram.com/abdalluh_essam_22/';
  await launch(url);
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  const color = AppColor.black;
  const hoverColor = AppColor.black;
  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Text(
      text,
      style: const TextStyle(color: color),
    ),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}

Widget buildMedia(
    {required String text,
    required IconData icon,
    void Function()? onPressed}) {
  const color = AppColor.primaryColor;
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: [
        IconButton(
          onPressed: onPressed,
          iconSize: 30,
          icon: Icon(
            icon,
            color: color,
          ),
        ),
        Text(
          text,
          style: const TextStyle(color: AppColor.gray, fontSize: 10),
        ),
      ],
    ),
  );
}
