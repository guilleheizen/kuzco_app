import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kuzco_app/module/banner/provider/banner_provider.dart';
import 'package:kuzco_app/module/banner/ui/widgets/image_loader.dart';
import 'package:kuzco_app/module/banner/ui/widgets/image_swiper.dart';
import 'package:kuzco_app/module/product/index.dart';
import 'package:kuzco_app/module/product/model/product_search_settings_model.dart';
import 'package:kuzco_app/module/product/submodule/product_group/provider/product_group_provider.dart';
import 'package:kuzco_app/ui/widgets/index.dart';

class SimpleBanner extends ConsumerWidget {
  const SimpleBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final banner = ref.watch(bannerProvider);
    final bannerNotifier = ref.read(bannerProvider.notifier);
    final productGroupNotifier = ref.read(productGroupProvider.notifier);

    return banner.when(
      data: (data) {
        final banners = bannerNotifier.getBannersByTypeAndPlacement(type: 'simple', placement: 'center');
        return Column(
          children: [
            Space(
              horizontal: 16,
              child: Text(
                'Te podría interesar',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w900),
              ),
            ),
            Space(
              horizontal: 16,
              child: Container(
                height: 250,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                clipBehavior: Clip.hardEdge,
                child: FadeCardSwiper(
                  banners: banners
                      .map(
                        (banner) => InkWell(
                          onTap: () {
                            productGroupNotifier.search(
                              searchSettings: ProductSearchSettings(productGroupCode: banner.productGroupCode, productGroupTitle: banner.name),
                            );
                            Navigator.of(context).pushNamed(ProductGroupPage.route);
                          },
                          child: ImageLoader(image: banner.getImage()),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        );
      },
      error: (error, stackTrace) {
        return SizedBox();
      },
      loading: () {
        return Shimmer(height: 250, margin: EdgeInsetsGeometry.fromLTRB(16, 40, 16, 20));
      },
    );
  }
}
