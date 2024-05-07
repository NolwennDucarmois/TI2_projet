<h2 id="titre">Contact et horaire d'ouverture</h2>
<button id="btn_logo" class="btn btn-outline-secondary">LOGO</button>
<span id="animation_logo">
    <img src="./admin/public/images/logo1.jpg" alt="logo de l'entreprise" id="logo">
</span>
<button id="btn1" class="btn btn-outline-secondary">Informations de l'entreprise</button>
<section id="premiere">
    <h4>Profil de l'entreprise</h4>
    <div class="alert alert-success" role="alert" style="width: 340px" id="alert_profil">
        Affiche les informations qui vous interressent
    </div>
    <div class="container">
        <div class="row">
            <div class="col-6">
                <span id="nom_ent">Nom de l'entreprise : </span>
                <span id="nom_ent_infos">Mel'Instruments</span>
            </div>
            <div class="col-6">
                <span id="ent_ent">Numéro d'entreprise : </span>
                <span id="ent_ent_infos">0123.456.789</span>
            </div>
        </div>
        <div class="row">
            <div class="col-6">
                <span id="date_ent">Date de création : </span>
                <span id="date_ent_infos">01-04-2024</span>
            </div>
            <div class="col-6">
                <span id="iban_ent">Code IBAN : </span>
                <span id="iban_ent_infos">BE78 5263 1200 3699</span>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-6">
                <span id="mail_ent"><i class="bi bi-envelope-at-fill"></i> Email : </span>
                <span id="mail_ent_infos">mel.instruments@mail.com</span>
            </div>
            <div class="col-6">
                <span id="tel_ent"><i class="bi bi-telephone-forward-fill"></i> Téléphone : </span>
                <span id="tel_ent_infos">069/85.36.12</span>
            </div>
        </div>
    </div>
</section>
<button id="btn2" class="btn btn-outline-secondary">Coordonnées</button>
<section id="deuxieme">
    <h4>Coordonnées du magasin</h4>
    <div class="container text-center">
        <div class="row align-items-start">
            <div class="col" id="mag1">
                <nav id="m1">Magasin 1</nav>
                <div class="row" id="infos_magasin1">
                    <span>Rue des Buses 5</span>
                    <span>7800 ATH</span>
                    <span>063/52.32.00</span>
                </div>
            </div>
            <div class="col" id="mag2">
                <nav id="m2">Magasin 2</nav>
                <div class="row" id="infos_magasin2">
                    <span>Rue des Palmes 66</span>
                    <span>7000 MONS</span>
                    <span>060/77.22.19</span>
                </div>
            </div>
            <div class="col" id="mag3">
                <nav id="m3">Magasin 3</nav>
                <div class="row" id="infos_magasin3">
                    <span>Rue des Fermes 1</span>
                    <span>7950 CHIEVRES</span>
                    <span>068/85.66.03</span>
                </div>
            </div>
        </div>
    </div>
</section>
<button id="btn3" class="btn btn-outline-secondary">Horaire d'ouverture</button>
<section id="troisieme">
    <h4>Horaire d'ouverture</h4>
    <table id="horaire" class="table">
        <tr id="tr0">
            <th>Jour</th>
            <th>Matin</th>
            <th>Après-midi</th>
        </tr>
        <tr id="tr1">
            <td>Lundi</td>
            <td>9h00 à 12h30</td>
            <td>14h00 à 17h00</td>
        </tr>
        <tr id="tr2">
            <td>Mardi</td>
            <td>8h30 à 12h30</td>
            <td>14h00 à 17h00</td>
        </tr>
        <tr id="tr3">
            <td>Mercredi</td>
            <td>8h30 à 12h30</td>
            <td class="bold">Fermé</td>
        </tr>
        <tr id="tr4">
            <td>Jeudi</td>
            <td>8h30 à 12h30</td>
            <td>14h00 à 17h00</td>
        </tr>
        <tr id="tr5">
            <td>Vendredi</td>
            <td>8h30 à 12h30</td>
            <td>13h00 à 16h00</td>
        </tr>
        <tr id="tr6">
            <td>Samedi</td>
            <td>9h00 à 12h30</td>
            <td class="bold">Fermé</td>
        </tr>
        <tr id="tr7">
            <td>Dimanche</td>
            <td class="bold">Fermé</td>
            <td class="bold">Fermé</td>
        </tr>
    </table>
</section>
<button id="btn4" class="btn btn-outline-secondary">Contactez-nous</button>
<section id="quatrieme">
    <h4>Une question ?</h4>
    <form class="row g-3 needs" id="question">
        <div class="col-md-4">
            <label for="nom" class="form-label">Votre nom : </label>
            <input type="text" class="form-control" id="nom" required placeholder="Nom">
        </div>
        <div class="col-md-4">
            <label for="prenom" class="form-label">Votre prénom : </label>
            <input type="text" class="form-control" id="prenom" required placeholder="Prénom">
        </div>
        <div class="col-md-4">
            <label for="email" class="form-label">Votre adresse mail : </label>
            <input type="text" class="form-control" id="email" required placeholder="Mail">
        </div>
        <div class="col-md-4">
            <label for="message" class="form-label">Message : </label>
            <textarea name="message" id="message" cols="80" rows="3" placeholder="Message"></textarea>
        </div>
        <div class="col-12">
            <button class="btn btn-primary" type="submit" id="submit">Envoyer le message</button>
        </div>
    </form>
</section>
<br>