import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

import 'package:neivor_tecnico/screens/screens.dart';
import 'package:neivor_tecnico/screens/widget/formularios/custom_appbar.dart';

class GuestsScreen extends StatefulWidget {
  static const String name = 'guests_screen';

  const GuestsScreen({Key? key}) : super(key: key);

  @override
  _GuestsScreenState createState() => _GuestsScreenState();
}

class _GuestsScreenState extends State<GuestsScreen> {
  TextEditingController formName = TextEditingController();
  TextEditingController formCel = TextEditingController();
  TextEditingController formInstruccion = TextEditingController();
  TextEditingController formMoreDays = TextEditingController();
  TextEditingController formdays = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<TextEditingController> formControl = [];
  static const List<String> appFormItems = [
    'Nombre completo',
    'Celular',
    'Visita de varios dias',
    'Dia de la visita',
    'Instrucciones al personal',
  ];

  Map<String, dynamic> resForm = {};

  void setValue() {
    resForm = {
      'name': formName.text,
      'celular': formCel.text,
      'isVarios': _visitMoreDays ? 'visita especial' : 'visita comun',
      'dias': formdays.text,
      'Visita_varios_dias': formMoreDays.text,
      'instrucciones': formInstruccion.text
    };
    setState(() {});
  }

  @override
  void initState() {
    formControl = [formName, formCel, formdays, formMoreDays, formInstruccion];
    super.initState();
  }

  bool _visitMoreDays = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Text(
                  'Detalle de la visita',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              _CustomListTile(
                formItem: appFormItems[0],
                formControl: formControl[0],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: const CountryCodePicker(
                        initialSelection: 'Ar',
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: _CustomListTile(
                        type: TextInputType.number,
                        formItem: appFormItems[1],
                        formControl: formControl[1],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Visita de varios dias',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Switch(
                      value: _visitMoreDays,
                      onChanged: (bool value) {
                        setState(() {
                          _visitMoreDays = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              _CustomListTile(
                formItem: appFormItems[3],
                formControl: formControl[3],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '(Opcional)',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              _CustomListTile(
                formItem: appFormItems[4],
                formControl: formControl[4],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(350, 40),
                    backgroundColor: Colors.deepPurple,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setValue();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VisitDetail(
                            resForm: resForm,
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text('continuar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.formItem,
    required this.formControl,
    this.type,
    this.onTap,
  });

  final String formItem;
  final TextEditingController formControl;
  final TextInputType? type;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            formItem,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: formItem == 'Dia de la visita'
                ? DateTimePicker(
                    controller: formControl,
                    type: DateTimePickerType.date,
                    dateMask: 'dd-mm-yyyy',
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                    decoration: InputDecoration(
                      hintText: formItem,
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: (value) {},
                  )
                : formItem == 'Instrucciones al personal'
                    ? TextFormField(
                        controller: formControl,
                        keyboardType: type,
                        decoration: InputDecoration(
                          hintText: formItem,
                          border: const OutlineInputBorder(),
                        ),
                      )
                    : TextFormField(
                        controller: formControl,
                        keyboardType: type,
                        decoration: InputDecoration(
                          hintText: formItem,
                          border: const OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Este campo es obligatorio';
                          }
                          return null;
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
