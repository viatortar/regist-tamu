<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Tamu extends Model
{

    protected $table = 'tamu';

    protected $fillable = ['nama', 'jam', 'alamat'];

    public $timestamps = false;

}