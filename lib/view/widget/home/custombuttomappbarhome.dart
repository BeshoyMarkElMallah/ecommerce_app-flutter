import 'package:ecommerce_app/controller/homescreen_controller.dart';
import 'package:ecommerce_app/view/widget/home/custombuttonappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtomAppBarHome extends StatelessWidget {
  const CustomButtomAppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: [
            ...List.generate(controller.listPage.length + 1, ((index) {
              int i = index > 2 ? index - 1 : index;
              return index == 2
                  ? const Spacer()
                  : CustomButtonAppBar(
                      textbutton: controller.bottomappbar[i]['title'],
                      icondata: controller.bottomappbar[i]['icon'],
                      onPressed: () {
                        controller.changePage(i);
                      },
                      active: controller.currentPage == i ? true : false,
                    );
            }))
          ],
        ),
      ),
    );
  }
}
