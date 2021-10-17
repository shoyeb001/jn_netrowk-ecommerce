<?php

use Facade\FlareClient\View;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Backend\AdminProfileController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/



//admin routes

Route::get("/admin/login",function(){ return view('auth/admin_login');});

Route::get("/admin/dashboard",[AdminProfileController::class,'AdminDashboard'])->name('admin.dashboard');
Route::get('/admin/profile', [AdminProfileController::class, 'AdminProfile'])->name('admin.profile.view');
Route::get('/admin/profile/edit',[AdminProfileController::class,'AdminProfileEdit'])->name('admin.profile.edit');
Route::get('/admin/change/password',[AdminProfileController::class,'AdminChangePassword'])->name('admin.change.password');




//frontend routes

Route::get("/",function(){ return view('frontend.index');})->name('frontend.index');

Route::get('/login',function(){return view('auth.login');})->name('auth.login');
Route::get('/forgot-password',function(){return view('auth.forgot_password');})->name('auth.forgot_password');