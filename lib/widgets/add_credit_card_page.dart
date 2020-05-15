import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/data.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import './credit_card_form.dart' as cs;
import 'package:flutter_credit_card/credit_card_model.dart';
import '../Constants.dart';

class AddCreditCardPage extends StatefulWidget {
  @override
  _AddCreditCardPageState createState() => _AddCreditCardPageState();
}

class _AddCreditCardPageState extends State<AddCreditCardPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  @override
  Widget build(BuildContext context) {
    final notes = Provider.of<DataModel>(context);

    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: CreditCardWidget(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isCvvFocused,

                ),
              ),
              Expanded(
                flex: 4,
                child: Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric( horizontal: 20),
                            child: cs.CreditCardForm(
                              onCreditCardModelChange: onCreditCardModelChange,
                            ),
                          ),
                          FlatButton(
                            child: Container(
                              width:
                              MediaQuery.of(context).size.width * 0.5,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 18),
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(50)),
                                color: kfloatingActionButtonColor,
                              ),
                              child: Text("Add Card",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                            ),
                            onPressed: () {

                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}



