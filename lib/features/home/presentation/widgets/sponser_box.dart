import 'package:first_assignment/core/constants/constants.dart';
import 'package:first_assignment/features/home/domain/entities/sponser_entities.dart';
import 'package:first_assignment/features/home/presentation/provider/sponser_provider.dart';
import 'package:first_assignment/features/home/presentation/widgets/shop_now_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SponserBox extends StatelessWidget {
  const SponserBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SponserEntity? sponserEntity =
        context.select<SponserProvider, SponserEntity?>(
      (value) => value.sponserEntity,
    );
    if (sponserEntity == null) {
      return const CircularProgressIndicator();
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sponser',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: kDeafultPadding),
          SizedBox(
            height: kScreenHeight(context) * 0.4,
            width: kScreenWidth(context),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(sponserEntity.iconUrl),
                  radius: 30,
                ),
                const SizedBox(width: kDeafultPadding / 2),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sponserEntity.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        sponserEntity.description,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(sponserEntity.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              sponserEntity.promo,
                            ),
                          ),
                          const ShopNowButton(),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }
}
