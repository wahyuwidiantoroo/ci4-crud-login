<?= $this->extend('layout/template'); ?>

<?= $this->section('content'); ?>
<div class="container mt-2">
    <h1>Detail Buku</h1>
    <div class="card mb-3" style="max-width: 540px;">
        <div class="row no-gutters">
            <div class="col-md-4">
                <img src="/img/<?= $books['sampul']; ?>" class="card-img" alt="sampul">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h5 class="card-title"><?= $books['judul']; ?></h5>
                    <p class="card-text">Penulis : <?= $books['penulis']; ?></p>
                    <p class="card-text">Penerbit : <?= $books['penerbit']; ?></p>
                    <a href="/books/edit/<?= $books['slug']; ?>" class="btn btn-warning">Edit</a>
                    <form action="/books/delete/<?= $books['id']; ?>" method="post" class="d-inline">
                        <?= csrf_field(); ?>
                        <input type="hidden" name="_method" value="DELETE">
                        <button type="submit" class="btn btn-danger" onclick="return confirm('Apakah anda yakin?');">Delete</button>
                    </form>
                    <!-- <a href="" class="btn btn-danger">Hapus</a> -->
                    <div class="mt-2">
                        <a href="/books">Kembali ke Daftar Buku</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?= $this->endSection(); ?>