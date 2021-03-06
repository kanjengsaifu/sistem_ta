<div class="content-wrapper">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h4 class="page-head-line">Pengujian Judul Mahasiswa</h4>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-12">

                <!-- Session Flash Data Pesan Error -->
                <?php if($this->session->flashdata('success')): ?>
                <div class="alert alert-success">
                    <button class="close" data-dismiss="alert">x</button>
                    <strong>Berhasil,</strong> <?=$this->session->flashdata('success');?>
                </div>
                <?php elseif($this->session->flashdata('warning')): ?>
                <div class="alert alert-danger">
                    <button class="close" data-dismiss="alert">x</button>
                    <strong>Gagal,</strong> <?=$this->session->flashdata('warning');?>
                </div>
                <?php endif; ?>
                <!-- End Session Data Pesan Error -->

                <div class="panel panel-default">
                    <div class="panel-heading">
                        Data Judul Mahasiswa yang akan di Uji
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>NIM</th>
                                        <th>Mahasiswa</th>
                                        <th>Judul</th>
                                        <th>Metode</th>
                                        <th>Ringkasan Masalah</th>
                                        <th>Deskripsi</th>
                                        <th>Pembimbing</th>
                                        <th>Jadwal Seminar</th>
                                        <th>Jadwal Sidang</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php
                                    if($result > 0){
                                        $no=1;
                                        foreach($result as $key => $val) {
                                        ?>
                                        <tr>
                                            <td><?=$no;?></td>
                                            <td><?=$val['nim'];?></td>
                                            <td><?=$val['nama_mhs'];?></td>
                                            <td><?=$val['judul'];?></td>
                                            <td><?=$val['metode'];?></td>
                                            <td><?=$val['ringkas_masalah'];?></td>
                                            <td><?=$val['deskripsi'];?></td>
                                            <td><?=$val['nama_dosen'];?></td>
                                            <td><?=$val['pengajuan_seminar'] == 3 ? $val['tanggal_seminar'] : 'Belum ada jadwal';?></td>
                                            <td><?=$val['pengajuan_sidang'] == 3 ? $val['tanggal_sidang'] : 'Belum ada jadwal';?></td>
                                        </tr>
                                        <?php
                                        $no++;
                                        }
                                    }
                                ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>