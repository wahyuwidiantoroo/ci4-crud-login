<?= $this->extend('layout/template'); ?>

<?= $this->section('content'); ?>
<div class="container">
    <div class="row">
        <div class="col">
            <h1>Contact Us</h1>
            <?php foreach ($alamat as $a) : ?>
                <ul>
                    <li>Jenis Alamat: <?= $a['tipe']; ?></li>
                    <li>Alamat : <?= $a['alamat']; ?></li>
                    <li>Kota : <?= $a['kota']; ?></li>
                </ul>
            <?php endforeach; ?>
        </div>
    </div>
</div>
<?= $this->endSection(); ?>