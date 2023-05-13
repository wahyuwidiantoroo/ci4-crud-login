<?php

namespace App\Controllers;

class Pages extends BaseController
{
    public function index()
    {
        // $faker = \Faker\Factory::create();
        // dd($faker->name);

        $data = [
            'title' => 'Home | Wahyu Widiantoro'
        ];
        return view('pages/home', $data);
    }

    public function about()
    {
        $data = [
            'title' => 'About | Wahyu Widiantoro'
        ];
        return view('pages/about', $data);
    }

    public function contact()
    {
        $data = [
            'title' => 'Contact | Wahyu Widiantoro',
            'alamat' => [
                [
                    'tipe' => 'Kampus',
                    'alamat' => 'Klotok',
                    'kota' => 'Kediri'
                ],
                [
                    'tipe' => 'Rumah',
                    'alamat' => 'Kemlokolegi',
                    'kota' => 'Nganjuk'
                ]
            ]
        ];
        return view('pages/contact', $data);
    }
}
