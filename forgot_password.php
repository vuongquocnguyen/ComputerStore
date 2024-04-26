<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>forgot password</title>
    <link rel="stylesheet" href="./public/css/rss.css" />
    <link rel="stylesheet" href="./public/css/style.css" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <style>
        .h1 {
            flex: 4;
            color: #ffff;

        }

        .sign {
            width: 500px;
            min-height: 500px;
            margin: 0 auto;
            padding-top: 80px;
            background-color: #cce6ff;
        }

        .text-status {
            font-size: 2rem;
            font-weight: 400;
            text-align: center;
            padding: 12px;
        }

        .text-status.text-error {
            color: red;
        }

        .text-status.text-success {
            color: green;
        }

        .sign form {
            max-width: 400px;
            margin: 0 auto;
            padding: 45px 20px;
        }

        .sign form label {
            display: block;
            font-size: 1.7rem;
            padding: 10px;
        }

        .sign form input {
            display: block;
            width: 100%;
            height: 34px;
            outline: none;
            border: none;
            padding-left: 10px;
            background-color: #ffff;

        }

        .sign form button {
            float: right;
            margin-top: 10px;
            padding: 10px;
            outline: none;
            border: none;
            background-color: #1a75ff;
            color: #ffff;
            font-size: 1.5rem;
        }

        .sign form a {
            display: block;
            float: right;
            padding: 10px;
            color: #1a75ff;
            font-size: 1.5rem;
        }

        .Remember {
            display: flex;
            align-items: center;
            margin-top: 12px;
        }

        .Remember span {
            display: inline-block;
            font-size: 1.2rem;
            color: #555;

        }

        .Remember input {
            display: inline-block !important;
            width: 14px !important;
            height: 24px !important;
            margin: 0 6px;
        }
    </style>
</head>

<body>
    <div class="wrapper">
        <!-- dau -->
        <div class="header header-fixed">
            <div class="header-container">
                <header class="header-top">
                    <div class="logo">
                        <a href="index.php">
                            <img src="./public/imgs/logo.png" alt="" class="img">
                        </a>
                    </div>
                    <div class="h1">
                        <h1>Quên mật khẩu</h1>
                    </div>
                </header>
            </div>
        </div>
        <div class="container">
            <div class="grid_full-width">
                <div class="sign">
                    <?php if (isset($_SESSION['error'])) { ?>
                        <h5 class="text-status text-error">
                            <?php
                            echo $_SESSION['error'];
                            unset($_SESSION['error']);
                            ?>
                        </h5>
                    <?php } ?>

                    <?php if (isset($_SESSION['success'])) { ?>
                        <h5 class="text-status text-success">
                            <?php
                            echo $_SESSION['success'];
                            unset($_SESSION['success']);
                            ?>
                        </h5>
                    <?php } ?>
                    <form action="process_forgot_password.php" method="post">
                        <label for="">Email</label>
                        <input type="email" name="email">
                        <br>
                        <button type="submit">
                            Gửi mail đổi mật khẩu
                        </button>
                    </form>

                </div>
            </div>
            
        </div>

        <?php include './partials/footer.php' ?>
    </div>
</body>

</html>