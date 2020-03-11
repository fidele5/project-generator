<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>project</title>
    <!-- Font Awesome -->
    <link href="public/css/fontawesome-all.css" rel="stylesheet">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="public/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="public/css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="public/css/styleplk.css" rel="stylesheet">
    <!-- Stepper CSS -->
</head>
<body>
<div class="container">
    <div class="row justify-content-center mt-3">
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
            <!-- Material form login -->
            <div class="card">
            <h5 class="card-header info-color white-text text-center py-4">
                <strong>Sign in</strong>
            </h5>
            <!--Card content-->
            <div class="card-body px-lg-5 pt-0">
                <!-- Form -->
                <form id="form" class="text-center" style="color: #757575;" method="POST" action="controller/creator.php" enctype="multipart/form-data" >
                <!-- Email -->
                <div class="md-form">
                    <input type="text" id="rootdir" name="rootdir" class="form-control">
                    <label for="rootdir">Nom du projet</label>
                </div>

                <!-- Password -->
                <div class="md-form">
                    <input type="text" id="host" name="host" class="form-control" value="localhost">
                    <label for="host">Hôte de la bdd</label>
                </div>

                <div class="md-form">
                    <input type="text" id="login" name="login" class="form-control" value="root">
                    <label for="login">Login de la bdd</label>
                </div>

                <div class="md-form">
                    <input type="text" id="database" name="database" class="form-control">
                    <label for="database">Nom de la bdd</label>
                </div>

                <div class="md-form">
                    <input type="password" id="mdp" name="mdp" class="form-control" value="">
                    <label for="mdp">Pwd de la bdd</label>
                </div>

                <div class="md-form">
                    <div class="file-field">
                        <div class="btn btn-primary btn-sm float-left">
                            <span>Fichier</span>
                            <input type="file" id="fichier" name="fichier">
                        </div>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text" placeholder="Selectionner le fichier sql">
                        </div>
                    </div>
                </div>

                <!-- Sign in button -->
                <button class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0" type="submit">Creer</button>

                </form>
                <!-- Form -->
                <div class="progress md-progress">
                    <div class="progress-bar bg-info" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </div>

            </div>
            <!-- Material form login -->
        </div>
    </div>
</div>

<script type="text/javascript" src="public/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="public/js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="public/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="public/js/mdb.min.js"></script>
<!--Resize images-->
<script src="public/js/jquery.form.js"></script>
<script>
    $(document).ready(function () {
        $("#form").submit(function (e) {
            e.preventDefault();
            if ($("#fichier").val()) {
                $(this).ajaxSubmit({
                    beforeSubmit:function(){
                        $(".progress-bar").width("0%");
                    },
                    uploadProgress:function(event, position, total, percentageComplete) {
                        $('.progress-bar').animate({
                            width: percentageComplete + '%'
                        },{
                            duration: 1000
                        });
                    },
                    success:function(data) {
                        if (data == "ok") {
                            toastr.success("Projet crée avec succes");
                            location.reload();
                        }
                        else toastr.danger("Une erreur s'est produite veuillez réessayer");
                    },
                    resetForm: true
                });
            }
            else toastr.warning('Veuillez selectionner le fichier');
        })
    });
</script>
</body>
</html>
