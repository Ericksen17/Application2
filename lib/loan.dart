import 'package:flutter/material.dart';
import 'package:flutter_application_2/loan_request_form.dart';

class LoanPage extends StatelessWidget {
  const LoanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loans'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container for Total Loan
            Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Text(
                'Total Loan: 0 TSH',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Container for Pending Loan
            Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Text(
                'Pending Loan: 0 TSH',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Loan Table
            const LoanTable(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoanRequestForm()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class LoanTable extends StatelessWidget {
  const LoanTable({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('Loan Type')),
        DataColumn(label: Text('Status')),
      ],
      rows: const [
        DataRow(cells: [
          DataCell(Text('PENDING LOAN')),
          DataCell(LoanCheckbox(loanStatus: 'Pending')),
        ]),
        DataRow(cells: [
          DataCell(Text('APPROVED LOAN')),
          DataCell(LoanCheckbox(loanStatus: 'Approved')),
        ]),
      ],
    );
  }
}

class LoanCheckbox extends StatefulWidget {
  final String loanStatus;

  const LoanCheckbox({super.key, required this.loanStatus});

  @override
  // ignore: library_private_types_in_public_api
  _LoanCheckboxState createState() => _LoanCheckboxState();
}

class _LoanCheckboxState extends State
{
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value ?? false;
        });
      },
    );
  }
}
