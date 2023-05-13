<?= $this->extend('layout/template'); ?>

<?= $this->section('content'); ?>
<div class="container">
    <h1>Form Tambah Buku</h1>
    <form action="/books/save" method="post" enctype="multipart/form-data">
        <?= csrf_field(); ?>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="judulbuku">Judul Buku</label>
                <input type="text" class="form-control <?php echo (isset($validation['judul'])) ? 'is-invalid' : ''; ?>" id="judulbuku" placeholder="Judul Buku" name="judul" autofocus value="<?= old('judul'); ?>">
                <div id="validationServerUsernameFeedback" class="invalid-feedback">
                    <?php if (isset($validation['judul'])) {
                        echo $validation['judul'];
                    } ?>
                </div>
            </div>
            <div class="form-group col-md-6">
                <label for="penulis">Penulis</label>
                <input type="text" class="form-control <?php echo (isset($validation['penulis'])) ? 'is-invalid' : ''; ?>" id="penulis" placeholder="Penulis" name="penulis" value="<?= old('penulis'); ?>">
                <div id=" validationServerUsernameFeedback" class="invalid-feedback">
                    <?php if (isset($validation['penulis'])) {
                        echo $validation['penulis'];
                    } ?>
                </div>
            </div>
            <div class="form-group col-md-6">
                <label for="penerbit">Penerbit</label>
                <input type="text" class="form-control" id="penerbit" placeholder="Penerbit" name="penerbit" value="<?= old('penerbit'); ?>">
            </div>
            <div class="form-group col-md-6">
                <label for="sampul" class="form-label">Sampul</label>
                <div class="col-sm-2 mb-2">
                    <img src="/img/default.png" class="img-thumbnail img-preview" alt="">
                </div>
                <input class="form-control <?php echo (isset($validation['sampul'])) ? 'is-invalid' : ''; ?>" type="file" name="sampul" id="sampul" onchange="previewImg()">
                <div id=" validationServerUsernameFeedback" class="invalid-feedback">
                    <?php if (isset($validation['sampul'])) {
                        echo $validation['sampul'];
                    } ?>
                </div>
            </div>
        </div>
        <button type="submit" class="btn btn-primary mt-2">Tambah</button>
    </form>
</div>
<?= $this->endSection(); ?>