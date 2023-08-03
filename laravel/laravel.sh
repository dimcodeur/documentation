#!/bin/bash
#----------installation de php ----------------
#------mise a jour ------------
echo "------------PROCCESSUS D'INSTALLATION DE PHP ET DE TOUTES LES DEPENDANCES -----------"
echo "-------------mise a jour des packages --------"
sudo apt-get update

echo "-------------upgrade du système ----------------"
sudo apt upgrade 
sudo apt-get install php




#----------installation de composer -----------

#------mise a jour ------------
echo "-------------mise a jour --------------"
sudo apt-get update


#----------installation de npm ----------------


#------mise a jour ------------
echo "-------------mise a jour --------------"
sudo apt-get update


#----------creation du projet laravel ---------
start(){
    echo "🔶-----Veillez entrer le nom de votre application----🔶 "
    read nomAppli 

    #definition du nom de votre application 
    composer create-project --prefer-dist laravel/laravel $nomAppli
    cd $nomAppli

#----------installation et configuration de tailwindcss ------------
    npm install -D tailwindcss postcss autoprefixer
    npx tailwindcss init -p
    npm install -D @tailwindcss/forms
    

    echo "Pour une bonne installation vous devez gener l'authentification"
    echo "Célà n'est pas de tout de même obligatoire"
    echo "Que voulez vous faire ? : "
    echo "1 ⇾ Gerer l'authentification avec spatie"
    echo "2 ⇾ Continuer sans authenticafication"
    echo "Veillez entrer votre choix: "
    read ch

    if [ $ch -eq 1 ]; then
#------------Gestion d'authentication------------
    echo "----processus d'authentication------------"

    composer require laravel/breeze --dev
    php artisan breeze:install blade
    npm install

    echo "Voulez vous mettre l'applications en mode sombre :"
    echo "0 = no"
    echo "1 = yes"
    echo "choix :"

    read chx
    if [ $ch -eq 0 ]; then
        echo "Mode sombre non appliqué"
    elif [ $ch -eq 1 ]; then
        php artisan breeze:install --dark
    fi

    echo "------------installation de spatie -----------"
    composer require spatie/laravel-permission
    php artisan vendor:publish --provider="Spatie\Permission\PermissionServiceProvider"
    php artisan optimize:clear

    # echo "-------Verification de l'installation -----------"
    # echo "---Pour demarer le serveur-----"
    # echo "0 = no"
    # echo "1 = yes"
    # echo "choix :"
    # read choice_server
    # if [ $ch -eq 0 ]; then
    #     echo "Mode sombre non appliqué"
    # elif [ $ch -eq 1 ]; then
    #     php artisan breeze:install --dark
    # fi


#----------creation des migrations/models/controllers ------------
    elif [ $ch -eq 2 ]; then
        echo "__nous allons commencer par créer des migrations, model, controlleur
              __NB : nous avons deux type de controlleur : les controlleur de 
              __simple(ici vous devriez vous même créer toutes les methoes)
              __de resource(dans le controlleur de resource toutes les methods vous 
                serons crées vous n'aurez rien à faire)"
        
        
        echo "1 ⇾ Migration, controlleur, model (simple)"
        echo "2 ⇾ Migration, controlleur, model (resource)"  
        echo "Enter votre choix : "
        read cont 

        if [ $ch -eq 1 ]; then
            controlleurresource(){
                echo"Entrer le nombre de migration que vous voulez créer :"
                read nombre_mig

                for (( i=0; i<nombre_mig; i++))
                do
                    echo "Entrer le nom_du_repertoire"
                    read nomre
                    php artisan make:model $nomre -mc
                    echo "------$nomre------✅✅✅"
                done

            }
        elif [ $ch -eq 2 ]; then
            controlleurresource(){
                echo"Entrer le nombre de migration que vous voulez créer :"
                read nombre_migration

                for (( i=0; i<nombre_migration; i++))
                do
                    echo "Entrer le nom_du_repertoire"
                    read nomrep
                    php artisan make:model $nomrep -mc --resource
                    echo "------$nomrep------✅✅✅"
                done

            }
            controlleurresource
        fi
           
    fi

#---------creation des requests------------------
    echo "---------creation des requests pour gerer les permissions sur les attributes ------"

    echo "Entrer le nombre de request à créer"
    read nbre_request
    for (( i=0; i<nombre_migration; i++))
    do
        echo "Entrer le nom de la request"
        read nom_request
        exe="FromRequest"
        php artisan make:request $nomrep$exe
        echo "------$nomrep$exe------✅✅✅"
    done








#----------creation des seeders ------------------


#----------creation des factories ----------------


#-----------creation des components---------------


#----------creation des fichers de chaques models------


#----------debogage ----------------------------------
    composer require barryvdh/laravel-debugbar --dev
    composer require --dev barryvdh/laravel-ide-helper
    php artisan ide-helper:models -M


#----------Exportation des données pdf -------------
    composer require barryvdh/laravel-dompdf
    php artisan vendor:publish --provider="Barryvdh\DomPDF\ServiceProvider"


#----------Exportation des donnéés csv --------------
    composer require maatwebsite/excel
    php artisan vendor:publish --provider="Maatwebsite\Excel\ExcelServiceProvider" --tag=config


#----------Modification de la pagination ------------
    echo "Modification de la pagination veillez saisir le nombre correspondant a laravel_pagination"
    php artisan vendor:publish



}




