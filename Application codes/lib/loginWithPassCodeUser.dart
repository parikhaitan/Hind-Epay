//UI

import "package:flutter/material.dart";

import "package:flutter_screen_lock/flutter_screen_lock.dart";

import "Backend/passCodeSetterUser.dart";
import "HomeUser.dart";



class LoginWithPasscodeUser extends StatefulWidget {
  const LoginWithPasscodeUser({super.key});

  @override
  State<LoginWithPasscodeUser> createState() => _LoginWithPasscodeUserState();
}

class _LoginWithPasscodeUserState extends State<LoginWithPasscodeUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(


          title: const Text('Login'),

        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 700,
              ),
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () => showDialog<void>(
                      context: context,
                      builder: (context) {
                        return ScreenLock(
                            correctString:  PasscodeSetterUser.password ,//RegisterFormUser.password,
                            onCancelled: Navigator.of(context).pop,
                            onUnlocked: (){
                              Navigator.of(context).pop;
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const HomeUser()),
                              );
                            }

                        );
                      },
                    ),
                    child: const Text('Login  password'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "secondScreen");
                    },
                    child: const Text('Back'),
                  ), ],
              ),
            ),
          ),
        ));

  }
}