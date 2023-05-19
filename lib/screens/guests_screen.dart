import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:neivor_tecnico/screens/screens.dart';
import 'package:neivor_tecnico/screens/widget/formularios/custom_appbar.dart';

class GuestsScreen extends StatefulWidget {
  static const String name = 'guests_screen';

  const GuestsScreen({super.key});

  @override
  State<GuestsScreen> createState() => _InvitadosScreenState();
}

class _InvitadosScreenState extends State<GuestsScreen> {
  TextEditingController formName = TextEditingController();

  TextEditingController formCel = TextEditingController();

  TextEditingController formInstruccion = TextEditingController();
  TextEditingController formMoreDays = TextEditingController();

  TextEditingController formdays = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List formControl = [];
  static const List<String> appFormItems = [
    'Nombre completo',
    'Celular',
    'Visita de varios dias',
    'Dia de la visita',
    'Intrucciones al personal',
  ];

  Map<String, dynamic> resForm = {};

  setValue() {
    resForm = {
      'name': formName.text,
      'celular': formCel.text,
      'isVarios': _visitMoreDays ? 'visita especial' : 'visita comun',
      'dias': formdays.text,
      'Visita varios dias': formMoreDays.text,
      'instrucciones': formInstruccion.text
    };
    setState(() {});
  }

  @override
  void initState() {
    formControl = [formName, formCel, formdays, formMoreDays, formInstruccion];
    super.initState();
  }

  late bool _visitMoreDays = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
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
                        )),
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
                  formItem: appFormItems[3], formControl: formControl[3]),
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
                  formItem: appFormItems[4], formControl: formControl[4]),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: const Size(350, 40),
                        backgroundColor: Colors.deepPurple),
                    onPressed: () {
                      _formKey.currentState?.validate();
                      setValue();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VisitDetail(
                              resForm: resForm,
                            ),
                          ));
                    },
                    child: const Text('continuar')),
              )
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
  });

  final String formItem;
  final TextEditingController formControl;
  final TextInputType? type;
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
            child: FormInput(
              controller: formControl,
              hint: formItem,
              type: type,
            ),
          ),
        ],
      ),
    );
  }
}

// 
        
        
    