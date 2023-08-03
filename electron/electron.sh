#!/bin/bash
#recuperation du nom qu'on veut affecter a notre application
start(){
    echo "🔶-----Veillez entrer le nom de votre application----🔶 "
    read nomAppli 
    #creation du repertoire
    mkdir $nomAppli
    echo "-------🔶-Name  ⇾: $nomAppli-🔶----------------" 

    #accéder au repertoire créer 
    cd $nomAppli
    echo "🔶🔶🔶--cd/$nomAppli--🔶🔶🔶"
    echo "Choisir l'extension du fichier que voulez créer : "
    echo "1 ⇾ .html"
    echo "2 ⇾ .css"
    echo "3 ⇾ .js"
    echo "0 ⇾ ༈༈༈---autre option---༈༈༈"

    echo "Veillez entrer votre choix : "
    read ch

    #creation des fichiers neccessaires pour le projets
    #condition de verification

    #Nombre de dossiers que vous voulez créer pouir le projets 
    while [ $# -gt 0 ]; do
    if [ $ch -eq 1 ]; then
        ex1="html"
        echo "Entrer le nom du fichier : "
        read fichier_html
        touch $fichier_html.$ex1
        echo "------$fichier_html.$ex1 -----✅✅✅"
    elif [ $ch -eq 2 ]; then
        ex2="css"
        echo "Entrer le nom du fichier : "
        read fichier_css
        touch $fichier_css.$ex2
        echo "------$fichier_css.$ex2 -----✅✅✅"

    elif [ $ch -eq 3 ]; then
        ex3="js"
        echo "Entrer le nom du fichier : "
        read fichier_js
        touch $fichier_js.$ex3
        echo "------$fichier_js.$ex3 -----✅✅✅"

    fi

    #Processus d'installation des packages
    echo "---Pour installer les packages necessaire pour le projet ⏩ : $nomAppli-----------"
    echo " ⇾: 17 "
    read yesNo 
    if [ $yesNo -eq 17 ]; then
        echo "------------initialisation---------"
        npm init -y
        echo "-----------installation de electron--------"
        npm i -D electron
        echo "--------------execution de builder -----------"
    else
        echo "-------failed to install-------"
    fi

    # echo "----tout est bien installer avec succès-------"
}

start


# #npm install --save-dev electron

