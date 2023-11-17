import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:money_mate/models/planning_data.dart';

class PlanningPage extends StatefulWidget {
  const PlanningPage({Key? key}) : super(key: key);

  @override
  State<PlanningPage> createState() => _PlanningPageState();
}

class _PlanningPageState extends State<PlanningPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController amountController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  String? selectedCategory;

  final List<String> categoryList = [
    'Education',
    'Travel',
    'Transportation',
    'Food',
    'Clothing',
    'Social',
    'Home',
    'Motorcycle',
    'Car',
  ];

  @override
  Widget build(BuildContext context) {
    final planningData = Provider.of<PlanningData>(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 246, 233),
      appBar: AppBar(
        title: const Text('Add Planning'),
        backgroundColor: const Color.fromARGB(255, 23, 103, 26),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Create Planning",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(height: 24.0, thickness: 2.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Date",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _selectDate(context),
                            child: AbsorbPointer(
                              child: TextFormField(
                                controller: dateController,
                                decoration: InputDecoration(
                                  hintText: "Choose Date",
                                  labelText: "Date",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 6.0,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Choose Date';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Category",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _showCategoryDialog(context);
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: InputDecorator(
                                    decoration: InputDecoration(
                                      hintText: "Choose Category",
                                      labelText: "Category",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                        vertical: 6.0,
                                      ),
                                    ),
                                    child: Text(
                                      selectedCategory ?? "Choose Category",
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.arrow_drop_down),
                                  onPressed: () {
                                    _showCategoryDialog(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Amount",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: TextFormField(
                            controller: amountController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Input Nominal",
                              labelText: "Amount",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 6.0,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Input Amount';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Note",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: TextFormField(
                            controller: noteController,
                            maxLines: 3,
                            maxLength: 100,
                            decoration: InputDecoration(
                              hintText: "Add Note (Max 100 characters)",
                              labelText: "Note",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 6.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState != null &&
                                _formKey.currentState!.validate()) {
                              if (dateController.text.isEmpty ||
                                  selectedCategory == null ||
                                  selectedCategory!.isEmpty ||
                                  amountController.text.isEmpty) {
                                // Validation failed
                                return;
                              }

                              String date = dateController.text;
                              String amount = amountController.text;
                              String note = noteController.text;

                              Map<String, dynamic> planning = {
                                'date': _parseDate(date),
                                'category': selectedCategory!,
                                'amount': amount,
                                'note': note,
                              };
                              planningData.addPlanning(planning);

                              dateController.clear();
                              amountController.clear();
                              noteController.clear();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 23, 103, 26),
                            padding: const EdgeInsets.all(10.0),
                          ),
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "List Planning",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 24.0, thickness: 2.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: planningData.plannings.length,
              itemBuilder: (context, index) {
                final planning = planningData.plannings[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.only(bottom: 8.0),
                  color: const Color.fromARGB(255, 23, 103, 26),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 50,
                          height: 70,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              (index + 1).toString(),
                              style: const TextStyle(
                                color: Color.fromARGB(255, 23, 103, 26),
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Date: ${_formatDate(planning['date'])}",
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Category: ${planning['category']}",
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Amount: ${planning['amount']}",
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Note: ${planning['note']}",
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                            const SizedBox(width: 8.0),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                planningData.removePlanning(planning);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showCategoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Category'),
          content: Column(
            children: categoryList.map((category) {
              return ListTile(
                title: Text(category),
                onTap: () {
                  setState(() {
                    selectedCategory = category;
                    Navigator.of(context).pop();
                  });
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color.fromARGB(255, 23, 103, 26),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            colorScheme: const ColorScheme.light(
              primary: Color.fromARGB(255, 23, 103, 26),
            ).copyWith(secondary: const Color.fromARGB(255, 23, 103, 26)),
          ),
          child: child!,
        );
      },
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        dateController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  DateTime _parseDate(String date) {
    List<String> dateParts = date.split('/');
    int day = int.parse(dateParts[0]);
    int month = int.parse(dateParts[1]);
    int year = int.parse(dateParts[2]);
    return DateTime(year, month, day);
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
}
