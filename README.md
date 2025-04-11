EC2: est un service AWS qui permet de lancer et gérer des instances de serveurs dans le cloud. (permet de deployer des app, heberger des sites)

Ici on créer une instance EC2 via Terraform mais on peut aussi le faire via la console AWS:

1. Aller sur https://aws.amazon.com/fr/console/
2. Accéder au service EC2 (Elastic Compute Cloud)
3. Aller sur instance et cliquer sur 'lancer une instance' pour creer une instance
 - Choisir l'AMI (Amazon Machine Image)
 - Choisir le type d'instance (t2.micro ou t3.micro pour une version free)
 - Creer un groupe de sécurité (pour controler le trafic réseau vers et depuis une instance) : 22 SSH(pour se connecter à l'instance EC2 et permettre à ansible de configurer et deployer dans EC2) et 80 pour HTTP(pour wordpress)
 - Ajouter la clé SSH local

