import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_flutter_components_sqart/main.dart';

class PhoneInput extends StatelessWidget {
  final FocusNode? focusNode;
  final double? width;
  final Function(CountryCode)? changePhoneCode;
  final TextEditingController? phoneNumberController;
  final String? initialCountry;
  final bool isOptional;

  const PhoneInput({
    Key? key,
    this.focusNode,
    this.width,
    this.isOptional = false,
    this.changePhoneCode,
    this.phoneNumberController,
    this.initialCountry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: squareartNeutral.v40, width: 1, style: BorderStyle.solid)),
              width: width! * .2,
              height: 40,
              child: CountryCodePicker(
                padding: const EdgeInsets.all(0),
                onChanged: changePhoneCode,
                hideMainText: false,
                showFlagMain: false,
                showFlag: true,
                showDropDownButton: true,
                initialSelection: initialCountry == null ? 'sg' : initialCountry!,
                hideSearch: false,
                searchDecoration: InputDecoration(
                  labelText: "Phone Code",
                  prefixIcon: Icon(
                    Icons.search,
                    color: squareArtPrimary.v100,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: squareArtSecondary.v100),
                  ),
                ),
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                alignLeft: true,
              ),
            ),
          ),
          horizontalMediumSpace,
          Flexible(
            flex: 5,
            child: SizedBox(
              height: 40,
              child: TextFormField(
                enabled: true,
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                inputFormatters: [LengthLimitingTextInputFormatter(15),FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                obscureText: false,
                focusNode: focusNode,
                decoration: InputDecoration(
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: squareartNeutral.v40),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: squareartNeutral.v40),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: isOptional ? "Phone Number (optional)" : "",
                  labelStyle: TextStyle(color: squareartNeutral.v80, fontSize: 13),
                  hintText: "Phone Number",
                  hintStyle: hintStyle(),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: squareartSecondary100),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
