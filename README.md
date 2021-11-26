# Workshop alamofire ios
Lien Tuto : https://drive.google.com/file/d/1G9bMubf-s09IKjS1gzqIrqNespsDmWKV/view

C'est un workshop iOS qui explique l'utilisation de Alamofire pour la consommation des web services.

## Prérequis

- Xcode
- node.js
- MAMP
- Homebrew
- cocoapods

## Installation

Cloner le projet :
```sh
 git clone git@gitlab.com:abdelaziz.mezri/workshop_alamofire.git
```
ou
```sh
 git clone https://gitlab.com/abdelaziz.mezri/workshop_alamofire.git
```

#### _Serveur node :_

1) Installer [Node.js](https://nodejs.org/) v10+ to run.

2) Aller sous le dossier `workshop_alamofire/Server`

3) Lancez MAMP et créer la base de données "workshop_ios" qui contient la table "movie" de deux columns : 
`id` : Int | `name` : String

4) lancer la commande :
```sh
npm install
```
5) lancer le serveur :
```sh
node index.js
```

#### _Application Xcode :_

1) Installer Xcode

2) Installer Homebrew

```sh
 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

3) Installer Cocoapods

```sh
 brew install cocoapods
```

4) Aller sous le dossier `workshop_alamofire/workshopTableView`

3) Créer le Podfile

```sh
pod init
```

4) Vider le fichier et coller ce code :

```sh
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'workshopTableView' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for workshopTableView

  pod 'Alamofire', '~> 5.4'

end

```

5) lancer la commande :
```sh
pod install
```

6) Ouvrir le fichier `workshopTableView.xcworkspace` qui à l'icone blanche et non pas `workshopTableView.xcodeproj` qui a l'icone bleue


## Notes
Pour autoriser l'accès HTTP, il faut ajouter ce code à `info.plist`:

```sh
    <key>NSAppTransportSecurity</key>
    <dict>
      <!--Include to allow all connections (DANGER)-->
      <key>NSAllowsArbitraryLoads</key>
          <true/>
    </dict>
```
