<?php

namespace App\Http\Controllers;

use App\Models\Tamu;
use Illuminate\Http\Request;

class TamuController extends Controller
{
    public function create(Request $request)
    {
        $nama = $request->input('nama');
        $jam = $request->input('jam');
        $alamat = $request->input('alamat');

        $tamu =tamu :: create([
            'nama' => $nama,
            'jam' => $jam,
            'alamat' => $alamat,
    
        ]);
        return $this->responseHasil(200, true, $tamu);
    }

    public function list()
    {
        $tamu = tamu :: all();
        return $this->responseHasil(200, true, $tamu);
    }

    public function show($id)
    {
        $tamu = tamu::findOrFail($id);
        return $this->responseHasil(200, true, $tamu);
    }

    public function update(Request $request, $id)
    {
        $nama = $request->input('nama');
        $jam = $request->input('jam');
        $alamat = $request->input('alamat');

        $tamu = tamu::findOrFail($id);
        $result = $tamu->update([
            'nama' => $nama,
            'jam' => $jam,
            'alamat' => $alamat,
        ]);
        return $this->responseHasil(200, true, $result);
    }

    public function delete($id)
    {
        $tamu = tamu::findOrFail($id);
        $delete = $tamu->delete();
        return $this->responseHasil(200, true, $delete);
    }
}