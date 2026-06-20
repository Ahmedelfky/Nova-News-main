import 'package:supabase_flutter/supabase_flutter.dart';

class AuthServies {
  final SupabaseClient supabase=Supabase.instance.client;

  Future<AuthResponse>loginWithEmail({required String email,required String password})async{
    try {
      final response=await supabase.auth.signInWithPassword(email: email, password: password);
      return response;
    }  catch (e) {
      throw Exception(e);
    }

  }

  Future<AuthResponse> signUpWithEmail({required String email,required String password,required String fullName})async{
    try {
      final response=await supabase.auth.signUp(
          email: email,
          password: password,
        data: {
            'full_name':fullName,
        }

      );
      return response;
    }  catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> resetPassword({required String email})async{
    try {
      await supabase.auth.resetPasswordForEmail(email);
    }  catch (e) {
      throw Exception(e.toString());
    }
  }
}