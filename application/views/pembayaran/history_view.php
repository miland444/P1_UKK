<div class="col-lg-12">
    <?php if ($siswa != null) : ?>

        <div class="card card-default">
            <?php if (!empty($siswa)) : ?>
                <div class="card-header">
                    <h3 class="card-title text-bold">Biodata Siswa</h3>

                    <div class="card-tools">
                        <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                        </button>
                    </div>
        <!-- /.card-tools -->
        </div>
        <!-- /.card-header -->
        <div class="card-body">
                    <table class="table table-condensed table-striped">
                        <tbody>
                            <tr>
                                <td width="40%">
                                    NISN
                                </td>
                                <td width="10">
                                    :
                                </td>
                                <td>
                                    <?= $siswa->NISN ?>
                                </td>
                            </tr>
                            <tr>
                                <td width="40%">
                                    NIS
                                </td>
                                <td width="10">
                                    :
                                </td>
                                <td>
                                    <?= $siswa->NIS ?>
                                </td>
                            </tr>
                            <tr>
                                <td width="40%">
                                    Nama Lengkap
                                </td>
                                <td width="10">
                                    :
                                </td>
                                <td>
                                    <?= $siswa->NAMA ?>
                                </td>
                            </tr>
                            <tr>
                                <td width="40%">
                                    Kelas
                                </td>
                                <td width="10">
                                    :
                                </td>
                                <td>
                                    <?= $siswa->nama_kelas ?>
                                </td>
                            </tr>
                            <tr>
                                <td width="40%">
                                    Kompetensi Keahlian
                                </td>
                                <td width="10">
                                    :
                                </td>
                                <td>
                                    <?= $siswa->jurusan ?>
                                </td>
                            </tr>
                            <tr>
                                <td width="40%">
                                    Tahun Ajaran
                                </td>
                                <td width="10">
                                    :
                                </td>
                                <td>
                                    <?= $siswa->TAHUN ?>
                                </td>
                            </tr>
                            <tr>
                                <td width="40%">
                                    Petugas
                                </td>
                                <td width="10">
                                    :
                                </td>
                                <td>
                                    <?= $this->session->userdata('username'); ?>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

        <!-- /.card-body -->
        <?php else : ?>
                <div class="card-body">
                    <p>NISN tidak ditemukan.</p>
                </div>
            <?php endif; ?>
        </div>

        <div class="card card-default">
            <?php if (!empty($tagihan)) : ?>
                <div class="card-header">
                    <h3 class="card-title text-bold">Tagihan Bayar</h3>

                    <div class="card-tools">
                        <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                        </button>
                    </div>
                    <!-- /.card-tools -->
                </div>
                <!-- /.card-header -->

                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <td>No.</td>
                            <td>Pembayaran Bulan</td>
                            <td>Tanggal Bayar</td>
                            <td>Harga SPP</td>
                            <td class="text-center">Keterangan</td>
                            <td class="text-center">Aksi</td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $no = 1;
                        foreach ($tagihan as $pem) : ?>
                            <input type="hidden" value="<?= $pem->ID_PEMBAYARAN ?>">

                            <tr>
                                <td><?= $no++ ?></td>
                                <td><?= $pem->BULAN_DIBAYAR ?></td>
                                <td><?= $pem->TGL_BAYAR ?></td>
                                <td>Rp.<?= number_format($pem->NOMINAL, 0, ",", ".") ?></td>
                                <?php if ($pem->KET == null) : ?>
                                    <td class="text-center text-danger">---</td>
                                <?php else : ?>
                                    <td class="text-center text-success"><?= $pem->KET ?></td>
                                <?php endif; ?>
                                <td class="text-center">
                                    <?php if ($pem->KET == 'LUNAS') : ?>
                                        <a href="<?= site_url('pembayaran/hapus/') . $pem->ID_PEMBAYARAN; ?>" class="btn btn-danger">Hapus</a>
                                        <a href="<?= site_url('user/cetakStruk/') . $pem->ID_PEMBAYARAN; ?>" target="_blank" class="btn btn-default">Cetak</a>
                                    <?php else : ?>
                                        <a href="<?= site_url('pembayaran/transaksi/') . $pem->ID_PEMBAYARAN; ?>" class="btn btn-primary">Bayar</a>
                                    <?php endif; ?>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>

            <?php endif; ?>
        </div>

    <?php else : ?>
        <div class="card">
            <div class="card-body">
                <p>NISN tidak ditemukan</p>
            </div>
        </div>
    <?php endif; ?>
</div>


<div class="card card-default mt-0">
    <?php if (!empty($pembayaran)) : ?>
        <div class="card-header">
            <h3 class="card-title text-bold">Tagihan Bayar</h3>
            <!-- /.card-tools -->
        </div>
        <!-- /.card-header -->

        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <td>No.</td>
                    <td>Pembayaran Bulan</td>
                    <td>Tanggal Bayar</td>
                    <td>Harga SPP</td>
                    <td class="text-center">Keterangan</td>
                </tr>
            </thead>
            <tbody>
                <?php $no = 1;
                foreach ($pembayaran as $pem) : ?>
                    <input type="hidden" value="<?= $pem->ID_PEMBAYARAN ?>">

                    <tr>
                        <td><?= $no++ ?></td>
                        <td><?= $pem->BULAN_DIBAYAR ?></td>
                        <td><?= $pem->TGL_BAYAR ?></td>
                        <td>Rp.<?= number_format($pem->NOMINAL, 0, ",", ".") ?></td>
                        <?php if ($pem->KET == null) : ?>
                            <td class="text-center text-danger">---</td>
                        <?php else : ?>
                            <td class="text-center text-success"><?= $pem->KET ?></td>
                        <?php endif; ?>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>

    <?php else : ?>
        <div class="card-body">
            <p>Siswa ini belum membayar SPP sama sekali.</p>
        </div>
    <?php endif; ?>
</div>