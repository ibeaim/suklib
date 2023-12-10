<?php
// Koneksi ke database
$dbHost     = 'localhost'; // atau alamat IP server database
$dbUsername = 'username_database';
$dbPassword = 'password_database';
$dbName     = 'suklib';

$db = new mysqli($dbHost, $dbUsername, $dbPassword, $dbName);

// Periksa koneksi
if ($db->connect_error) {
    die("Koneksi gagal: " . $db->connect_error);
}

// Handle permintaan POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_pinjam = $_POST['id_pinjam'];
    $denda = $_POST['denda'];
    $id_pilihan_bayar = $_POST['id_pilihan_bayar'];

    $query = "INSERT INTO pengembalian (id_pinjam, tanggal_pengembalian, denda, id_pilihan_bayar) VALUES (?, NOW(), ?, ?)";
    $stmt = $db->prepare($query);
    $stmt->bind_param("iii", $id_pinjam, $denda, $id_pilihan_bayar);
    $stmt->execute();

    if ($stmt->affected_rows > 0) {
        echo "Pengembalian berhasil diproses!";
    } else {
        echo "Gagal memproses pengembalian.";
    }

    $stmt->close();
    $db->close();
}
?>
