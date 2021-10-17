<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Admin;
class AdminProfileController extends Controller
{
   function AdminDashboard(){
       return view('admin.admin_index');
   } 
   function AdminProfile(){
       $adminData = Admin::find(1);
       return view('admin.admin_profile_view',compact('adminData'));
   }
   function AdminProfileEdit(){
    $editData = Admin::find(1);
    return view('admin.admin_profile_edit',compact('editData'));
   }
   function AdminChangePassword(){
       return view("admin.admin_change_password");
   }
}
