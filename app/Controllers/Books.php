<?php

namespace App\Controllers;

use App\Models\BooksModel;

use function PHPUnit\Framework\throwException;

class Books extends BaseController
{
    protected $booksModel;
    public function __construct()
    {
        $this->booksModel = new BooksModel();
    }
    public function index()
    {
        // $daftar = $this->booksModel->findAll();
        $daftar = $this->booksModel->getBooks();
        $data = [
            'title' => 'Daftar Buku',
            'books' => $daftar
        ];

        // $db = \Config\Database::connect();
        // $buku = $db->query("SELECT * FROM books");
        // foreach ($buku->getResultArray() as $row) {
        //     d($row);
        // }

        // $booksModel = new \App\Models\BooksModel();
        // $booksModel = new BooksModel();
        // $daftar = $booksModel->findAll();

        return view('books/index', $data);
    }

    public function detail($slug)
    {
        // $detail = $this->booksModel->where(['slug' => $slug])->first();
        $detail = $this->booksModel->getBooks($slug);

        $data = [
            'title' => 'Detail | Wahyu Widiantoro',
            'books' => $detail
        ];

        if (empty($data['books'])) {
            throw new \CodeIgniter\Exceptions\PageNotFoundException('Judul Buku ' . $slug . ' tidak ditemukan');
        }

        return view('books/detail', $data);
        // echo $slug;
    }

    public function create()
    {
        // session();
        $data = [
            'title' => 'Tambah Buku | Wahyu Widiantoro',
            'validation' => validation_errors()
        ];
        return view('/books/create', $data);
    }

    public function save()
    {
        if (!$this->validate([
            'judul' => [
                'rules' => 'required|is_unique[books.judul]',
                'errors' => [
                    'required' => '{field} buku harus diisi. ',
                    'is_unique' => '{field} buku sudah terdaftar. '
                ]
            ],
            'penulis' => [
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} buku harus diisi. '
                ]
            ],
            'sampul' => [
                'rules' => 'max_size[sampul,1024]|is_image[sampul]|mime_in[sampul,image/png,image/jpeg,image/jpg]',
                'errors' => [
                    'max_size' => 'Ukuran gambar terlalu besar',
                    'is_image' => 'Yang anda pilih bukan gambar',
                    'mime_in' => 'Yang anda pilih bukan gambar mime'
                ]
            ]
        ])) {
            return redirect()->to(base_url() . '/books/create')->withInput();
        }

        $fileSampul = $this->request->getFile('sampul');

        if ($fileSampul->getError() == 4) {
            $namaSampul = 'default.png';
        } else {
            $namaSampul = $fileSampul->getRandomName();
            //pindahkan file sampul
            $fileSampul->move('img', $namaSampul);
        }


        //ambil nama sampul
        // $namaSampul = $fileSampul->getName();

        // dd($this->request->getPost());
        $slug = url_title($this->request->getVar('judul'), '-', true);
        $this->booksModel->save([
            'judul' => $this->request->getVar('judul'),
            'slug' => $slug,
            'penulis' => $this->request->getVar('penulis'),
            'penerbit' => $this->request->getVar('penerbit'),
            'sampul' => $namaSampul
        ]);

        session()->setFlashdata('pesan', 'Data Buku berhasil ditambahkan');

        return redirect()->to('/books');
    }

    public function delete($id)
    {
        $books = $this->booksModel->find($id);

        if ($books['sampul'] != 'default.png') {
            unlink('img/' . $books['sampul']);
        }

        $this->booksModel->delete($id);
        session()->setFlashdata('pesan', 'Data Buku berhasil dihapus');
        return redirect()->to('/books');
    }

    public function edit($slug)
    {
        $data = [
            'title' => 'Ubah Buku | Wahyu Widiantoro',
            'validation' => validation_errors(),
            'books' => $this->booksModel->getBooks($slug)
        ];
        return view('/books/edit', $data);
    }

    public function update($id)
    {
        $booksLama = $this->booksModel->getBooks($this->request->getVar('slug'));
        if ($booksLama['judul'] == $this->request->getVar('judul')) {
            $rule_judul = 'required';
        } else {
            $rule_judul = 'required|is_unique[books.judul]';
        }
        if (!$this->validate([
            'judul' => [
                'rules' => $rule_judul,
                'errors' => [
                    'required' => '{field} buku harus diisi. ',
                    'is_unique' => '{field} buku sudah terdaftar. '
                ]
            ],
            'penulis' => [
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} buku harus diisi. '
                ]
            ],
            'sampul' => [
                'rules' => 'max_size[sampul,1024]|is_image[sampul]|mime_in[sampul,image/png,image/jpeg,image/jpg]',
                'errors' => [
                    'max_size' => 'Ukuran gambar terlalu besar',
                    'is_image' => 'Yang anda pilih bukan gambar',
                    'mime_in' => 'Yang anda pilih bukan gambar mime'
                ]
            ]
        ])) {
            return redirect()->to(base_url() . '/books/edit/' . $this->request->getVar('slug'))->withInput();
        }

        $fileSampul = $this->request->getFile('sampul');
        $sampulLama = $this->request->getVar('sampullama');

        if ($fileSampul->getError() == 4) {
            $namaSampul = $sampulLama;
        } else {
            $namaSampul = $fileSampul->getRandomName();
            //pindahkan file sampul
            $fileSampul->move('img', $namaSampul);
            //hapus file lama
            if ($sampulLama != 'default.png') {
                unlink('img/' . $sampulLama);
            }
        }

        $slug = url_title($this->request->getVar('judul'), '-', true);
        $this->booksModel->save([
            'id' => $id,
            'judul' => $this->request->getVar('judul'),
            'slug' => $slug,
            'penulis' => $this->request->getVar('penulis'),
            'penerbit' => $this->request->getVar('penerbit'),
            'sampul' => $namaSampul
        ]);

        session()->setFlashdata('pesan', 'Data Buku berhasil diubah');

        return redirect()->to('/books');
    }
}
