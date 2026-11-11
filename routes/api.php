<?php

use App\Http\Controllers\KriteriaController;
use App\Http\Controllers\SubKriteriaController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::apiResource('kriteria', KriteriaController::class)
    ->parameters(['kriteria' => 'id']);

Route::apiResource('sub-kriteria', SubKriteriaController::class)
    ->parameters(['sub-kriteria' => 'id']);
