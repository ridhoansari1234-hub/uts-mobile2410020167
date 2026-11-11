<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Kriteria extends Model
{
    use HasFactory;

    protected $fillable = ['nama_kriteria', 'prioritas'];

    // One-to-Many: satu kriteria punya banyak sub kriteria
    public function subKriterias(): HasMany
    {
        return $this->hasMany(SubKriteria::class);
    }
}
