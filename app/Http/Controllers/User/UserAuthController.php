<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Mail;

class UserAuthController extends Controller
{
    public function UserRegister(Request $request){
        $request->validate([
            "email" => "required",
            "password"=>"required",
            "name"=>"required",
            "confirm_password"=>"required"
        ]);

        $name = $request->input("name");
        $email = $request->input("email");
        $password = $request->input("password");
        $confirm_password = $request->input("confirm_password");

        $data = DB::table("users")->where('email', $email)->get()->count();

        if ($data > 0) {
            $request->session()->flash("msg","user already exists");
            return view("auth/login");
        } else {
            if ($password != $confirm_password) {
                $request->session()->flash("msg","Password does not match");
                return view("auth/login");
            } else {
                $user = array(
                    "name" => $name,
                    "email" => $email,
                    "password" => $password,
                    'updated_at' => date('y-m-d h:i:s'),
                    'created_at' => date('y-m-d h:i:s')
                );

                DB::table('users')->insert($user);
                $data=["name"=>$name,"email"=>$email];
                $user['to']= $email;
                Mail::send("auth/mail",$data,function($messeges) use($user){
                    $messeges->to($user["to"]);
                    $messeges->subject("verify email");
                });
                $request->session()->flash("msg","Account created successfully. Please verify your email.");
                return view("auth/login");
            }
                
        }
    }

    public function sendmail(){
        $data=["name"=>"shoyeb",];
        $user['to']= "sakilak388@gmail.com";
        Mail::send("auth/mail",$data,function($messeges) use($user){
            $messeges->to($user["to"]);
            $messeges->subject("verify email");

        });
    }
    
    public function EmailVerify(Request $request, $email){
        $data = DB::table("users")->where('email', $email)->get()->count();

        if ($data==0) {
            $request->session()->flash("login_msg","Email not found");
        }else {
            $array = array(
                "email_verified_at"=> date('y-m-d h:i:s')
            );
            User::where("email",$email)->update($array);
            $request->session()->flash("login_msg","Email verified successfully. Now login");
        }

        return view("auth/login");
 
    }

    public function UserLoginAuth(Request $request){
        $request->validate([
            "email"=>"required",
            "password"=>"required"
        ]);

        $email = $request->input("email");
        $password = $request->input("password");

        $data = User::where("email",$email)->where("password",$password)->get();

        if (!isset($data[0])) {
            $request->session()->flash("login_msg","please enter correct login information");
            return redirect(route("auth.login"));
        }else {
            $request->session()->put("USER_ID", $data[0]->id);
            return redirect(url("/"));
        }
    }

    public function UserLogout(Request $request){
        $request->session()->forget("USER_ID");
        return redirect(url("/"));
    }
}
