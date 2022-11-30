<?php
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Headers: access");
    header("Access-Control-Allow-Methods: POST");
    header("Content-Type: application/json; charset=UTF-8");
    header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, XRequested-With");
    // INCLUDING DATABASE AND MAKING OBJECT
    // bdd : loginjson --- table : users ---- fields : Id, Login, Passwd
    require 'PDO.php' ;
    $pdo = new PDOdataBase('loginjson','localhost','root','root' );
    $myResponse = new stdClass();

    // test de connexion à la base de données
    if ($pdo->connect()) // si connexion réussie
    {
        // on teste si nos paramètres sont définies
        if( isset($_POST['login']) && isset($_POST['pwd'])&& isset($_POST['email'])&& isset($_POST['genre']) )
        {
            // requête préparée
            $pdo->prepare("select * from users where Login=:loginName and Passwd=:passWord");
            $pdo ->bind(':loginName', $_POST['login']);
            $pdo ->bind(':passWord' , $_POST ['pwd']);
            if($pdo->execute() )
            {
                // On test le nombre de résultats
                if($pdo->rowCount()==1) // S'il cet utilisateur existe c'est pas bien
                    $myResponse->message = "Un utilisateur est identique";
                else
                {
                    $pdo->prepare("INSERT into users(Login,Passwd,Email,Genre) values(:loginName,:passWd,:email,:genre)");
                    $pdo ->bind(':loginName', $_POST['login']);
                    $pdo ->bind(':passWd' , $_POST ['pwd']);
                    $pdo ->bind(':email' , $_POST ['email']);
                    $pdo ->bind(':genre' , $_POST ['genre']);
                    if($pdo->execute() )
                        $myResponse->message = "OK";
                    else
                        $myResponse->message = $pdo->getError() ; 
                }
            }
            else // problème de la requête SQL (execute)
                $myResponse->message = $pdo->getError() ; 
        }
        else
            $myResponse ->message = "'userName' and/or 'passWord' missing ";
    }
    else
        $myResponse->message = $pdo->getError() ; // problème de connexion

    // on retourne la réponse
    $myJsonResponse = json_encode($myResponse);
    echo $myJsonResponse ; // renvoi vers la page de login
?>