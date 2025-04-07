<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Products;

class ProductController extends Controller
{
    public function fetch(){
        $p = Products::all();

        return response()->json($p);
    }

    public function get(Request $request){
        $p = Products::find($request->id);

        return response()->json($p);
    }

    public function store(Request $request){
        $request->validate([
            'name' => 'required|string',
            'price' => 'required|numeric',
            'photo' => 'string',
            'is_promo' => 'boolean'
        ]);

        $p = Products::create([
            'name' => $request->name,
            'price' => $request->price,
            'photo' => $request->photo,
            'is_promo' => $request->is_promo
        ]);

        if($p){
            return response()->json('success');
        }
        else{
            return response()->json('failed');
        }
    }

    public function update(Request $request){
        $request->validate([
            'name' => 'required|string',
            'price' => 'required|numeric',
            'photo' => 'string',
            'is_promo' => 'boolean'
        ]);

        $p = Products::find($request->id);
        $p->update([
            'name' => $request->name,
            'price' => $request->price,
            'photo' => $request->photo,
            'is_promo' => $request->is_promo
        ]);

        $p->save();

        if($p){
            return response()->json('success');
        }
        else{
            return response()->json('failed');
        }
    }

    public function delete(Request $request){
        $p = Products::find($request->id)->delete();

        if($p){
            return response()->json('success');
        }
        else{
            return response()->json('failed');
        }
    }
}
