<?php

use App\Http\Controllers\AdminController;
use Facade\FlareClient\View;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Backend\AdminProfileController;
use App\Http\Controllers\Backend\BrandController;
use App\Http\Controllers\Backend\CategoryController;
use App\Http\Controllers\Backend\ProductController;
use App\Http\Controllers\Backend\SliderController;
use App\Http\Controllers\backend\SubCategoryController;
use App\Http\Controllers\Frontend\IndexController;
use App\Http\Controllers\SiteSettingController;
use App\Http\Controllers\Frontend\CartController;
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

Route::post("admin/auth",[AdminController::class,'AdminLogin'])->name("admin.login");

Route::group(['middleware'=>['adminauth']],function(){       //instructor routes


Route::get("/admin/dashboard",[AdminProfileController::class,'AdminDashboard'])->name('admin.dashboard');

Route::get('/admin/profile', [AdminProfileController::class, 'AdminProfile'])->name('admin.profile.view');

Route::get('/admin/profile/edit',[AdminProfileController::class,'AdminProfileEdit'])->name('admin.profile.edit');

Route::get('/admin/change/password',[AdminProfileController::class,'AdminChangePassword'])->name('admin.change.password');

//backend category routes

Route::get('/category/view',[CategoryController::class,'CategoryView'])->name('all.category');

Route::post('/category/store',[CategoryController::class,'CategoryStore'])->name('store.category');

Route::get('/category/edit/{slug}',[CategoryController::class,'CategoryEdit'])->name('edit.category');

Route::post('/category/update/{slug}',[CategoryController::class,'CategoryUpdate'])->name("update.category");

Route::get('/category/delete/{id}',[CategoryController::class,'CategoryDelete'])->name("delete.category");

//backend sub category routes

Route::get('/category/sub/view',[SubCategoryController::class,'SubCategoryView'])->name("all.subcategory");

Route::post('category/sub/store',[SubCategoryController::class,'SubCategoryStore'])->name("add.subcategory");

Route::get("/category/sub/edit/{id}",[SubCategoryController::class,'SubCategoryEdit'])->name("edit.subcategory");

Route::post("category/sub/update",[SubCategoryController::class,'SubCategoryUpdate'])->name("update.subcategory");

Route::get("category/sub/delete/{id}",[SubCategoryController::class,'SubCategoryDelete'])->name("delete.subcategory");

//backend sub sub category routes

Route::get("category/sub/sub/view", [SubCategoryController::class,'SubSubCategoryView'])->name("all.subsubcategory");

Route::get('category/subcategory/ajax/{category_id}', [SubCategoryController::class, 'GetSubCategory']);

Route::get('category/sub-subcategory/ajax/{subcategory_id}', [SubCategoryController::class, 'GetSubSubCategory']);

Route::post("category/sub/sub/store",[SubCategoryController::class,'SubSubCategoryStore'])->name("store.subsubcategory");

Route::get("category/sub/sub/edit/{id}",[SubCategoryController::class, 'SubSubCategoryEdit'])->name("edit.subsubcategory");

Route::post("category/sub/sub/update",[SubCategoryController::class,'SubSubCategoryUpdate'])->name('update.subsubcategory');

Route::get("category/sub/sub/delete/{id}",[SubCategoryController::class,'SubSubCategoryDelete'])->name("delete.subsubcategory");

//Backend Slidder Routes

Route::get("slider/view",[SliderController::class, "SliderView"])->name("manage-slider");

Route::post("slider/store",[SliderController::class,"SliderStore"])->name("slider.store");

Route::get("slider/edit/{id}",[SliderController::class,"SliderEdit"])->name("slider.edit");

Route::post("slider/update",[SliderController::class,"SliderUpdate"])->name("slider.update");

Route::get("slider/delete/{id}",[SliderController::class,"SliderDelete"])->name("slider.delete");

Route::get('slider/inactive/{id}', [SliderController::class, 'SliderInactive'])->name('slider.inactive');

Route::get('slider/active/{id}', [SliderController::class, 'SliderActive'])->name('slider.active');

//Backend Brands

Route::get('brand/view',[BrandController::class,'BrandView'])->name("all.brand");

Route::post('brand/store',[BrandController::class,'BrandStore'])->name("brand.store");

Route::get('brand/edit/{id}',[BrandController::class,'BrandEdit'])->name("brand.edit");

Route::post('brand/update',[BrandController::class, 'BrandUpdate'])->name("brand.update");

Route::get('brand/delete/{id}',[BrandController::class,'BrandDelete'])->name("brand.delete");


//backend products

Route::get('product/manage',[ProductController::class,'ManageProduct'])->name("manage-product");

Route::get('product/add',[ProductController::class, 'AddProduct'])->name("add.product");

Route::post('product/store',[ProductController::class, 'StoreProduct'])->name("store.product");

Route::get('product/edit/{id}',[ProductController::class,'EditProduct'])->name("edit.product");

Route::post('product/update',[ProductController::class,'UpdateProduct'])->name("update.product");

Route::get('product/multiimg/delete/{id}', [ProductController::class, 'MultiImageDelete'])->name('product.multiimg.delete');

Route::post('product/thambnail/update', [ProductController::class, 'ThambnailImageUpdate'])->name('update.thumbnail.image');

Route::post('product/image/update',[ProductController::class,'UpdateProductImage'])->name("update.product.image");

Route::get('product/delete/{id}',[ProductController::class,'DeleteProduct'])->name("delete.product");

Route::get('product/inactive/{id}', [ProductController::class, 'ProductInactive'])->name('product.inactive');

Route::get('product/active/{id}', [ProductController::class, 'ProductActive'])->name('product.active');

//stock product

Route::get("stock/product",[ProductController::class,'StockProduct'])->name("stock.product");

//admin site setting

Route::get("setting/site",[SiteSettingController::class, 'SiteSetting'])->name("setting.site");

Route::post("setting/site/update",[SiteSettingController::class,'UpdateSiteSetting'])->name("update.sitesetting");

Route::get("setting/seo",[SiteSettingController::class,'SeoSetting'])->name("setting.seo");

Route::post("setting/seo/update",[SiteSettingController::class,'UpdateSeoSetting'])->name("update.seo");


}); //guard ends





//frontend routes

Route::get("/",[IndexController::class,"index"])->name('frontend.index');

Route::get('/login',function(){return view('auth.login');})->name('auth.login');
Route::get('/forgot-password',function(){return view('auth.forgot_password');})->name('auth.forgot_password');

//product routes

Route::get('/product/details/{id}/{slug}', [IndexController::class, 'ProductDetails']);

//subcategory based data

Route::get('/subcategory/product/{subcat_id}/{slug}', [IndexController::class, 'SubCatWiseProduct']);

// Frontend Sub-SubCategory wise Data
Route::get('/subsubcategory/product/{subsubcat_id}/{slug}', [IndexController::class, 'SubSubCatWiseProduct']);

//product view modal 

Route::get('/product/view/modal/{id}', [IndexController::class, 'ProductViewAjax']);

Route::post('/cart/data/store/{id}', [CartController::class, 'AddToCart']); //add to cart

Route::get('/product/mini/cart/', [CartController::class, 'AddMiniCart']); //mini cart view

Route::get('/minicart/product-remove/{rowId}', [CartController::class, 'RemoveMiniCart']); //remove mini cart

//mycart 



