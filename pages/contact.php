<h2 id="titre">Contact et horaire d'ouverture</h2>
<input type="button" id="logo" value="LOGO">
<br>
<img src="/admin/public/images/logo.png" alt="logo de l'entreprise" id="logo">
<section id="premiere">
    <h4>Profil de l'entreprise</h4>
    <p id="infos_entreprise">
        Nom
        Adresse
        Date de création
        Email
        Tel
        Num TVA
        Code IBAN
    </p>

</section>
<section id="deuxieme">
    <h4>Coordonnées du magasin</h4>
    <p id="magasin">
        enseigne
        adresse
        tel
    </p>
</section>
<button id="btn3">Horaire d'ouverture</button>
<section id="troisieme">
    <h4>Horaire d'ouverture</h4>
    <table id="horaire" class="table">
        <tr>
            <th>Jour</th>
            <th>Matin</th>
            <th>Après-midi</th>
        </tr>
        <tr>
            <td>Lundi</td>
            <td>9h00 à 12h30</td>
            <td>14h00 à 17h00</td>
        </tr>
        <tr>
            <td>Mardi</td>
            <td>8h30 à 12h30</td>
            <td>14h00 à 17h00</td>
        </tr>
        <tr>
            <td>Mercredi</td>
            <td>8h30 à 12h30</td>
            <td class="bold">Fermé</td>
        </tr>
        <tr>
            <td>Jeudi</td>
            <td>8h30 à 12h30</td>
            <td>14h00 à 17h00</td>
        </tr>
        <tr>
            <td>Vendredi</td>
            <td>8h30 à 12h30</td>
            <td>13h00 à 16h00</td>
        </tr>
        <tr>
            <td>Samedi</td>
            <td>9h00 à 12h30</td>
            <td class="bold">Fermé</td>
        </tr>
        <tr>
            <td>Dimanche</td>
            <td class="bold">Fermé</td>
            <td class="bold">Fermé</td>
        </tr>
    </table>
</section>
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