$(document).ready(function() {

    var itreator = 0;
    $("#defaultRegisterFormFirstName").keyup(function(e) {
        var nom = $("#defaultRegisterFormFirstName").val();
        if (nom.length < 4) {
            $(this).removeClass('mb-4 is-valid').addClass('is-invalid');
            $("#nom").removeClass('valid-feedback').addClass('invalid-feedback mb-4');
            $("#nom").text("Le nom doit avoir plus de 4 caractères");
            itreator++;

        } else {
            $(this).removeClass('mb-4 is-invalid').addClass('is-valid');
            $("#nom").removeClass('invalid-feedback').addClass('valid-feedback mb-4');
            $("#nom").text("");
        }
    });

    $("#defaultRegisterFormLastName").keyup(function(e) {
        var nom = $(this).val();
        if (nom.length < 4) {
            $(this).removeClass('mb-4 is-valid').addClass('is-invalid');
            $("#post").removeClass('valid-feedback').addClass('invalid-feedback mb-4');
            $("#post").text("Le nom doit avoir plus de 4 caractères");
            itreator++;
        } else {
            $(this).removeClass('mb-4 is-invalid').addClass('is-valid');
            $("#post").removeClass('invalid-feedback').addClass('valid-feedback mb-4');
            $("#post").text("");
        }
    });

    $("#prenom").keyup(function(e) {
        var nom = $(this).val();
        if (nom.length < 4) {
            $(this).removeClass('mb-4 is-valid').addClass('is-invalid');
            $("#pre").removeClass('valid-feedback').addClass('invalid-feedback mb-4');
            $("#pre").text("Le prenom doit avoir plus de 4 caractères");
            itreator++;
        } else {
            $(this).removeClass('mb-4 is-invalid').addClass('is-valid');
            $("#pre").removeClass('invalid-feedback').addClass('valid-feedback mb-4');
            $("#pre").text("");
        }
    });

    $("#Lieu").keyup(function(e) {
        var nom = $(this).val();
        if (nom.length < 4) {
            $(this).removeClass('mb-4 is-valid').addClass('is-invalid');
            $("#naiss").removeClass('valid-feedback').addClass('invalid-feedback mb-4');
            $("#naiss").text("Le lieu de naissance doit avoir plus de 4 caractères");
            itreator++;
        } else {
            $(this).removeClass('mb-4 is-invalid').addClass('is-valid');
            $("#naiss").removeClass('invalid-feedback').addClass('valid-feedback mb-4');
            $("#naiss").text("");
        }
    });

    $("#Date").keyup(function(e) {
        var nom = $(this).val();
        if (nom.length < 4) {
            $(this).removeClass('mb-4 is-valid').addClass('is-invalid');
            $("#dat").removeClass('valid-feedback').addClass('invalid-feedback mb-4');
            $("#dat").text("date incorrect");
            itreator++;
        } else {
            $(this).removeClass('mb-4 is-invalid').addClass('is-valid');
            $("#dat").removeClass('invalid-feedback').addClass('valid-feedback mb-4');
            $("#dat").text("");
        }
    });

    $("#ecole").keyup(function(e) {
        var nom = $(this).val();
        if (nom.length < 4) {
            $(this).removeClass('mb-4 is-valid').addClass('is-invalid');
            $("#school").removeClass('valid-feedback').addClass('invalid-feedback mb-4');
            $("#school").text("Le nom de l'ecole doit avoir plus de 4 caractères");
            itreator++;
        } else {
            $(this).removeClass('mb-4 is-invalid').addClass('is-valid');
            $("#school").removeClass('invalid-feedback').addClass('valid-feedback mb-4');
            $("#school").text("");
        }
    });

    $("#option").keyup(function(e) {
        var nom = $(this).val();
        if (nom.length < 4) {
            $(this).removeClass('mb-4 is-valid').addClass('is-invalid');
            $("#opt").removeClass('valid-feedback').addClass('invalid-feedback mb-4');
            $("#opt").text("L'option doit avoir plus de 4 caractères");
            itreator++;
        } else {
            $(this).removeClass('mb-4 is-invalid').addClass('is-valid');
            $("#opt").removeClass('invalid-feedback').addClass('valid-feedback mb-4');
            $("#opt").text("");
        }
    });

    $("#annee").keyup(function(e) {
        var nom = $(this).val();
        var date = new Date();
        var today = date.getFullYear().toString();
        if (nom.length < 4) {
            $(this).removeClass('mb-4 is-valid').addClass('is-invalid');
            $("#year").removeClass('valid-feedback').addClass('invalid-feedback mb-4');
            $("#year").text("L'année doit avoir 4 chiffres");
            itreator++;
        } else {
            if (parseInt(nom) > parseInt(today)) {
                $(this).removeClass('mb-4 is-valid').addClass('is-invalid');
                $("#year").removeClass('valid-feedback').addClass('invalid-feedback mb-4');
                $("#year").text("On ne peut pas s'inscrire à l'avance");
                itreator++;
            } else {
                $(this).removeClass('mb-4 is-invalid').addClass('is-valid');
                $("#year").removeClass('invalid-feedback').addClass('valid-feedback mb-4');
                $("#year").text("");
            }

        }
    });

    $("#pourcentage").keyup(function(e) {
        var nom = $(this).val();
        if (nom.length < 2) {
            $(this).removeClass('mb-4 is-valid').addClass('is-invalid');
            $("#percentage").removeClass('valid-feedback').addClass('invalid-feedback mb-4');
            $("#percentage").text("Le pourcentage doit avoir 2 chiffres");
            itreator++;
        } else {
            if (parseInt(nom) < 50) {
                $(this).removeClass('mb-4 is-valid').addClass('is-invalid');
                $("#percentage").removeClass('valid-feedback').addClass('invalid-feedback mb-4');
                $("#percentage").text("Desolé mais vous n'etes pas admissible");
            } else if (parseInt(nom) > 100) {
                $(this).removeClass('mb-4 is-valid').addClass('is-invalid');
                $("#percentage").removeClass('valid-feedback').addClass('invalid-feedback mb-4');
                $("#percentage").text("On ne peut pas avoir plus que le max");
            } else {
                $(this).removeClass('mb-4 is-invalid').addClass('is-valid');
                $("#percentage").removeClass('invalid-feedback').addClass('valid-feedback mb-4');
                $("#percentage").text("");
            }

        }
    });


    $("#defaultRegisterFormEmail").keyup(function(e) {
        var nom = $(this).val();
        if (nom.length < 4) {
            $(this).removeClass('mb-4 is-valid').addClass('is-invalid');
            $("#email").removeClass('valid-feedback').addClass('invalid-feedback mb-4');
            $("#email").text("L'adresse email  doit avoir plus de 4 caractères");
            itreator++;

        } else {
            if ($(this).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
                $(this).removeClass('mb-4 is-valid').addClass('is-invalid');
                $("#email").removeClass('valid-feedback').addClass('invalid-feedback mb-4');
                $("#email").text("Adresse email invalide");
                itreator++;
            } else {
                $.get('Controllers/checkemail.php?email=' + nom, function(data) {
                    if (data != "ok") {
                        $(this).removeClass('mb-4 is-valid').addClass('is-invalid');
                        $("#email").removeClass('valid-feedback').addClass('invalid-feedback mb-4');
                        $("#email").text("Adresse email deja utilisé");
                        itreator++;
                    } else {
                        $(this).removeClass('mb-4 is-invalid').addClass('is-valid');
                        $("#email").removeClass('invalid-feedback').addClass('valid-feedback mb-4');
                        $("#email").text("");
                    }
                });
            }

        }
    });

    $("#defaultRegisterPhone").keyup(function(e) {
        var nom = $("#defaultRegisterPhone").val();
        if (nom.length < 10) {
            $(this).removeClass('mb-4 is-valid').addClass('is-invalid');
            $("#tel").removeClass('valid-feedback').addClass('invalid-feedback mb-4');
            $("#tel").text("Numero invalide");
            itreator++;
        } else {
            $(this).removeClass('mb-4 is-invalid').addClass('is-valid');
            $("#tel").removeClass('invalid-feedback').addClass('valid-feedback mb-4');
            $("#tel").text("");
        }
    });
    $("#nationalite").keyup(function(e) {
        var nom = $("#nationalite").val();
        if (nom.length < 4) {
            $(this).removeClass('mb-4 is-valid').addClass('is-invalid');
            $("#nat").removeClass('valid-feedback').addClass('invalid-feedback mb-4');
            $("#nat").text("La nationalite doit avoir plus de 4 caractères");
            itreator++;
        } else {
            $(this).removeClass('mb-4 is-invalid').addClass('is-valid');
            $("#nat").removeClass('invalid-feedback').addClass('valid-feedback mb-4');
            $("#nat").text("");
        }
    });
    $("#adresse").keyup(function(e) {
        var nom = $("#adresse").val();
        if (nom.length < 4) {
            $(this).removeClass('mb-4 is-valid').addClass('is-invalid');
            $("#addr").removeClass('valid-feedback').addClass('invalid-feedback mb-4');
            $("#addr").text("L'adresse doit avoir plus de 4 caractères");
            itreator++;
        } else {
            $(this).removeClass('mb-4 is-invalid').addClass('is-valid');
            $("#addr").removeClass('invalid-feedback').addClass('valid-feedback mb-4');
            $("#addr").text("");
        }
    });

});