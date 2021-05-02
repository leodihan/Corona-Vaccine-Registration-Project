import 'package:covid_vaccination/authentication/data/models/user.dart';
import 'package:covid_vaccination/authentication/data/repository/auth_repository.dart';
import 'package:covid_vaccination/authentication/presentation/components/authentication_button.dart';
import 'package:covid_vaccination/authentication/presentation/components/header.dart';
import 'package:covid_vaccination/authentication/presentation/components/hover_text_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UserLoginPage extends StatefulWidget {
  @override
  _UserLoginPageState createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _occupationController = TextEditingController();
  TextEditingController _nidController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  AuthRepository _authRepository = AuthRepository();

  int state = 0;

  getWidget(int state) {
    switch (state) {
      case 0:
        return buildLoginColumn();
        break;
      case 1:
        return buildNextColumn();
        break;
      case 2:
        return buildSignupColumn();
        break;
      default:
        return buildLoginColumn();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 244, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            const Spacer(),
            Row(
              children: [
                Lottie.asset(
                  'assets/lottie/corona_doctor.json',
                  height: 512,
                  width: 642,
                ),
                const Spacer(),
                Container(
                  //height: isLogin ? 500 : 600,
                  height: 600,
                  width: 642,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: EdgeInsets.all(16),
                  child: getWidget(state),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  buildSignupColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        Text(
          'Signup',
          style: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.bold,
            height: 1.1,
            letterSpacing: -2.5,
          ),
        ),
        const Spacer(),
        TextFormField(
          controller: _nidController,
          decoration: InputDecoration(
            labelText: 'NID',
            labelStyle: TextStyle(fontSize: 22),
            hintText: 'eg. XXXXXXXXXX',
            hintStyle: TextStyle(fontSize: 22),
            prefixIcon: Icon(Icons.badge),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _occupationController,
                decoration: InputDecoration(
                  labelText: 'Occupation',
                  labelStyle: TextStyle(fontSize: 22),
                  hintText: 'eg. Advocate',
                  hintStyle: TextStyle(fontSize: 22),
                  prefixIcon: Icon(Icons.work),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 32),
            Container(
              width: 128,
              child: TextFormField(
                controller: _ageController,
                decoration: InputDecoration(
                  labelText: 'Age',
                  labelStyle: TextStyle(fontSize: 22),
                  hintText: 'eg. 57',
                  hintStyle: TextStyle(fontSize: 22),
                  prefixIcon: Icon(Icons.schedule),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 32),
            Expanded(
              child: TextFormField(
                controller: _locationController,
                decoration: InputDecoration(
                  labelText: 'Location',
                  labelStyle: TextStyle(fontSize: 22),
                  hintText: 'eg. Banasree',
                  hintStyle: TextStyle(fontSize: 22),
                  prefixIcon: Icon(Icons.map),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        TextFormField(
          controller: _phoneController,
          decoration: InputDecoration(
            labelText: 'Phone no',
            labelStyle: TextStyle(fontSize: 22),
            hintText: 'eg. 017-XXXX-XXXX',
            hintStyle: TextStyle(fontSize: 22),
            prefixIcon: Icon(Icons.call),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        const SizedBox(height: 32),
        AuthenticationButton(
          text: 'SIGNUP',
          onTap: () {
            User user = User(
              name: _nameController.text,
              email: _emailController.text,
              password: _passwordController.text,
              nid: _nidController.text,
              phoneNo: int.parse(_phoneController.text),
              location: _locationController.text,
              occupation: _occupationController.text,
              age: int.parse(_ageController.text),
            );

            print(
                '${user.name}, ${user.email}, ${user.password}, ${user.phoneNo.toString()}, ${user.location}, ${user.occupation}, ${user.nid}, ${user.age.toString()}, ');

            _authRepository.registerUser(user);
          },
        ),
        const Spacer(),
        Align(
          alignment: Alignment.center,
          child: HoverTextButton(
            text: 'Already have an account? Login!',
            onTap: () {
              setState(() {
                state = 0;
              });
            },
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  buildNextColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        Text(
          'Signup',
          style: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.bold,
            height: 1.1,
            letterSpacing: -2.5,
          ),
        ),
        const Spacer(),
        TextFormField(
          controller: _nameController,
          decoration: InputDecoration(
            labelText: 'Name',
            labelStyle: TextStyle(fontSize: 22),
            hintText: 'eg. Ikramul Hasan',
            hintStyle: TextStyle(fontSize: 22),
            prefixIcon: Icon(Icons.person),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        const SizedBox(height: 32),
        TextFormField(
          controller: _emailController,
          decoration: InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(fontSize: 22),
            hintText: 'eg. ikramhasan.dev@gmail.com',
            hintStyle: TextStyle(fontSize: 22),
            prefixIcon: Icon(Icons.email),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        const SizedBox(height: 32),
        TextFormField(
          controller: _passwordController,
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: TextStyle(fontSize: 22),
            hintText: 'eg. 12345678',
            hintStyle: TextStyle(fontSize: 22),
            prefixIcon: Icon(Icons.lock),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        const SizedBox(height: 32),
        AuthenticationButton(
          text: 'NEXT',
          onTap: () {
            setState(() {
              state = 2;
            });
          },
        ),
        const Spacer(),
        Align(
          alignment: Alignment.center,
          child: HoverTextButton(
            text: 'Already have an account? Login!',
            onTap: () {
              setState(() {
                state = 0;
              });
            },
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  buildLoginColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        Text(
          'Login',
          style: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.bold,
            height: 1.1,
            letterSpacing: -2.5,
          ),
        ),
        const Spacer(),
        TextFormField(
          controller: _emailController,
          decoration: InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(fontSize: 22),
            hintText: 'eg. ikramhasan.dev@gmail.com',
            hintStyle: TextStyle(fontSize: 22),
            prefixIcon: Icon(Icons.email),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        const SizedBox(height: 32),
        TextFormField(
          controller: _passwordController,
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: TextStyle(fontSize: 22),
            hintText: 'eg. 12345678',
            hintStyle: TextStyle(fontSize: 22),
            prefixIcon: Icon(Icons.lock),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        const SizedBox(height: 32),
        AuthenticationButton(
          text: 'LOGIN',
          onTap: () {
            _authRepository.loginUser(
              _emailController.text,
              _passwordController.text,
            );
          },
        ),
        const Spacer(),
        Align(
          alignment: Alignment.center,
          child: HoverTextButton(
            text: 'Don\'t have an account? Signup!',
            onTap: () {
              setState(() {
                state = 1;
              });
            },
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
