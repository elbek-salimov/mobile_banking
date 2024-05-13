import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_banking/screens/routes.dart';
import 'package:size_util/size_util.dart';

import '../../../blocs/card/cards_bloc.dart';
import '../../../blocs/card/cards_event.dart';
import '../../../blocs/card/cards_state.dart';
import '../../../blocs/profile/profile_bloc.dart';
import '../../../data/models/card_model.dart';
import '../../../utils/styles/app_text_styles.dart';
import 'add_card/widgets/card_item_view.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {

  @override
  void initState() {
    context.read<UserCardsBloc>().add(GetCardsByUserId(
        userId: context.read<ProfileBloc>().state.userModel.userId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification',
          style: AppTextStyle.interSemiBold
              .copyWith(color: Colors.green, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<UserCardsBloc, UserCardsState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(left: 37.w, right: 37.w, top: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Cards',
                  style: AppTextStyle.interSemiBold.copyWith(
                    fontSize: 20,
                    color: Colors.green,
                  ),
                ),
                Text(
                  'Manage with ease',
                  style: AppTextStyle.interRegular.copyWith(
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 50.h),
                InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.addCardScreen);
                  },
                  child: Container(
                    height: 176.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Icon(Icons.add, size: 40.h),
                  ),
                ),
                ...List.generate(state.userCards.length, (index) {
                  CardModel cardModel = state.userCards[index];
                  return CardItemView(cardModel: cardModel);
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
