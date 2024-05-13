import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_banking/screens/tab/cards/add_card/widgets/card_item_view.dart';
import 'package:mobile_banking/screens/tab/cards/add_card/widgets/card_number_input.dart';
import 'package:mobile_banking/screens/tab/cards/add_card/widgets/expire_date_input.dart';
import 'package:mobile_banking/screens/tab/cards/add_card/widgets/my_custom_button.dart';

import '../../../../blocs/card/cards_bloc.dart';
import '../../../../blocs/card/cards_event.dart';
import '../../../../blocs/card/cards_state.dart';
import '../../../../data/models/card_model.dart';
import '../../../../data/models/forms_state.dart';
import '../../../../utils/styles/app_text_styles.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final TextEditingController cardNumber = TextEditingController();
  final TextEditingController expireDate = TextEditingController();

  final FocusNode cardFocusNode = FocusNode();
  final FocusNode expireDateFocusNode = FocusNode();
  CardModel cardModel = CardModel.initial();

  @override
  void initState() {
    cardNumber.addListener(() {
      setState(() {});
      cardModel =
          cardModel.copyWith(cardNumber: cardNumber.text.replaceAll(" ", ""));
    });

    expireDate.addListener(() {
      setState(() {});
      cardModel =
          cardModel.copyWith(expireDate: expireDate.text.replaceAll(" ", ""));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Karta biriktirish",
          style: AppTextStyle.interSemiBold.copyWith(color: Colors.white),
        ),
      ),
      body: BlocConsumer<UserCardsBloc, UserCardsState>(
        builder: (context, state) {
          return Column(
            children: [
              CardItemView(cardModel: cardModel),
              CardNumberInput(
                controller: cardNumber,
                focusNode: cardFocusNode,
              ),
              ExpireDateInput(
                focusNode: expireDateFocusNode,
                controller: expireDate,
              ),
              const Spacer(),
              MyCustomButton(
                onTap: () {
                  if (cardModel.cardNumber.length != 16) {
                    return;
                  }
                  if (cardModel.expireDate.length != 5) {
                    return;
                  }

                  List<CardModel> db = state.cardsDB;
                  List<CardModel> myCards = state.userCards;

                  bool isExist = false;

                  for (var element in myCards) {
                    if (element.cardNumber == cardModel.cardNumber) {
                      isExist = true;
                      break;
                    }
                  }

                  bool hasInDB = false;
                  for (var element in db) {
                    if (element.cardNumber == cardModel.cardNumber) {
                      hasInDB = true;
                      cardModel = element;
                      break;
                    }
                  }
                  if ((!isExist) && hasInDB) {
                    context.read<UserCardsBloc>().add(AddCardEvent(cardModel));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                        Text("Karta qo'shilgan yoki bazada mavjud emas!"),
                      ),
                    );
                  }
                },
                title: "Qo'shish",
                isLoading: state.status == FormsStatus.loading,
              ),
            ],
          );
        },
        listener: (context, state) {
          if (state.statusMessage == "added") {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}