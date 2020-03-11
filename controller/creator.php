<?php
    require_once '../model/creator.php';

    extract($_POST);
    extract($_FILES);
    
    $project = new Creator($rootdir, $host, $database, $login, $mdp, $fichier);

    /**
     * Base des données
     */

    $project->CreateDatabase();
    $project->generate_tbadmin();
    $project->generate_default_user();
    $project->DatabaseUpload();
    $project->generateProject();
    $project->generate_dirs();

    /**
     * Controllers
     */

    $project->generate_controllers();
    $project->generate_displayer();
    $project->generate_accueil();

    /**
     * Models
     */

    $project->generate_models();
    $project->generate_config();
    $project->generateAutoload();

    /**
     * Views
     */

    $project->generate_views();
    $project->generate_includes();
    $project->generate_views_files();
    $project->generate_actions_dir();
    $project->generate_login();
    
    /**
     * Others
     */

    $project->uznzip_bootstrap();
    $project->generate_rooter();
    $project->generate_htaccess();

    echo "ok";