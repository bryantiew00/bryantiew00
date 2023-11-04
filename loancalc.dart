import 'package:flutter/material.dart';

class LoanCalcPage extends StatefulWidget {
  const LoanCalcPage({Key? key}) : super(key: key);

  @override
  _LoanCalcPageState createState() => _LoanCalcPageState();
}

class _LoanCalcPageState extends State<LoanCalcPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: const Text('Boit Loan Calculator'),
      ),
      body: Center(
          child: Column(
        children: [
          Flexible(
              flex: 5,
              child: Image.asset('assets/images/Financial.png', scale: 1.96)),
          const Flexible(flex: 7, child: LoanCalcMtd())
        ],
      )),
    );
  }
}
 

class LoanCalcMtd extends StatefulWidget {
  const LoanCalcMtd({Key? key}) : super(key: key);

  @override
  _LoanCalcMtdState createState() => _LoanCalcMtdState();
}

class _LoanCalcMtdState extends State<LoanCalcMtd> {

  TextEditingController loanAmountEditingController = TextEditingController();
  TextEditingController termEditingController = TextEditingController();
  TextEditingController interestRateEditingController = TextEditingController();

  int loanAmount = 0, term = 0;
  double interestRate = 0.0, totalAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
        child: Column(
          children: [
            const Text(
              "Monthly Payment Loan Calculator",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 17),
        TextField(
          controller: loanAmountEditingController,
          keyboardType: const TextInputType.numberWithOptions(),
          decoration: InputDecoration(
            hintText: "Loan Amount",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0))),
        ),
        const SizedBox(height: 17),
        TextField(
          controller: termEditingController,
          keyboardType: const TextInputType.numberWithOptions(),
          decoration: InputDecoration(
            hintText: "Years",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0))),
        ),
        const SizedBox(height: 17),
        TextField(
          controller: interestRateEditingController,
          keyboardType: const TextInputType.numberWithOptions(),
          decoration: InputDecoration(
            hintText: "Interest Rate %",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0))),
        ),
        const SizedBox(height: 15, width: 12),
            ElevatedButton(
                onPressed: _calLoan, child: const Text("Calculate")),
            ElevatedButton(
                onPressed: _clear, child: const Text("Clear")),
        const SizedBox(height: 10),
            Text(
              "Your Monthly Payment is ${totalAmount.toStringAsPrecision(4)}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
       ),
    );
  }

  void _calLoan() {
    loanAmount = int.parse(loanAmountEditingController.text);
    term = int.parse(termEditingController.text);
    interestRate = double.parse(interestRateEditingController.text);
    setState(() {
      totalAmount = (loanAmount * ((interestRate/100)/(term*12)));
    });
  }

  void _clear() {
    setState(() {
    loanAmountEditingController.clear();
    termEditingController.clear();
    interestRateEditingController.clear();
    totalAmount = 0;
    });
  }

}