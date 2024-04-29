import 'package:flutter/material.dart';

class LoanRequestForm extends StatefulWidget {
  const LoanRequestForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoanRequestFormState createState() => _LoanRequestFormState();
}

class _LoanRequestFormState extends State<LoanRequestForm> {
  final TextEditingController loanAmountController = TextEditingController();
  double loanAmount = 0.0;
  double interestRate = 0.10;
  double totalAmount = 0.0;
  int repaymentPeriod = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loan Request Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: loanAmountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Loan Amount',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  loanAmount = double.parse(loanAmountController.text);
                  totalAmount = loanAmount * (1 + interestRate);
                  repaymentPeriod = _calculateRepaymentPeriod(loanAmount);
                });
              },
              child: const Text('Calculate Total Amount'),
            ),
            const SizedBox(height: 16.0),
            DataTable(
              columns: const [
                DataColumn(label: Text('Description')),
                DataColumn(label: Text('Amount')),
              ],
              rows: [
                DataRow(cells: [
                  const DataCell(Text('Loan Amount')),
                  DataCell(Text('$loanAmount Tshs')),
                ]),
                DataRow(cells: [
                  const DataCell(Text('Interest Rate (10%)')),
                  DataCell(Text('${loanAmount * interestRate} Tshs')),
                ]),
                DataRow(cells: [
                  const DataCell(Text('Total Amount')),
                  DataCell(Text('$totalAmount Tshs')),
                ]),
                DataRow(cells: [
                  const DataCell(Text('Repayment Period')),
                  DataCell(Text('$repaymentPeriod months')),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  int _calculateRepaymentPeriod(double loanAmount) {
    if (loanAmount < 500000) {
      return 4;
    } else if (loanAmount >= 500000 && loanAmount < 1000000) {
      return 6;
    } else {
      return 8;
    }
  }
}
