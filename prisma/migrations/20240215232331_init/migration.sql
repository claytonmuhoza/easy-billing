-- CreateTable
CREATE TABLE `Utilisateur` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(191) NOT NULL,
    `prenom` VARCHAR(191) NOT NULL,
    `username` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `nom_signateur_facture` VARCHAR(191) NULL,
    `activer` BOOLEAN NOT NULL DEFAULT true,
    `createAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Categorie` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `libelle` VARCHAR(191) NOT NULL,
    `activer` BOOLEAN NOT NULL DEFAULT true,
    `createAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `UniteMesure` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `libelle` VARCHAR(191) NOT NULL,
    `activer` BOOLEAN NOT NULL DEFAULT true,
    `createAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Produit` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(191) NOT NULL,
    `stock_actuel` INTEGER NOT NULL DEFAULT 0,
    `type_produit` ENUM('stockable', 'non_stockable') NOT NULL,
    `prix_unitaire_revien` DECIMAL(65, 30) NOT NULL DEFAULT 0,
    `prix_unitaire_vente` DECIMAL(65, 30) NOT NULL DEFAULT 0,
    `categorieId` INTEGER NOT NULL,
    `uniteId` INTEGER NULL,
    `activer` BOOLEAN NOT NULL DEFAULT true,
    `createAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Client` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(191) NOT NULL,
    `NIF` VARCHAR(191) NULL,
    `type_personne` ENUM('personne_physique', 'personne_morale') NOT NULL,
    `assujetti_tva` BOOLEAN NOT NULL DEFAULT false,
    `assujetti_tc` BOOLEAN NOT NULL DEFAULT false,
    `assujetti_pf` BOOLEAN NOT NULL DEFAULT false,
    `client_local` BOOLEAN NOT NULL DEFAULT true,
    `client_telephone` VARCHAR(191) NULL,
    `client_mail` VARCHAR(191) NULL,
    `client_boite_postal` VARCHAR(191) NULL,
    `secteur_activite` VARCHAR(191) NULL,
    `adresse_province` VARCHAR(191) NULL,
    `adresse_commune` VARCHAR(191) NULL,
    `adresse_quartier` VARCHAR(191) NULL,
    `adresse_avenue` VARCHAR(191) NULL,
    `nom_representant` VARCHAR(191) NULL,
    `telephone_representant` VARCHAR(191) NULL,
    `mail_representant` VARCHAR(191) NULL,
    `activer` BOOLEAN NOT NULL DEFAULT true,
    `createAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Devise` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `libelle` VARCHAR(191) NOT NULL,
    `taux_change` INTEGER NOT NULL DEFAULT 1,
    `langue` ENUM('fr', 'en') NOT NULL,
    `activer` BOOLEAN NOT NULL DEFAULT true,
    `createAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Banque` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nom_bank` VARCHAR(191) NOT NULL,
    `numero_compte` VARCHAR(191) NOT NULL,
    `activer` BOOLEAN NOT NULL DEFAULT true,
    `createAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Facture` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `devise_id` INTEGER NOT NULL,
    `taux_change` INTEGER NOT NULL DEFAULT 1,
    `client_id` INTEGER NOT NULL,
    `numeroFacture` INTEGER NULL,
    `mode_paiement_id` INTEGER NOT NULL,
    `ModePaiement` ENUM('espece', 'bank') NOT NULL DEFAULT 'espece',
    `banque_id` INTEGER NULL,
    `date_paiement` DATETIME(3) NULL,
    `type_facture` ENUM('facture_normale', 'facture_avoir', 'rembourcement_credit') NOT NULL DEFAULT 'facture_normale',
    `facture_ref_id` INTEGER NULL,
    `facture_motif` VARCHAR(191) NULL,
    `facture_signature_electronique` VARCHAR(191) NULL,
    `nom_prenom_signateur` VARCHAR(191) NULL,
    `date_validation_obr` DATETIME(3) NULL,
    `etat_fini` BOOLEAN NOT NULL DEFAULT false,
    `status_obr` BOOLEAN NOT NULL DEFAULT false,
    `activer` BOOLEAN NOT NULL DEFAULT true,
    `createAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DetailFacture` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `produit_id` INTEGER NOT NULL,
    `prix_unitaire_vente` DECIMAL(65, 30) NOT NULL,
    `createAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MouvementStock` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `mouv_id_system` VARCHAR(191) NOT NULL,
    `type_mouvement` ENUM('entree', 'sortie') NOT NULL,
    `produit_id` INTEGER NOT NULL,
    `quantite` INTEGER NOT NULL,
    `unite_mesure` VARCHAR(191) NOT NULL,
    `prix_vente_htva` DECIMAL(65, 30) NOT NULL,
    `motif` VARCHAR(191) NULL,
    `envoyer_obr` BOOLEAN NOT NULL DEFAULT false,
    `activer` BOOLEAN NOT NULL DEFAULT true,
    `createAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `LogOBR` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `methode` VARCHAR(191) NOT NULL,
    `lien` VARCHAR(191) NULL,
    `code_reponse` INTEGER NOT NULL,
    `message_reponse` VARCHAR(191) NOT NULL,
    `date_envoi` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Produit` ADD CONSTRAINT `Produit_categorieId_fkey` FOREIGN KEY (`categorieId`) REFERENCES `Categorie`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Produit` ADD CONSTRAINT `Produit_uniteId_fkey` FOREIGN KEY (`uniteId`) REFERENCES `UniteMesure`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Facture` ADD CONSTRAINT `Facture_devise_id_fkey` FOREIGN KEY (`devise_id`) REFERENCES `Devise`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Facture` ADD CONSTRAINT `Facture_client_id_fkey` FOREIGN KEY (`client_id`) REFERENCES `Client`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Facture` ADD CONSTRAINT `Facture_banque_id_fkey` FOREIGN KEY (`banque_id`) REFERENCES `Banque`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Facture` ADD CONSTRAINT `Facture_facture_ref_id_fkey` FOREIGN KEY (`facture_ref_id`) REFERENCES `Facture`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DetailFacture` ADD CONSTRAINT `DetailFacture_produit_id_fkey` FOREIGN KEY (`produit_id`) REFERENCES `Produit`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MouvementStock` ADD CONSTRAINT `MouvementStock_produit_id_fkey` FOREIGN KEY (`produit_id`) REFERENCES `Produit`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
