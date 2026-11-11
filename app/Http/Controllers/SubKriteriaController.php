<?php

namespace App\Http\Controllers;

use App\Models\SubKriteria;
use Illuminate\Http\Request;

class SubKriteriaController extends Controller
{
    
    public function index()
    {
        return SubKriteria::with('kriteria')->get();
    }

    // POST /api/sub-kriteria -> 201 Created
    public function store(Request $request)
    {
        $request->validate([
            'kriteria_id'       => 'required|exists:kriterias,id',
            'nama_sub_kriteria' => 'required|string|max:150',
        ]);

        return SubKriteria::create($request->all());
    }

    // GET /api/sub-kriteria/{id}
    public function show($id)
    {
        return SubKriteria::with('kriteria')->findOrFail($id);
    }

    // PUT /api/sub-kriteria/{id}
    public function update(Request $request, $id)
    {
        $sub = SubKriteria::findOrFail($id);

        $request->validate([
            'kriteria_id'       => 'sometimes|required|exists:kriterias,id',
            'nama_sub_kriteria' => 'sometimes|required|string|max:150',
        ]);

        $sub->update($request->all());
        return $sub;
    }

    // DELETE /api/sub-kriteria/{id} -> 204 No Content
    public function destroy($id)
    {
        $sub = SubKriteria::findOrFail($id);
        $sub->delete();
        return response()->noContent();
    }
}
