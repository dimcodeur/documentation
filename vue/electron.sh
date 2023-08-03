#!/bin/bash
#recuperation du nom qu'on veut affecter a notre application
start(){
    echo "🔶-----Veillez entrer le nom de votre application----🔶 "
    read nomAppli 
    #creation du repertoire
    mkdir $nomAppli
    echo "-------🔶-Name  ⇾: $nomAppli-🔶----------------" 


    npm create vite@latest $nomAppli -- --template vue
    cd $nomAppli


    npm install -D tailwindcss postcss autoprefixer
    npx tailwindcss init -p

    cd tailwind.config.js
    content: [
        "./index.html",
        "./src/**/*.{vue,js,ts,jsx,tsx}",
    ],

}

start




