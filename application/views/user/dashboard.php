 <!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">Home</h1>
                </div>
            </div>
        </div>
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <?php if ($this->session->userdata('level') == 'Admin') : ?>
                <div class="row">
                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-primary">
                            <div class="inner">
                            <h3><?= $jumlahPetugas ?></h3>
                            <p>Data Petugas</p>
                        </div>
                        <div class="icon">
                            <i class="fas fa-user-tie"></i>
                        </div>
                    </div>
                </div>
   
                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-primary">
                            <div class="inner">
                            <h3><?= $jumlahSiswa ?></h3>
                            <p>Data Siswa</p>
                        </div>
                        <div class="icon">
                            <i class="fas fa-users"></i>
                        </div>
                    </div>
                    </div>
                    
                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-primary">
                            <div class="inner">
                                <h3><?= $jumlahTransaksi ?></h3>
                                <p>Transaksi</p>
                            </div>
                            <div class="icon">
                                <i class="fas fa-money-bill"></i>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-primary" style="height: 113px;">
                            <div class="inner">
                                <h4 class="text-center" style="margin-top: 36px"><?= date('d F Y') ?></h4>
                            </div>
                            <div class="icon">
                                <i class="fas fa-calendar"></i>
                            </div>
                            
                        </div>
                    </div>
                </div>

<div class="card text-center">
    <div class="card-header bg-primary text-white">
       <h2><b>Selamat! Anda Telah Bergabung di Aplikasi SPP</b></h2>
    </div>
    <div class="card-body">
    <h1><i class="fa fa-user-tie"></i></h1>
        <h5><b class="card-text">Anda Login Sebagai Administrator</b></h5>
        <p class="card-text">Tetap Jaga Amanah dan Jangan Menyalahgunakan Jabatan</p>
    </div>
</div>
                <!-- /.row -->
                <!-- Main row -->
                <!-- <div class="row"> -->
                    <!-- Left col -->
                    <!-- <section class="col-lg-12 text-center">
                        <div class="card card-outline card-primary col-lg-8">
                            <div class="card-header">
                                <h3 class="card-title">Aktivitas Log</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                                    </button>
                                </div> -->
                                <!-- /.card-tools -->
                            <!-- </div> -->
                            <!-- /.card-header -->
                            <!-- <div class="card-body">
                                <?php if (empty($log)) : ?>
                                    <span>Tidak ada aktivitas.</span>
                                <?php else : ?>
                                    <table class="table table-bordered table-hover" cellspacing="0" width="100%" id="dataTable">
                                        <thead class="table-secondary">
                                            <tr class="text-bold">
                                                <td></td>
                                                <td>Tanggal</td>
                                                <td>Petugas</td>
                                                <td>Aksi</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php foreach ($log as $row) : ?>
                                                <tr class="text-center">
                                                    <td><i class="fas fa-fire"></i></td>
                                                    <td><?php $zone = 3600;
                                                        $date = gmdate("l, d M Y H:i", strtotime($row->log_time) + $zone);
                                                        echo "$date"; ?></td>
                                                    <td><?= $row->log_user ?></td>
                                                    <td><?= $row->log_aksi ?></td>
                                                </tr>
                                            <?php endforeach; ?>
                                        </tbody>
                                    </table>
                                <?php endif; ?>
                            </div> -->
                            <!-- /.card-body -->
                        <!-- </div> -->
                        <!-- /.card -->
                    <!-- </section> -->
                    <!-- right col -->
                <!-- </div> -->
                <!-- /.row (main row) -->
            <?php elseif ($this->session->userdata('level') == 'Petugas') : ?>
                <div class="row">

                </div>
                <!-- /.row -->
                <!-- Main row -->
                <div class="row">
                    <!-- Left col -->
                    <section class="col-lg-12 text-center">

                <!-- <div class="container"> -->

<div class="card text-center">
    <div class="card-header bg-primary text-white">
       <h2><b>Selamat! Anda Telah Bergabung di Aplikasi SPP</b></h2>
    </div>
    <div class="card-body">
    <h1><i class="fa fa-user-tie"></i></h1>
        <h5><b class="card-text"> Anda Login Sebagai Petugas</b></h5>
        <p class="card-text">Tetap Jaga Amanah dan Jangan Menyalahgunakan Jabatan</p>
    </div>
</div>

    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" />
</div>

</div>

</div>






                        <!-- /.card -->
                    </section>
                    <!-- right col -->
                </div>
                <!-- /.row (main row) -->
            <?php else : ?>
               
<div class="card text-center">
    <div class="card-header bg-primary text-white" >
        <h2><b>Selamat! Anda Telah Bergabung di Aplikasi SPP</b></h2>
    </div>
    <div class="card-body">
    <h1><i class="fa fa-users"></i></h1>
        <h5><b class="card-text">Anda Login Sebagai Siswa</b></h5>
        <p class="card-text">Tetap semangat karena masalahmu pasti akan berlalu, berlalu lalang.</p>
        <p class="card-text">Jangan lupa bayar SPP tepat waktu</p>
    </div>
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" />
</div>

            <?php endif; ?>
        </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->