<?php
class Creator
{
    public $nom, $host, $database, $login, $mdp, $sqlfile;

    public $DIR;

    private $root;

    public function __construct($nom, $host, $database, $login, $mdp, $sqlfile)
    {
        $this->nom = $nom;
        $this->host = $host;
        $this->database = $database;
        $this->login = $login;
        $this->mdp = $mdp;
        $this->sqlfile = $sqlfile;
        $this->DIR = $_SERVER['DOCUMENT_ROOT'];
    }

    public function connect()
    {
        try {
            $connexion = new PDO("mysql:host=" . $this->host . ";dbname=information_schema", $this->login, $this->mdp);
            $connexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $connexion;
        } catch (PDOException $e) {
            die("Erreur : " . $e->getTraceAsString());
        }
    }

    public function getnewbdd()
    {
        try
        {
            $connexion = new PDO("mysql:host=$this->host;dbname=$this->database", $this->login, $this->mdp);
            $connexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $connexion;
        } catch (Exception $e) {
            die('Erreur : ' . $e->getMessage());
        }
    }

    public function CreateDatabase()
    {
        $pdo = new PDO('mysql:host=' . $this->host, $this->login, $this->mdp);
        $requete = "CREATE DATABASE IF NOT EXISTS `" . $this->database . "` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci";
        $pdo->prepare($requete)->execute();
    }

    public function get_table()
    {
        $connexion = $this->connect();
        $query = "SELECT TABLE_NAME, TABLE_ROWS, DATA_LENGTH, INDEX_LENGTH
                        FROM information_schema.TABLES
                        WHERE table_schema = :schema
                        ORDER BY DATA_LENGTH DESC";

        $select = $connexion->prepare($query);
        $select->bindValue(":schema", $this->database);
        $select->execute();
        $datas = $select->fetchAll(PDO::FETCH_ASSOC);
        return $datas;
    }

    public function get_datas($table)
    {
        $connexion = $this->connect();
        $requete = "SELECT *
                        FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = :tabl AND table_schema = :schema";
        $requet = $connexion->prepare($requete);
        $requet->bindValue(':tabl', $table);
        $requet->bindValue(':schema', $this->database);
        $requet->execute();
        $donnees = $requet->fetchAll(PDO::FETCH_ASSOC);
        return $donnees;
    }

    public function isReferenced($schema){
        $connexion = $this->connect();
        $req = "SELECT
                TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME, REFERENCED_TABLE_NAME,REFERENCED_COLUMN_NAME
                FROM
                INFORMATION_SCHEMA.KEY_COLUMN_USAGE
                WHERE
                REFERENCED_TABLE_SCHEMA = :schema ";
        $requete = $connexion->prepare($req);
        $requete->bindValue(':schema', $schema);
        $requete->execute();
        $isforeign = $requete->fetchAll(PDO::FETCH_ASSOC);
        return $isforeign;
    }

    public function setDatas($table)
    {
        $connexion = $this->connect();
        $requete = "SELECT COLUMN_NAME
                    FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = :tabl AND table_schema = :schema";
        $requet = $connexion->prepare($requete);
        $requet->bindValue(':tabl', $table);
        $requet->bindValue(':schema', $this->database);
        $requet->execute();
        $string = "";
        $donnees = $requet->fetchAll(PDO::FETCH_ASSOC);
        for ($i = 0; $i < count($donnees); $i++) {
            $string .= "
        public $" . $donnees[$i]['COLUMN_NAME'] . ";";
        }
        $string .= "
        public function __construct()
        {

        }";
        return $string;
    }

    public function generateProject()
    {
        if (!is_dir($this->DIR . "/" . $this->nom)) {
            mkdir($this->DIR . "/" . $this->nom);
            $this->root = $this->DIR . "/" . $this->nom . "/";
        } else {
            return false;
        }
    }

    public function DatabaseUpload()
    {
        $file = $this->sqlfile;
        foreach ($_FILES as $file) {
            $extensions_valides = array('jpg', 'jpeg', 'gif', 'png', 'sql');
            $text = substr(strrchr($file['name'], '.'), 1);
            if (in_array($text, $extensions_valides)) {
                $tmp_name = $file['tmp_name'];
                $file['name'] = explode(".", $file['name']);
                $file['name'] = $file['name'][0] . "." . $text;
                $destination = '../databases/' . $file['name'];
                move_uploaded_file($tmp_name, $destination);
                $query = file_get_contents($destination);
                $files = $this->getnewbdd()->prepare($query);
                $files->execute();
            }
            if ($file['error'] == UPLOAD_ERR_OK) {
                return $destination;
            }
        }
    }

    public function generate_tbadmin()
    {
        $connexion = $this->getnewbdd();
        $create = $connexion->prepare("CREATE TABLE IF NOT EXISTS admins (
            id int(11) NOT NULL AUTO_INCREMENT,
            login varchar(50) NOT NULL,
            mdp varchar(50) NOT NULL,
            PRIMARY KEY (`id`)
          ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1");
        $create->execute();
        $create->closeCursor();
    }

    public function generate_default_user()
    {
        $connexion = $this->getnewbdd();
        $user = $connexion->prepare("INSERT INTO admins (login, mdp) VALUES('admin', '12345')");
        $user->execute();
        $user->closeCursor();
    }

    public function generate_rooter()
    {
        $rooter = fopen($this->root . "index.php", "w");
        $rep = "
<?php
    require_once 'controllers/displayer.php';
    if (!is_connected()) {
        $" . 'page' . "  = 'login';
    } else {
        $" . 'page' . " = (isset($" . '_GET["page"]' . "))?$" . '_GET["page"]' . ":'accueil';
    }
    try{
        if(empty($" . 'page' . ")) throw new Exception('page non disponible', 1);
        else{
            switch($" . 'page' . ")
            {
                case 'login':
                    Login();
                break;";
        $datas = $this->get_table();
        for ($i = 0; $i < count($datas); $i++) {
            $rep .= "
                case '" . $datas[$i]['TABLE_NAME'] . "':
                    " . ucfirst($datas[$i]['TABLE_NAME']) . "();
                break;";
        }
        $rep .= "
                case 'logout' :
                    Logout();
                break;
                default:
                    Accueil();
                break;
            }
        }
    }
    catch(Exception $" . 'e' . "){
        die('Erreur : '.$" . 'e' . ");
    }";
        fwrite($rooter, $rep, 1000000);
        fclose($rooter);
    }

    public function uznzip_bootstrap()
    {
        $zip = new ZipArchive();
        $archive = $zip->open('public.zip');
        if ($archive) {
            $zip->extractTo($this->root);
            $zip->close();
        } else {
            return false;
        }

    }

    public function generate_htaccess()
    {
        $fp = fopen($this->root . ".htaccess", "w");
        $str = '
Options +FollowSymlinks
RewriteEngine on
RewriteRule ^([a-zA-Z]+)/([a-zA-Z]+)$ index.php?page=$1&action=$2 [L]
RewriteRule ^([a-zA-Z]+)/([a-zA-Z]+)/([0-9]+)$ index.php?page=$1&action=$2&id=$3 [L]
RewriteRule ^([a-zA-Z]+)$ index.php?page=$1 [L]';
        fwrite($fp, $str, 100000);
        fclose($fp);
    }

    public function generate_dirs()
    {
        $dirs = ['views', 'models', 'controllers'];
        for ($i = 0; $i < count($dirs); $i++) {
            if (!is_dir($this->root . $dirs[$i])) {
                mkdir($this->root . $dirs[$i]);
            } else {
                return false;
            }

        }
    }

    //Models
    public function generate_models()
    {
        $datas = $this->get_table();
        for ($i = 0; $i < count($datas); $i++) {
            $fp = fopen($this->root . "models/" . $datas[$i]['TABLE_NAME'] . ".php", "w");
            $classe = "
<?php
    require_once 'config.php';
    class " . ucfirst($datas[$i]['TABLE_NAME']) . " extends Config
    {";
            $classe .= $this->setDatas($datas[$i]['TABLE_NAME']);
            $classe .= $this->generate_insert($datas[$i]['TABLE_NAME']);
            $classe .= $this->generate_select($datas[$i]['TABLE_NAME']);
            $classe .= $this->generate_update($datas[$i]['TABLE_NAME']);
            $classe .= $this->generate_delete($datas[$i]['TABLE_NAME']);
            $classe .= $this->generate_select_by_id($datas[$i]['TABLE_NAME']);
            if ($datas[$i]['TABLE_NAME'] == "admins") {
                $classe .= $this->generateLogin();
            }
            $classe .= "
    }";
            fwrite($fp, $classe, 100000);
            fclose($fp);
        }
    }

    public function generate_params($table)
    {
        $donnees = $this->get_datas($table);
        $params = "";
        for ($i = 0; $i < count($donnees); $i++) {
            if ($donnees[$i]['COLUMN_KEY'] == "PRI" && $donnees[$i]['EXTRA'] == "auto_increment") {
                continue;
            } else {
                $params .= "$" . $donnees[$i]['COLUMN_NAME'] . ", ";
            }
        }
        return $params = rtrim($params, ", ");
    }

    public function generate_bindValues($table)
    {
        $donnees = $this->get_datas($table);
        $params = "";
        for ($i = 0; $i < count($donnees); $i++) {
            if ($donnees[$i]['COLUMN_KEY'] == "PRI" && $donnees[$i]['EXTRA'] == "auto_increment") {
                continue;
            } else {
                $params .= '
                $requete -> bindValue(":' . $donnees[$i]['COLUMN_NAME'] . '", $' . $donnees[$i]['COLUMN_NAME'] . ');';
            }
        }
        return $params;

    }

    public function generateLogin()
    {
        $str = '
            public function Login($mdp)
            {
                $connexion = $this->GetConnexion();
                $query = "SELECT id, login FROM admins WHERE mdp = :mdp";
                $requete = $connexion->prepare($query);
                $requete->bindValue(":mdp", $mdp);
                $requete->execute();
                $data = $requete->fetchAll(PDO::FETCH_ASSOC);
                $requete->closeCursor();
                return $data;
            }';
        return $str;
    }

    public function generate_insert($table)
    {
        $donnees = $this->get_datas($table);
        $query = "INSERT INTO " . $table . "(";
        $values = "(";
        for ($i = 0; $i < count($donnees); $i++) {
            if ($donnees[$i]['COLUMN_KEY'] == "PRI" && $donnees[$i]['EXTRA'] == "auto_increment") {
                continue;
            } else {
                $query .= $donnees[$i]['COLUMN_NAME'] . ", ";
                $values .= ":" . $donnees[$i]['COLUMN_NAME'] . ", ";
            }

        }
        $query = rtrim($query, ", ") . ") VALUES";
        $values = rtrim($values, ", ") . ")";
        $query .= $values;

        $string = "
            public function insert(" . $this->generate_params($table) . ")
            {
                $" . 'connexion' . "= $" . 'this' . "->GetConnexion();
                $" . 'query' . "='" . $query . "';
                $" . 'requete' . " = $" . 'connexion' . "->prepare($" . 'query' . ");
                " . $this->generate_bindValues($table) . "
                $" . 'requete' . "->execute();
                $" . 'requete' . "->closeCursor();
            }
            ";
        return $string;
    }

    public function generate_select($table)
    {
        $string = "
            public function select()
            {
                $" . 'connexion' . "= $" . 'this' . "->GetConnexion();
                $" . 'query' . "='SELECT * FROM " . $table . "';
                $" . 'requete' . " = $" . 'connexion' . "->prepare($" . 'query' . ");
                $" . 'requete' . "->execute();
                $" . 'datas' . " = $" . 'requete' . "->fetchAll();
                $" . 'requete' . "->closeCursor();
                return  $" . 'datas' . ";
            }
            ";
        return $string;

    }

    public function generate_delete($table)
    {
        $connexion = $this->connect();
        $requete = "SELECT COLUMN_NAME, COLUMN_KEY
                                            FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = :tabl AND COLUMN_KEY = 'PRI'";
        $requet = $connexion->prepare($requete);
        $requet->bindValue(':tabl', $table);
        $requet->execute();
        $key = $requet->fetch(PDO::FETCH_ASSOC);

        $string = "
            public function delete($" . 'id' . ")
            {
                $" . 'connexion' . "= $" . 'this' . "->GetConnexion();
                $" . 'query' . "='DELETE FROM " . $table . " WHERE " . $key['COLUMN_NAME'] . " = :" . $key['COLUMN_NAME'] . "';
                $" . 'requete' . " = $" . 'connexion' . "->prepare($" . 'query' . ");
                $" . 'requete' . "->bindValue(':" . $key['COLUMN_NAME'] . "', $" . 'id' . ");
                $" . 'requete' . "->execute();
                $" . 'requete' . "->closeCursor();
            }
            ";
        return $string;
    }

    public function generate_select_by_id($table)
    {
        $connexion = $this->connect();
        $requete = "SELECT COLUMN_NAME, COLUMN_KEY
                                            FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = :tabl AND COLUMN_KEY = 'PRI'";
        $requet = $connexion->prepare($requete);
        $requet->bindValue(':tabl', $table);
        $requet->execute();
        $key = $requet->fetch(PDO::FETCH_ASSOC);

        $string = "
            public function select_by_id($" . 'id' . ")
            {
                $" . 'connexion' . "= $" . 'this' . "->GetConnexion();
                $" . 'query' . "='SELECT * FROM " . $table . " WHERE " . $key['COLUMN_NAME'] . " = :" . $key['COLUMN_NAME'] . "';
                $" . 'requete' . " = $" . 'connexion' . "->prepare($" . 'query' . ");
                $" . 'requete' . "->bindValue(':" . $key['COLUMN_NAME'] . "', $" . 'id' . ");
                $" . 'requete' . "->execute();
                $" . 'datas' . "=$" . 'requete' . "->fetchAll();
                $" . 'requete' . "->closeCursor();
                return $" . 'datas' . ";
            }
            ";
        return $string;
    }

    public function generate_update($table)
    {
        $donnees = $this->get_datas($table);
        $query = "UPDATE " . $table . " SET ";
        $key = "";
        for ($i = 0; $i < count($donnees); $i++) {
            if ($donnees[$i]['COLUMN_KEY'] == "PRI") {
                $key = $donnees[$i]['COLUMN_NAME'];
            } else {
                $query .= $donnees[$i]['COLUMN_NAME'] . " =:" . $donnees[$i]['COLUMN_NAME'] . ", ";
            }

        }
        $query = rtrim($query, ", ");
        $string = "
            public function update($" . $key . "," . $this->generate_params($table) . ")
            {
                $" . 'connexion' . "= $" . 'this' . "->GetConnexion();
                $" . 'query' . "='" . $query . " WHERE " . $key . " = :" . $key . "';
                $" . 'requete' . " = $" . 'connexion' . "->prepare($" . 'query' . ");
                $" . 'requete' . "->bindValue(':" . $key . "', $" . $key . ");
                " . $this->generate_bindValues($table) . "
                $" . 'requete' . "->execute();
                $" . 'requete' . "->closeCursor();
            }
            ";
        return $string;
    }

    public function generate_config()
    {
        $fp = fopen($this->root . "models/config.php", "w");
        $str = "
<?php
    class Config
    {
        const bd_nom_serveur = '" . $this->host . "';
        const bd_login = '" . $this->login . "';
        const bd_mot_de_passe = '" . $this->mdp . "';
        const bd_nom_bd = '" . $this->database . "';

        public function __construct()
        {

        }

        private function ConnexionBdd()
        {
            try
            {
                $" . 'connexion' . " = new PDO('mysql:host=' . $" . 'this' . "::bd_nom_serveur.';dbname='.$" . 'this' . "::bd_nom_bd,  $" . 'this' . "::bd_login, $" . 'this' . "::bd_mot_de_passe);
                $" . 'connexion' . "->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                return $" . 'connexion' . ";
            } catch (Exception $" . 'e' . ") {
                die('Erreur : ' . $" . 'e' . "->getMessage());
            }
        }

        public function GetConnexion()
        {
            return $" . 'this' . "->ConnexionBdd();
        }
    }";
        fwrite($fp, $str, 100000);
        fclose($fp);
    }

    public function generateAutoload(){
        $datas = $this->get_table();
        $fp = fopen($this->root . "models/autoload.php", "w");
        $autoload = '
<?php
    function my_autoloader()
    {
    ';

        for ($i = 0; $i < count($datas); $i++) {
        $autoload .='
        include "'.$datas[$i]['TABLE_NAME'].'.php";';    
        }
        $autoload .= '
    }

    spl_autoload_register("my_autoloader");

    ';
    fwrite($fp, $autoload, 100000);
    fclose($fp);


    }

    /**
     * Controllers
     */

    public function get_primary($table)
    {
        $donnees = $this->get_datas($table);
        $key = "";

        for ($i = 0; $i < count($donnees); $i++) {
            if ($donnees[$i]['COLUMN_KEY'] == "PRI") {
                $key = $donnees[$i]['COLUMN_NAME'];
            } else {
                continue;
            }
        }
        return $key;
    }

    public function generate_controllers()
    {
        $datas = $this->get_table();

        for ($i = 0; $i < count($datas); $i++) {
            $fp = fopen($this->root . "controllers/" . $datas[$i]['TABLE_NAME'] . ".php", "w");
            $classe = "
<?php
    session_start();
    require_once '../models/" . $datas[$i]['TABLE_NAME'] . ".php';
    $" . $datas[$i]['TABLE_NAME'] . " = new " . ucfirst($datas[$i]['TABLE_NAME']) . "();
        " . $this->generate_root_action($datas[$i]['TABLE_NAME'], $this->get_primary($datas[$i]['TABLE_NAME']));
            fwrite($fp, $classe, 100000);
            fclose($fp);
        }
    }

    public function generate_root_action($table, $key)
    {
        $str =
            'if (isset($_GET["action"]))
        {
            $action = $_GET["action"];
        }
        extract($_POST);
        $i = 0;
        switch ($action) {
        ';
        if ($table == "admins") {
            $str .= '
            case "login":
                $connexion = $admins->Login($psw);
                foreach ($_POST as $value) {
                    if (empty($value)) {
                        $i++;
                    }
                    else {
                        continue;
                    }
                }

                if ($i > 0) {
                    $_SESSION["erreur_login"] = "Vous devez remplir tous les champs";
                    header("location: ../index.php");
                }
                else{
                    if (count($connexion) > 0) {
                        if ($connexion[0]["login"] == $login) {
                            $_SESSION["login"] = $login;
                            $_SESSION["id"] = $connexion[0]["id"];
                            header("location: ../index.php");
                        }
                        else {
                            $_SESSION["erreur_login"] = "Login ou mot de passe incorrect";
                            header("location: ../index.php");
                        }
                    }
                    else {
                        $_SESSION["erreur_login"] = "Login ou mot de passe incorrect";
                        header("location: ../index.php");
                    }
                }
            break;';
        }

        $str .= '
            case "ajouter":
                foreach ($_POST as $value) {
                    if (empty($value)) {
                        $i++;
                    }
                    else {
                        continue;
                    }
                }

                if ($i > 0) {
                    $_SESSION["message"] = "Vous devez remplir tous les champs";
                    header("location: ../' . $table . '/ajouter");
                }else{
                    $ajouter = $' . $table . '->insert(' . $this->generate_params($table) . ');
                    header("location: ../' . $table . '");
                }
            break;
            case "modifier":
                foreach ($_POST as $value) {
                    if (empty($value)) {
                        $i++;
                    }
                    else {
                        continue;
                    }
                }

                if ($i > 0) {
                    $_SESSION["message"] = "Vous devez remplir tous les champs";
                    header("location: ../' . $table . '/modifier");
                }else{
                    $ajouter = $' . $table . '->update($' . $key . ',' . $this->generate_params($table) . ');
                    header("location: ../' . $table . '");
                }
                break;
            case "delete":
                $id = $_GET["id"];
                $delete = $' . $table . '->delete($id);
                header("location: ../' . $table . '");
                break;
            default:
                break;
        }
        ';
        return $str;
    }

    public function generate_displayer()
    {
        $rooter = fopen($this->root . "controllers/displayer.php", "w");
        $rep = "
<?php
    session_start();
    require_once 'models/autoload.php';
    function is_connected()
    {
        if (isset(" . '$_SESSION["id"]' . ") && isset(" . '$_SESSION["login"]' . ")) {
            return true;
        } else {
            return false;
        }

    }

    function Login()
    {
        require_once 'views/login.php';
    }

    function Logout(){
        session_destroy();
        unset(" . '$_SESSION' . ");
        header('location: index.php');
    }";
        $datas = $this->get_table();
        for ($i = 0; $i < count($datas); $i++) {
            $isReferencied = $this->isReferenced($this->database);
            $rep .= "

    function " . ucfirst($datas[$i]['TABLE_NAME']) . "(){";
        if (count($isReferencied) > 0) {
           for ($j=0; $j < count($isReferencied); $j++) { 
               if ($datas[$i]['TABLE_NAME'] == $isReferencied[$j]['TABLE_NAME']) {
                    $tabl = $isReferencied[$j]['REFERENCED_TABLE_NAME'];
                    $keys = $isReferencied[$j]['REFERENCED_COLUMN_NAME'];
                    $rep .= '
        $'.$tabl . ' = new ' . ucfirst($tabl) . '();
        $datas = $' . $tabl . '->select();';
                }
            }
        }

        $rep .="
        if(isset(" . '$_GET["action"]' . "))
        {
            if(" . '$_GET["action"]' . " == 'ajouter'){
                " . '$action' . " = " . '$_GET["action"]' . ";
                require_once 'views/actions/" . $datas[$i]['TABLE_NAME'] . ".php';
            }
            elseif(" . '$_GET["action"]' . " == 'modifier'){
                " . '$' . $datas[$i]['TABLE_NAME'] . " = new " . ucfirst($datas[$i]['TABLE_NAME']) . "();
                " . '$action' . " = " . '$_GET["action"]' . ";
                " . '$id' . " = " . '$_GET["id"]' . ";
                " . '$' . "data = " . '$' . $datas[$i]['TABLE_NAME'] . "->select_by_id(" . '$id' . ");
                require_once 'views/actions/" . $datas[$i]['TABLE_NAME'] . ".php';
            }
        }
        else{
            " . '$' . $datas[$i]['TABLE_NAME'] . " = new " . ucfirst($datas[$i]['TABLE_NAME']) . "();
            " . '$' . "data = " . '$' . $datas[$i]['TABLE_NAME'] . "->select();
            require_once 'views/" . $datas[$i]['TABLE_NAME'] . ".php';
        }
    }";
        }

        $rep .= "
    function Accueil()
    {
        require_once 'views/accueil.php';
    }";
        fwrite($rooter, $rep, 1000000);
        fclose($rooter);
    }

    /**
     * Views
     */

    public function generate_views()
    {
        if (is_dir($this->root . "views/includes")) {
            return false;
        } else {
            mkdir($this->root . "views/includes");
            $fp = fopen($this->root . "views/includes/template.php", "w");
            $str = "
<?php
    require_once 'header.php';
    require_once 'sidenav.php';
    require_once 'nav.php';
    echo '<main>';
    echo $" . 'content' . ";
    echo '</main>';
    require_once 'footer.php';";
            fwrite($fp, $str, 100000);
            fclose($fp);
        }
    }

    public function generate_views_files()
    {
        $datas = $this->get_table();
        for ($i = 0; $i < count($datas); $i++) {
            $fp = fopen($this->root . "views/" . $datas[$i]['TABLE_NAME'] . ".php", "w");
            $view = "
<?php
    ob_start();
?>
<div class='container'>
    <h3>" . $datas[$i]['TABLE_NAME'] . "</h3>
    " . $this->generate_tables($datas[$i]['TABLE_NAME']) . "
</div>
<?php
    $" . 'content' . " = ob_get_clean();
    require_once 'includes/template.php';";
            fwrite($fp, $view, 100000);
            fclose($fp);
        }
    }

    public function generate_accueil()
    {
        $fp = fopen($this->root . "views/accueil.php", "w");
        $view = "
<?php
    ob_start();
?>
 <div class='container-fluid mt-4'>
    <h1 class='text-center'>Hello World</h1>
    <p>Je suis content de voir tout ca fonctionnner<p>
</div>
<?php $" . 'content' . " = ob_get_clean();
    require_once 'includes/template.php';";
        fwrite($fp, $view, 100000);
        fclose($fp);
    }

    public function generate_login()
    {
        $fp = fopen($this->root . "views/login.php", "w");
        $view = '
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Authentification admin</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
    <!-- Bootstrap core CSS -->
    <link href="public/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="public/css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="public/css/style.min.css" rel="stylesheet">
</head>

<body class="grey lighten-3">
<div class="container my-5 px-0 z-depth-1">

  <!--Section: Content-->
  <section class="p-5 my-md-5 text-center"
    style="background-image: url(public/img/background3.jpg); background-size: cover; background-position: center center;">

    <form class="my-5 mx-md-5" action="controllers/admins.php" method="POST">

      <div class="row">
        <div class="col-md-6 mx-auto">
          <!-- Material form login -->
          <div class="card">

            <!--Card content-->
            <div class="card-body">

              <!-- Form -->

                <h3 class="font-weight-bold my-4 pb-2 text-center dark-grey-text">Se connecter</h3>

                <p style="color:red;">
                    <?php
                        if (isset($_SESSION["erreur_login"])) {
                            echo $_SESSION["erreur_login"];
                        }
                    ?>
                </p>
                <!-- Name -->
                <input type="text" id="defaultSubscriptionFormPassword" class="form-control mb-4" placeholder="Login" name="login"  />

                <!-- Email -->
                <input type="password" id="defaultSubscriptionFormEmail" class="form-control" placeholder="Password" name="psw"  />

                <input class="form-control" type="hidden" name="action" value="login">

                <div class="text-center">
                  <button type="submit" class="btn btn-primary">Se connecter</button>
                </div>
                <p class="font-small blue-text d-flex justify-content-end">Login par defaut : admin, mot de passe : 12345</p>
              <!-- Form -->

            </div>

          </div>
          <!-- Material form login -->
        </div>
      </div>

    </form>

  </section>
  <!--Section: Content-->


</div>
 <!-- JQuery -->
    <script type="text/javascript" src="public/js/jquery-3.4.1.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="public/js/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="public/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="public/js/mdb.min.js"></script>
    <!-- Initializations -->
    <script type="text/javascript">
        // Animations initialization
        new WOW().init();
    </script>
</body>
</html>';
        fwrite($fp, $view, 100000);
        fclose($fp);

    }

    public function generate_tables($table)
    {
        $donnees = $this->get_datas($table);
        $form = "
    <div class='text-center'>
      <a href='" . $table . "/ajouter' class='btn btn-info btn-rounded btn-sm'>Nouveau<i
          class='fas fa-plus-square ml-1'></i></a>
    </div>
    <table id='dt-less-columns' class='table table-striped table-bordered' cellspacing='0' width='100%'>
        <thead>
            <tr>";
        for ($i = 0; $i < count($donnees); $i++) {
            if ($donnees[$i]['COLUMN_KEY'] == "PRI" && $donnees[$i]['EXTRA'] == "auto_increment") {
                continue;
            } else {
                $form .= '
                <th class="th-sm">' . $donnees[$i]['COLUMN_NAME'] . '</th>';
            }
        }

        $form .= '
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <?php
                for($i = 0; $i < count($data); $i++){
            ?>
                <tr>';
        $id = "";
        for ($i = 0; $i < count($donnees); $i++) {
            if ($donnees[$i]['COLUMN_KEY'] == "PRI" && $donnees[$i]['EXTRA'] == "auto_increment") {
                $id = $donnees[$i]['COLUMN_NAME'];
            } else {
                $form .= '
                    <td><?=$data[$i]["' . $donnees[$i]['COLUMN_NAME'] . '"]?></td>';
            }
        }
        $form .= '        <td>
                        <a href="' . $table . '/modifier/<?=$data[$i]["' . $id . '"]?>" class="btn btn-outline-success btn-sm m-0 waves-effect"><i class="fas fa-edit" aria-hidden="true"></i></a>
                        <a href="controllers/' . $table . '.php?action=delete&id=<?=$data[$i]["' . $id . '"]?>" class="btn btn-outline-danger btn-sm m-0 waves-effect"><i class="fa fa-trash" aria-hidden="true"></i></a>
                    </td>
                </tr>
            <?php
                }
            ?>
        </tbody>
        <tfoot>
            <tr>
        ';
        for ($i = 0; $i < count($donnees); $i++) {
            if ($donnees[$i]['COLUMN_KEY'] == "PRI" && $donnees[$i]['EXTRA'] == "auto_increment") {
                continue;
            } else {
                $form .= '
                <th>' . $donnees[$i]['COLUMN_NAME'] . '</th>';
            }
        }

        $form .= '
            <th>Actions</th>
            </tr>
        </tfoot>
  </table>';
        return $form;
    }

    public function generate_forms($table)
    {
        $donnees = $this->get_datas($table);
        $form = "
<?php

    " . '$' . "id = (isset(" . '$_GET[' . "'id']))?" . '$_GET[' . "'id']:'';
    " . '$' . "action = " . '$_GET[' . "'action'];
    ob_start();
?>
    <h2 class='text-center'><?=" . '$' . "action?> un(e) " . $table . "</h2>
    <div class='row justify-content-center'>
        <div class='col-xs-12 col-sm-12 col-md-6 col-lg-6'>
        <?php
            if (isset(" . '$_SESSION["message"]' . ")) {
        ?>
            <div class='alert alert-warning' role='alert'>
                <?=" . '$_SESSION["message"]' . "?>
            </div>
        <?php
            }
        ?>
            <form class='text-center' method='POST' action='../controllers/" . $table . ".php'>
            ";
        for ($i = 0; $i < count($donnees); $i++) {
            if ($donnees[$i]['COLUMN_KEY'] == "PRI" && $donnees[$i]['EXTRA'] == "auto_increment") {
                continue;
            } else {
                if ($donnees[$i]['DATA_TYPE'] == "varchar") {
                    $type = "text";
                } elseif ($donnees[$i]['DATA_TYPE'] == "bigint") {
                    $type = "number";
                } elseif ($donnees[$i]['DATA_TYPE'] == "int") {
                    $type = "number";
                } elseif ($donnees[$i]['DATA_TYPE'] == "date") {
                    $type = "date";
                } else {
                    $type = 'text';
                }

                if ($donnees[$i]['IS_NULLABLE'] == 'NO') {
                    $state = 'required';
                } else {
                    $state = '';
                }

                if ($donnees[$i]['DATA_TYPE'] == 'text') {
                    $form .= '
                <div class="md-form">
                    <textarea type="text" id="' . $donnees[$i]['COLUMN_NAME'] . '" class="md-textarea form-control" name="' . $donnees[$i]['COLUMN_NAME'] . '" ' . $state . ' rows="3" placeholder="Ecrivez quelque chose ici"></textarea>
                    <label for="' . $donnees[$i]['COLUMN_NAME'] . '">' . $donnees[$i]['COLUMN_NAME'] . '</label>
                </div>';
                } else {
                    $iserf = $this->isReferenced($this->database);
                    if (count($iserf) > 0) {
                        for ($j=0; $j < count($iserf); $j++) { 
                            if ($table== $iserf[$j]['TABLE_NAME']) {
                                if ($iserf[$j]['COLUMN_NAME'] == $donnees[$i]['COLUMN_NAME']) {   
                        $form.=
                        '
                <select class="mdb-select md-form colorful-select dropdown-primary" searchable="Search here..">
                    <?php for ($i=0; $i < count($datas); $i++) { 
                        $id = $datas[$i][$keys];
                        $val = $datas[$i][1];
                    ?>
                    <option value="<?=$id?>"><?=$val?></option>
                    <?php
                        }
                    ?>
                </select>';
                            }

                        }
                    }
                }
                if (!in_array($donnees[$i]['COLUMN_NAME'], $iserf)) {
                    $form .= '
                <div class="md-form">
                    <input type="' . $type . '" id="' . $donnees[$i]['COLUMN_NAME'] . '" class="form-control" name="' . $donnees[$i]['COLUMN_NAME'] . '" ' . $state . '>
                    <label for="' . $donnees[$i]['COLUMN_NAME'] . '">' . $donnees[$i]['COLUMN_NAME'] . '</label>
                </div>
                            ';
                }
                    
            }

            }
        }

        $form .= '
                <input type="hidden" id="action" name="action" value="<?=$action?>">
                <button class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0" type="submit">Valider</button>
            </form>
        </div>
    </div>
    <?php
        $form = ob_get_clean();
    ?>
    <?php
        ob_start();
    ?>
        <h2 class="text-center"><?=$action?> un(e) ' . $table . '</h2>
        <div class="row justify-content-center">
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
            <?php
                if (isset($_SESSION["message"])) {
            ?>
                <div class="alert alert-warning" role="alert">
                    <?=$_SESSION["message"]?>
                </div>
            <?php
                }
            ?>
                <form class="text-center" method="POST" action="http://<?=$_SERVER["HTTP_HOST"]?>/' . $this->nom . '/controllers/' . $table . '.php">
            ';
        $key = "";
        for ($i = 0; $i < count($donnees); $i++) {
            if ($donnees[$i]['COLUMN_KEY'] == "PRI" && $donnees[$i]['EXTRA'] == "auto_increment") {
                $key = $donnees[$i]['COLUMN_NAME'];
            } else {
                if ($donnees[$i]['DATA_TYPE'] == "varchar") {
                    $type = "text";
                } elseif ($donnees[$i]['DATA_TYPE'] == "bigint") {
                    $type = "number";
                } elseif ($donnees[$i]['DATA_TYPE'] == "int") {
                    $type = "number";
                } elseif ($donnees[$i]['DATA_TYPE'] == "date") {
                    $type = "date";
                } else {
                    $type = 'text';
                }

                if ($donnees[$i]['IS_NULLABLE'] == 'NO') {
                    $state = 'required';
                } else {
                    $state = '';
                }

                if ($donnees[$i]['DATA_TYPE'] == 'text') {
                    $form .= '
            <div class="md-form">
                <textarea type="text" id="' . $donnees[$i]['COLUMN_NAME'] . '" class="md-textarea form-control" name="' . $donnees[$i]['COLUMN_NAME'] . '" ' . $state . ' rows="3" placeholder="Ecrivez quelque chose ici"><?=$data[0]["' . $donnees[$i]['COLUMN_NAME'] . '"]?></textarea>
                <label for="' . $donnees[$i]['COLUMN_NAME'] . '">' . $donnees[$i]['COLUMN_NAME'] . '</label>
            </div>';
                } else {
                    $iserf = $this->isReferenced($this->database);
                    if (count($iserf) > 0) {
                        for ($j=0; $j < count($iserf); $j++) { 
                            if ($table== $iserf[$j]['TABLE_NAME']) {
                                if ($iserf[$j]['COLUMN_NAME'] == $donnees[$i]['COLUMN_NAME']) {   
                        $form.=
                        '
            <select class="mdb-select md-form colorful-select dropdown-primary" searchable="Search here..">
                <?php for ($i=0; $i < count($datas); $i++) { 
                    $id = $datas[$i][$keys];
                    $val = $datas[$i][1];
                ?>
                <option value="<?=$id?>"><?=$val?></option>
                <?php
                    }
                ?>
            </select>';
                            }

                        }
                    }
                }
                if (!in_array($donnees[$i]['COLUMN_NAME'], $iserf)) {
                    $form .= '
                <div class="md-form">
                    <input type="' . $type . '" id="' . $donnees[$i]['COLUMN_NAME'] . '" class="form-control" name="' . $donnees[$i]['COLUMN_NAME'] . '" value="<?=$data[0]["' . $donnees[$i]['COLUMN_NAME'] . '"]?>" ' . $state . '>
                    <label for="' . $donnees[$i]['COLUMN_NAME'] . '">' . $donnees[$i]['COLUMN_NAME'] . '</label>
                </div>
                            ';
                }
            }
        }
    }

        $form .= '  <input type="hidden" name="action" value="<?=$action?>">
                    <input type="hidden" name="' . $key . '" value="<?=$id?>">
                    <button class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0" type="submit">Valider</button>
                </form>
            </div>
        </div>
    <?php
        $form1 = ob_get_clean();
        switch ($action) {
            case "ajouter":
                echo $form;
                break;
            case "modifier":
                echo $form1;
                break;
            default:
                # code...
                break;
        }
    ?>
';
        return $form;

    }

    public function generate_actions_dir()
    {
        if (is_dir($this->root . "views/actions")) {
            return false;
        } else {
            mkdir($this->root . "views/actions");
            $datas = $this->get_table();
            for ($i = 0; $i < count($datas); $i++) {
                $fp = fopen($this->root . "views/actions/" . $datas[$i]['TABLE_NAME'] . ".php", "w");
                $view = "
<?php
    session_start();
    ob_start();
?>
<div class='container'>
    " . $this->generate_forms($datas[$i]['TABLE_NAME']) . "
</div>
<?php
    $" . 'content' . " = ob_get_clean();
    require_once 'views/includes/template.php';";
                fwrite($fp, $view, 100000);
                fclose($fp);
            }

        }
    }

    public function genreate_header()
    {
        $fp = fopen($this->root . "views/includes/header.php", "w");
        $str = '
<!DOCTYPE html>
    <html lang="">
        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Title Page</title>

            <!-- Bootstrap CSS -->
            <link href="http://<?=$_SERVER["HTTP_HOST"]?>/' . $this->nom . '/public/css/fontawesome-all.css" rel="stylesheet">
            <link rel="stylesheet" href="http://<?=$_SERVER["HTTP_HOST"]?>/' . $this->nom . '/public/css/font-awesome.min.css">
            <!-- Bootstrap core CSS -->
            <link href="http://<?=$_SERVER["HTTP_HOST"]?>/' . $this->nom . '/public/css/bootstrap.min.css" rel="stylesheet">
            <!-- Material Design Bootstrap -->
            <link href="http://<?=$_SERVER["HTTP_HOST"]?>/' . $this->nom . '/public/css/mdb.min.css" rel="stylesheet">
            <![endif]-->
        </head>
        <body>
        <body class="fixed-sn light-blue-skin">
        <!--Main Navigation-->
    ';
        fwrite($fp, $str, 100000);
        fclose($fp);

    }

    public function generate_nav()
    {
        $fp = fopen($this->root . "views/includes/nav.php", "w");
        $nav = '  <!-- Navbar -->
        <nav class="navbar fixed-top navbar-toggleable-md navbar-expand-lg scrolling-navbar double-nav light-blue-skin">
            <!-- SideNav slide-out button -->
            <div class="float-left">
                <a href="#" data-activates="slide-out" class="button-collapse"><i class="fas fa-bars"></i></a>
            </div>
            <!-- Breadcrumb-->
            <div class="breadcrumb-dn mr-auto">
                <p>' . $this->nom . '</p>
            </div>
            <ul class="nav navbar-nav nav-flex-icons ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-user-circle pr-2" aria-hidden="true"></i>
                        <?=$_SESSION["login"]?>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="">Profil</a>
                        <a class="dropdown-item" href="logout"><i class="fa fa-sign-out" aria-hidden="true"></i> Deconnexion </a>
                    </div>
                </li>
            </ul>
        </nav>
        <!-- /.Navbar -->
    </header>';
        fwrite($fp, $nav, 100000);
        fclose($fp);
    }

    public function generate_footer()
    {
        $fp2 = fopen($this->root . "views/includes/footer.php", "w");
        $str2 = '
        <!-- jQuery -->
        <script type="text/javascript" src="http://<?=$_SERVER["HTTP_HOST"]?>/' . $this->nom . '/public/js/jquery-3.4.0.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="http://<?=$_SERVER["HTTP_HOST"]?>/' . $this->nom . '/public/js/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="http://<?=$_SERVER["HTTP_HOST"]?>/' . $this->nom . '/public/js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="http://<?=$_SERVER["HTTP_HOST"]?>/' . $this->nom . '/public/js/mdb.min.js"></script>
        <script type="text/javascript" src="http://<?=$_SERVER["HTTP_HOST"]?>/' . $this->nom . '/public/js/addons/datatables.min.js"></script>
        <script type="text/javascript" src="http://<?=$_SERVER["HTTP_HOST"]?>/' . $this->nom . '/public/js/addons/datatables-select.js"></script>
        <script src="http://<?=$_SERVER["HTTP_HOST"]?>/' . $this->nom . '/public/js/datable.js" type="text/javascript"></script>
        <script>
            new WOW().init();
            // SideNav Button Initialization
            $(".button-collapse").sideNav();
            // SideNav Scrollbar Initialization
            var sideNavScrollbar = document.querySelector(".custom-scrollbar");
            Ps.initialize(sideNavScrollbar);
    </script>
    <script>
        $("#dt-less-columns").mdbEditor();
        $(".dataTables_length").addClass("bs-select");
    </script>
    <script>
        // Data Picker Initialization
        $(".datepicker").pickadate();
    </script>
    <script>
        // Material Select Initialization
        $(document).ready(function() {
        $(".mdb-select").materialSelect();
        });
    </script>
    </body>
</html>';
        fwrite($fp2, $str2, 100000);
        fclose($fp2);

    }

    public function sidenav_generate()
    {
        $fp = fopen($this->root . "views/includes/sidenav.php", "w");
        $file = '
            <header>
                <!-- Sidebar navigation -->
                <div id="slide-out" class="side-nav sn-bg-4 fixed">
                    <ul class="custom-scrollbar">
                        <!-- Logo -->
                        <li>
                            <div class="logo-wrapper waves-light">
                                <a href="#"><img src="public/img/mdb-transparent.png" class="img-fluid flex-center" alt="' . $this->nom . '"></a>
                            </div>
                        </li>
                        <!--/. Logo -->
                        <!-- Side navigation links -->
                        <li>
                            <ul class="collapsible collapsible-accordion">
                                <li>
                                    <a class="collapsible-header waves-effect" href="index.php">
                                        <i class="fas fa-cogs"></i> Dashboard
                                    </a>
                                </li>
            ';
        $file .= $this->links_on_side();
        $file .= '  </ul>
                        </li>
                        <!--/. Side navigation links -->
                    </ul>
                <div class="light-blue-skin mask-strong"></div>
            </div>
        ';
        fwrite($fp, $file, 100000);
        fclose($fp);

    }

    public function generate_includes()
    {
        $this->genreate_header();
        $this->sidenav_generate();
        $this->generate_nav();
        $this->generate_footer();
    }

    public function links_on_side()
    {
        $datas = $this->get_table();
        $str = '';
        for ($i = 0; $i < count($datas); $i++) {
            $str .= '
                <li>
                    <a class="collapsible-header waves-effect" href="http://<?=$_SERVER["HTTP_HOST"]?>/' . $this->nom . '/' . $datas[$i]['TABLE_NAME'] . '">
                        <i class="fas fa-cogs"></i> ' . $datas[$i]['TABLE_NAME'] . '
                    </a>
                </li>';

        }
        return $str;
    }
}
