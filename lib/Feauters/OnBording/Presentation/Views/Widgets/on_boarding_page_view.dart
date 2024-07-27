import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruits_app/Core/utils/app_colors.dart';
import 'package:fruits_app/Core/utils/app_text_styles.dart';
import 'package:fruits_app/Core/utils/app_images.dart';
import 'package:fruits_app/Feauters/OnBording/Presentation/Views/Widgets/page_view_item_one.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    pageController.hasClients;
    return PageView(
      controller: pageController,
      children: [
        PageViewItemOne(
          isVisible: true,
          backgroundImage: Assets.imagesPageItem1BackgrounedImage,
          image: Assets.imagesPageItem1Image,
          subTitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'مرحبًا بك في ',
                style: TextStyles.bold23,
              ),
              Text(
                'HUB',
                style:
                    TextStyles.bold23.copyWith(color: AppColors.secondaryColor),
              ),
              Text(
                ' Fruit',
                style:
                    TextStyles.bold23.copyWith(color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
        const PageViewItemOne(
          isVisible: false,
          backgroundImage: Assets.imagesVector2,
          image: Assets.imagesPageItem2Image,
          subTitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ابحث وتسوق',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
