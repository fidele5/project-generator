<?php
$zip = new ZipArchive;
$zip->open('bootstrap-4.4.1-dist.zip');
// function forcerTelechargement($nom, $situation, $poids)
// {
//     header('Content-Type: application/octet-stream');
//     header('Content-Length: ' . $poids);
//     header('Content-disposition: attachment; filename=' . $nom);
//     header('Pragma: no-cache');
//     header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
//     header('Expires: 0');
//     readfile($situation);
//     exit();
// }

// $sock = fsockopen("https://github.com/twbs/bootstrap/releases/download/", 50, $errno, $errstr, 30);
// if (!$sock) {
//     die("$errstr ($errno)\n");
// }

/*******************************************************
 *  Appel de la fonction
 *******************************************************/
//forcerTelechargement('bootstrap.zip', 'https://github.com/twbs/bootstrap/releases/download/', 10000);

// $zip->extractTo(__DIR__ . "/");

// if ($zap) {
//     while ($zip_entry = zip_read($zap)) {
//         echo "Name:               " . zip_entry_name($zip_entry) . "\n";
//         echo "Actual Filesize:    " . zip_entry_filesize($zip_entry) . "\n";
//         echo "Compressed Size:    " . zip_entry_compressedsize($zip_entry) . "\n";
//         echo "Compression Method: " . zip_entry_compressionmethod($zip_entry) . "\n";

//         if (zip_entry_open($zap, $zip_entry, "r")) {
//             echo "File Contents:\n";
//             $buf = zip_entry_read($zip_entry, zip_entry_filesize($zip_entry));
//             echo "$buf\n";

//             zip_entry_close($zip_entry);
//         }
//         echo "\n";

//     }

//     zip_close($zap);

// }
// function __autoload($class) {
//     include 'classes/' . $class . '.class.php';
// }

function my_autoloader()
{
    include 'model/creator.php';
}

spl_autoload_register('my_autoloader');

$creator= new Creator(null, null, null, null, null, null);

print_r(spl_classes());


// Ou, en utilisant une fonction anonyme à partir de PHP 5.3.0
// spl_autoload_register(function ($class) {
//     include 'classes/' . $class . '.class.php';
// });
