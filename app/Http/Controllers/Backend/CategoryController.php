<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Auth\Middleware\RequirePassword;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function CategoryView(){
        $category = Category::latest()->get();
        return view("backend.category.category_view", compact("category"));
    }
    public function CategoryStore(Request $request){
        $request->validate([
    		'category_name' => 'required | unique:categories',
    		'category_icon' => 'required',
    	]);

    	 

	Category::insert([
		'category_name' => $request->category_name,
		'category_slug' => strtolower(str_replace(' ', '-',$request->category_name)),
		'category_icon' => $request->category_icon,

    	]);

	    $notification = array(
			'message' => 'Category Inserted Successfully',
			'alert-type' => 'success'
		);

		return redirect()->back()->with($notification);

    } //end

    public function CategoryEdit($slug){
        $category["result"] = Category::where("category_slug",$slug)->get();

        return view('backend.category.category_edit',$category);

    }
    public function CategoryUpdate(Request $request, $slug){
        $request->validate([
    		'category_name' => 'required | unique:categories',
    		'category_icon' => 'required',
    	]);

        Category::where("category_slug",$slug)->update([
            'category_name' => $request->category_name,
            'category_slug' => strtolower(str_replace(' ', '-',$request->category_name)),
            'category_icon' => $request->category_icon,
    
            ]);
    
            $notification = array(
                'message' => 'Category Updated Successfully',
                'alert-type' => 'success'
            );
    
            return redirect()->route('all.category')->with($notification);    
    }
    public function CategoryDelete($id){
        Category::findOrFail($id)->delete();

    	$notification = array(
			'message' => 'Category Deleted Successfully',
			'alert-type' => 'success'
		);

		return redirect()->back()->with($notification);
    }

}
