<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class Products extends Model
{
    // use HasFactory;

    protected $fillable = [
        'name',
        'price',
        'photo',
        'is_promo'
    ];
}
