<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\ProductController;

// Route::get('/user', function (Request $request) {
//     return $request->user();
// })->middleware('auth:sanctum');

Route::prefix('products')->group(function (){
   Route::get('/', [ProductController::class, 'fetch']);
   Route::get('/get', [ProductController::class, 'get']);
   Route::post('/create', [ProductController::class, 'store']);
   Route::post('/update', [ProductController::class, 'update']);
   Route::delete('/delete', [ProductController::class, 'delete']);
});