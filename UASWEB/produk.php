<?php 
    error_reporting(0);
    include 'db.php';
    $kontak = mysqli_query($conn, "SELECT admin_telp, admin_email, admin_address FROM tb_admin WHERE admin_id = 1");
    $a = mysqli_fetch_object($kontak);
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="style.css">
    <title>Produk</title>
    <style>
        /* Reset CSS */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Container */
        .container {
            width: 90%;
            margin: auto;
            overflow: hidden;
        }

        /* Header */
        header {
            background: #333;
            color: #fff;
            padding-top: 10px;
            min-height: 70px;
            border-bottom: #77b300 3px solid;
        }

        header a {
            color: #fff;
            text-decoration: none;
            text-transform: uppercase;
            font-size: 16px;
        }

        header ul {
            padding: 0;
            list-style: none;
            text-align: center;
        }

        header ul li {
            display: inline;
            padding: 0 20px 0 20px;
        }

        /* Search */
        .search {
            margin: 20px 0;
        }

        .search input[type="text"] {
            padding: 10px;
            width: 70%;
        }

        .search input[type="submit"] {
            padding: 10px;
            background: #333;
            color: #fff;
            border: none;
        }

        /* Section */
        .section {
            margin: 15px 0;
        }

        .section h3 {
            margin-bottom: 10px;
        }

        /* Box */
        .box {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            justify-content: center;
        }

        .box .col-4 {
            flex: 1 1 calc(50% - 10px);
            max-width: calc(50% - 10px);
            margin-bottom: 15px;
            text-align: center; /* Center content horizontally */
        }

        .box img {
            max-width: 100%;
            height: auto;
            display: block;
            margin: 0 auto; /* Center image horizontally */
        }

        /* Footer */
        .footer {
            background: #333;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            margin-top: 20px;
        }

        .footer h4, .footer p, .footer small {
            margin-bottom: 10px;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .box .col-4 {
                flex: 1 1 calc(50% - 10px);
                max-width: calc(50% - 10px);
            }
        }

        @media (max-width: 480px) {
            .container {
                width: 95%;
            }

            .box .col-4 {
                flex: 1 1 100%;
                max-width: 100%;
            }

            .search input[type="text"], .search input[type="submit"] {
                width: 100%;
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>
    <!-- header -->
    <header>
        <div class="container">
            <h1><a href="index.php">Catering Barokah</a></h1>
            <ul>
                <li><a href="produk.php">Produk</a></li>
            </ul>   
        </div>
    </header>
    
    <!-- search -->
    <div class="search">
        <div class="container">
            <form action="produk.php">
                <input type="text" name="search" placeholder="Cari Produk" value="<?php echo $_GET['search'] ?>">
                <input type="hidden" name="kat" value="<?php echo $_GET['kat'] ?>">
                <input type="submit" name="cari" value="Cari Produk">
            </form>
        </div>
    </div>

    <!-- new produk -->
    <div class="section">
        <div class="container">
            <h3>Produk</h3>
            <div class="box">
                <?php
                if($_GET['search'] != '' || $_GET['kat'] != ''){
                   $where = "AND product_name LIKE '%".$_GET['search']."%' AND category_id LIKE '%".$_GET['kat']."%'";
                }
                    $produk = mysqli_query($conn, "SELECT * FROM tb_product WHERE product_status = 1 $where ORDER BY product_id DESC");
                    if(mysqli_num_rows($produk) > 0 ){
                        while($p = mysqli_fetch_array($produk)){
                ?>
                <a href="detail-produk.php?id=<?php echo $p['product_id'] ?>">
                    <div class="col-4">
                        <img src="produk/<?php echo $p['product_image'] ?>" alt="<?php echo $p['product_name'] ?>">
                        <p class="nama"><?php echo $p['product_name'] ?></p>
                        <p class="harga">Rp. <?php echo number_format($p['product_price']) ?></p>
                    </div>
                </a>
                <?php }}else{ ?>
                    <p>Produk tidak ada</p>
                <?php }?>
            </div>
        </div>
    </div>

    <!-- footer -->
    <div class="footer">
        <div class="container">
            <h4>Alamat</h4>
            <p><?php echo $a->admin_address ?></p>

            <h4>Email</h4>
            <p><?php echo $a->admin_email ?></p>

            <h4>No. HP</h4>
            <p><?php echo $a->admin_telp ?></p>
            <small>Copyright &copy; 2022 - Catering BAROKAH</small>
        </div>
    </div>
</body>
</html>
