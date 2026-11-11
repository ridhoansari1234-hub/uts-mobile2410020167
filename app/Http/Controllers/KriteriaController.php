<?php

namespace App\Http\Controllers;

use App\Models\Kriteria;
use Illuminate\Http\Request;

class KriteriaController extends Controller
{
    // GET /api/kriteria -> semua kriteria beserta sub kriterianya (One-to-Many)
    public function index()
    {
        return Kriteria::with('subKriterias')->orderBy('prioritas')->get();
    }

    // POST /api/kriteria -> 201 Created
    public function store(Request $request)
    {
        $request->validate([
            'nama_kriteria' => 'required|string|max:100',
            'prioritas'     => 'required|integer|min:1',
        ]);

        return Kriteria::create($request->all());
    }

    // GET /api/kriteria/{id}
    public function show($id)
    {
        return Kriteria::with('subKriterias')->findOrFail($id);
    }

    // PUT /api/kriteria/{id}
    public function update(Request $request, $id)
    {
        $kriteria = Kriteria::findOrFail($id);

        $request->validate([
            'nama_kriteria' => 'sometimes|required|string|max:100',
            'prioritas'     => 'sometimes|required|integer|min:1',
        ]);

        $kriteria->update($request->all());
        return $kriteria;
    }

    // DELETE /api/kriteria/{id} -> 204 No Content
    public function destroy($id)
    {
        $kriteria = Kriteria::findOrFail($id);
        $kriteria->delete();
        return response()->noContent();
    }
}
