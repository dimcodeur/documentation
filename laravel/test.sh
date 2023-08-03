#!/bin/bash

echo "entrer le nombre de repertoire"
read nrep

for (( i=0; i<nrep; i++))
do
    echo "Entrer le nom_du_repertoire"
    read nomrep
    exe="cooo"
    # mkdir $nomrep$exe
    mkdir $nomrep
    cd $nomrep
    echo "Veillez crer un fichir"
    echo "choissiez l'extension du fichier"
    echo "1 ⇾ .html"
    echo "2 ⇾ .css"
    echo "3 ⇾ .js"
    echo "choix"

    read ch
    if [ $ch -eq 1 ]; then
        ex1="html"
        echo "Entrer le nom du fichier : "
        read fichier_html
        touch $fichier_html.$ex1
        echo "------$fichier_html.$ex1 -----✅✅✅"
        
        exes="Bonjour tout le monde"
        
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

done