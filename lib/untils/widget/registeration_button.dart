import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whiskey_with_bloc/untils/SnackBarHelper.dart';

import '../../bloc/signup/registerationbtn/registeration_submit_bloc.dart';
import '../Utiks.dart';

class RegisterationButton extends StatelessWidget {
  const RegisterationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterationSubmitBloc, RegisterationSubmitState>(
      listener: (context, state) {
        print(state);
if(state is RegisterationSubmitError){
  SnackBarHelper.showSnackBar(context, message: state.data);
}

      },
      child: BlocBuilder<RegisterationSubmitBloc, RegisterationSubmitState>(
        builder: (context, state) {
          return Stack(
            children: [
              Center(
                child: Utils.commonLightedButton(
                    context, "NEXT", onTap: () {
                  BlocProvider.of<RegisterationSubmitBloc>(context).add(RegisterationStart());
                  //   controller.updateProfile();
                }),
              ),

              if(state is RegisterationSubmitLoading)
                CircularProgressIndicator()
            ],
          );
        },
      ),
    );
  }
}
