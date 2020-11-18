<!DOCTYPE HTML>

<html lang="fr">

<head>
    <title>Maamar Miloud, Portfolio personnel</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="content-langage" content="fr">
    <meta name="description" content="Maamar Miloud, site web personnel.">
    <meta name="keywords" content="miloud, milou, miloude, mamar, maamar, mmaamar, portfolio, developpeur, front, end, back, full-stack, mmi, web, etudiant, css3, html5, site, sites">
    <link rel="icon" type="image/png" href="img/favicon.png">

    <!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

    <link rel="stylesheet" href="assets/fonts/fontAwesome/css/font-awesome.min.css">
    <link rel="stylesheet" href='assets/css/00_main.css' type="text/css">
    <link rel="stylesheet" href='assets/css/fonts.css' type="text/css">

    <script src='./js/jquery.js' type="text/javascript"></script>
    <script src='./js/main.js' type="text/javascript"></script>

    <script src='./js/portfolio.js' type="text/javascript"></script>

</head>

<body>
<script>console.log("Une refonte du site est en cours, le contenu et le d�veloppement du site actuel ne sont plus repr�sentatifs de mes comp�tences");</script>
    <div id='viewer'>
        <i class="quit fa fa-times"></i>
        <article>
            <h3></h3>
            <figure>
                <img src='' alt="" />
                <figcaption></figcaption>
            </figure>
            <p id='desc'>Test Text</p>
            <p id='tags'>blablalbalba</p>
            <a href='' target="_blank">Lien vers la création</a>
        </article>
        <i class="quit fa fa-times"></i>


    </div>
    <main role="main">
        <input id="menu" type='checkbox'></input>

        <nav>

            <i><label for="menu"></label></i>
            <ul>
                <li>
                    <i></i>
                    <a href="#home">Home</a>
                </li>
                <li>
                    <i></i>
                    <a href="#aboutme">Me Me Me</a>
                </li>
                <li>
                    <i></i>
                    <a href="#skills">Compétences</a>
                </li>
                <li>
                    <i></i>
                    <a href="#works">Expériences</a>
                </li>
                <li>
                    <i></i>
                    <a href="#portfolio">Portfolio</a>
                </li>
                <li>
                    <i></i>
                    <a href="#more">More</a>
                </li>
                <li>
                    <i></i>
                    <a href="#contact">Contact</a>
                </li>
            </ul>
        </nav>
        <section id="home" class="" name='Home'>
        </section>

        <section id="aboutme" class="" name='Presentation'>
            <ul class='rtl'>
                <li>
                    <i class='poi logoPerso'></i>
                    <article>
                        <h3>Maamar Miloud, 20 ans</h3>
                        <p class='m'>Passionné du Web</p>
                        <p class='s'> Diplomé d'un DUT Métiers du Multimédia et de l'Internet.</p>
                    </article>
                </li>
                <li>
                    <i class='poi fa fa-circle'></i>
                    <article>
                        <h3>Passionné par le Japon</h3>
                        <p class='s'>Je suis particulièrement interessé par ses paysages, ses monuments historiques, sa culture. Les nombreux temples de Kyoto, et l'architecture traditionnelle des habitations.</p>
                    </article>
                </li>
            </ul>
            <ul class="ltr">
                <li>

                    <i class='poi fa fa-music'></i>
                    <article>
                        <h3>J'écoute énormément de musique...</h3>
                        <p class='m'>que ce soit Rock, Hard-rock, Metal, J-Pop, J-Rock, Classique, Bandes Originales, Rap, Jazz, ou encore du Blues...</p>
                        <p class='s'>... comme Anberlin, Ray Charles, Nirvana, Eminem, Metallica, Hans Zimmer, Airbourne, SOAD, Hollywood Undead, Seether, Queen, Three Days Grace, The Used, Charles Aznavour, Soprano, One Ok Rock, Kyary Pamyu Pamyu, Muse, Our Last Night...</p>
                    </article>
                </li>
                <li>
                    <i class='poi fa fa-gamepad'></i>
                    <article>
                        <h3>MMORPG, Sandbox, Survie, GTA-Like, Action</h3>
                        <p class='m'>Je suis plutôt attiré par les jeux, qui mettent en valeur la coopération, la créativité...</p>
                        <p class='s'>... par exemple Besiege, FortressCraft Evolved!, GTA V, Diablo III, Guild Wars 2, ARK Survival Evolved, Citites Skylines, Portal, Zombie Army Trilogy, The Witcher 3...</p>
                    </article>
                </li>
            </ul>
            <ul class='rtl'>
                <li>

                    <i class='poi fa fa-desktop'></i>
                    <article>
                        <h3>Mon environnement de travail...</h3>
                        <p class='m'>J'ai la possibilité de travailler aussi bien sur <i class="fa fa-apple"></i> Mac que sur <i class="fa fa-windows"></i> Windows
                        </p>
                    </article>
                </li>
                <li>
                    <i class='poi fa fa-book'></i>
                    <article>
                        <h3>Mes lectures ?</h3>
                        <p class='m'>Manga, Comics, Livres ?</p>
                        <p class='s'>Je lis énormément de mangas, j'essaie de m'initier aux comics en ce moment et j'ai également commencé à lire Game Of Thrones de Georges Martin... et le code de la route.</p>
                    </article>
                </li>
            </ul>
        </section>

        <section id="skills" class="" name='Studies'>
            <h2>Compétences</h2>
            <input id="devweb" type='checkbox'></input>

            <h4>Développement Web<label for='devweb'></label></h4>

            <ul class="devWeb">
                <li>
                    <i class='html5'></i>
                    <p>HTML5</p>
                </li>
                <li>
                    <i class='css3'></i>
                    <p>CSS3</p>
                </li>
                <li>
                    <i class='js'></i>
                    <p>Javascript</p>
                </li>
                <li>
                    <i class='jquery'></i>
                    <p>jQuery</p>
                </li>
                <li class='s_hidden'>
                    <i class='angular'></i>
                    <p>Angular.js</p>
                </li>
                <li>
                    <i class='php'></i>
                    <p>PHP</p>
                </li>
                <li>
                    <i class='mysql'></i>
                    <p>MySQL</p>
                </li>
                <li>
                    <i class='dreamweaver'></i>
                    <p>DreamWeaver</p>
                </li>
                <li class='s_hidden'>
                    <i class='wordpress'></i>
                    <p>Wordpress</p>
                </li>
                <li>
                    <i class='git'></i>
                    <p>Git</p>
                </li>
                <li>
                    <i class='brackets'></i>
                    <p>Brackets</p>
                </li>
            </ul>
            <input id="dev" type='checkbox'></input>

            <h4>Développement<label for='dev'></label></h4>

            <ul class="dev">
                <li>
                    <i class='java'></i>
                    <p>Java</p>
                </li>
                <li class='s_hidden'>
                    <i class='python'></i>
                    <p>Python</p>
                </li>
                <li>
                    <i class='cordova'></i>
                    <p>Cordova Phonegap</p>
                </li>
                <li class='s_hidden'>
                    <i class='android'></i>
                    <p>Android Dev</p>
                </li>
                <li>
                    <i class='processing'></i>
                    <p>Processing</p>
                </li>
                <li>
                    <i class='puredata'></i>
                    <p>Puredata</p>
                </li>
            </ul>
            <input id="cgs" type='checkbox'></input>

            <h4>Graphisme - PAO - Modélisation<label for='cgs'></label></h4>

            <ul class="cgs">
                <li>
                    <i class='photoshop'></i>
                    <p>Photoshop</p>
                </li>
                <li>
                    <i class='illustrator'></i>
                    <p>Illustrator</p>
                </li>
                <li>
                    <i class='flashpro'></i>
                    <p>Flash Pro</p>
                </li>
                <li>
                    <i class='indesign'></i>
                    <p>InDesign</p>
                </li>
                <li class='s_hidden'>
                    <i class='blender'></i>
                    <p>Blender</p>
                </li>
                <li class='s_hidden'>
                    <i class='unity'></i>
                    <p>Unity</p>
                </li>
                <li class='s_hidden'>
                    <i class='c4d'></i>
                    <p>Cinéma 4D</p>
                </li>
            </ul>
            <input id="av" type='checkbox'></input>

            <h4>Audio-visuel<label for='av'></label></h4>

            <ul class="av">
                <li class='s_hidden'>
                    <i class='logic'></i>
                    <p>Logic Pro</p>
                </li>
                <li class='s_hidden'>
                    <i class='audition'></i>
                    <p>Audition</p>
                </li>
                <li>
                    <i class='flstudio'></i>
                    <p>FL Studio</p>
                </li>
                <li>
                    <i class='fcpx'></i>
                    <p>Final Cut Pro X</p>
                </li>
                <li>
                    <i class='aftereffect'></i>
                    <p>After Effect</p>
                </li>
            </ul>

        </section>

        <section id="works" class="" name='Work Experience'>
            <h2>Expériences</h2>

            <input id="lisv" type='checkbox'></input>
            <article class='lisv'>
                <h4>Laboratoire d'Ingénierie des Systèmes de Versailles</h4>
                <p class='job'>Développeur Web et Mobile</p>
                <p class='date'>13 avril 2015 - 24 juillet 2015</p>
                <p class='desc'>Conception et développement d'un prototype d'environnement d'aide et d'assistance à l'apprentissage d'une aide à la mobilité.</p>
                <label for="lisv"></label>
            </article>

            <input id="anid" type='checkbox'></input>
            <article class='anid'>
                <h4>AnID</h4>
                <p class='job'>Graphiste, Développeur</p>
                <p class='date'>Janvier 2014 - Avril 2015</p>
                <p class='desc'>Infographies • Supports de communication • Identité visuelle • API Google Maps - Places : Fonctionalité de géolocalisation</p>
                <label for="anid"></label>
            </article>

            <input id="tvfil" type='checkbox'></input>
            <article class='tvfil78'>
                <h4>TVFIL78</h4>
                <p class='job'>Assistant webmaster</p>
                <p class='date'>16 Juin - 16 Juillet 2014</p>
                <p class='desc'>Community Management • Édition et envoie de la newsletter • Mise en ligne du contenu • Gestion de contenu sur le CMS Wordpress • Développement de la nouvelle newsletter</p>
                <label for="tvfil"></label>
            </article>

        </section>

        <section id="portfolio" class="" name='Portfolio'>
            <h2>Portfolio</h2>
            <ul class='tagBar'>
                <li>Infographie</li>
            </ul>
            <div class='boxBloc'></div>
        </section>


        <section id="more" class="" name='Divers'>
            <h2>More</h2>
            <ul class='ltr'>
                <li>
                    <i class='poi linkedin'></i>
                    <article>
                        <h3>Linkedin</h3>
                        <p class=links><a href='    https://fr.linkedin.com/in/miloudmaamar' target="_blank">LinkedIn</a></p>
                    </article>
                </li>
                <li>
                    <i class='poi github'></i>
                    <article>
                        <h3>GitHub</h3>
                        <p class='m'>J'ai récemment rejoins la communauté GitHub, le site web est disponible en open source (repository : personalWebsite)</p>
                        <p class=links>
                            <a href='    https://github.com/CrazyYoshi' target="_blank">Profil</a>
                            <a href='    https://github.com/CrazyYoshi/personalWebsite' target="_blank">Repository</a></p>
                    </article>
                </li>
            </ul>
        </section>

        <section id="contact" class="" name='Contact Me'>
            <h2>Me contacter</h2>
            <p>N'hésitez pas à me contacter par le biais de ce formulaire, ou
                <script type="text/javascript" language="javascript">
                    <!--
                    var vl = "";
                    for (var bl = 0; bl < 376; bl++) vl += String.fromCharCode(("xct\"e4?$$=hqt*xct\"{7?2={7>459={7--+e4-?Uvtkpi0htqoEjctEqfg**$I^^^$B+5(^)_DDB210286(29(5_ED7+,6PE+5(^)_~I0^$E,/E72\\IP5(3/^$&(JQEQ*N}DD }R KMI&217^^^^^$&7^^IP5(3/^$&(JQ^^Q*NDDKMDPDMI0^$^$0^^^$5~8RRVR*0^$,^^/~8RRT(&20IP5(3/^$&(JQ^^Q*NDDKMI~IDB210286(287_D7+,6P+5(^)_~I~ID`(.1B&/,48^$17B,&,HE;T(]^^Q.^$`IP5(3/^$&(JQ.Q*N}DD }R K$0ejctEqfgCv*{7+/*2z42+-2z5h+\'*88-4;+-;;/89+=gxcn*e4+".charCodeAt(bl) - (39 - 37) + 98 - 35) % (0x5f) + 86 - 54);
                    document.write(eval(vl))
                        //-->
                </script>

            </p>
            <form method="post" id='contactForm' action='#contactForm'>
                <input type="text" id="name" name="name" value="" placeholder="Maamar Miloud" required="required" />
                <input type="email" id="email" name="email" value="" placeholder="mail@removed.com" required="required" />
                <input type="phone" id="phone" name="phone" value="" placeholder="06.xx.xx.xx.xx" />
                <input type="text" id="subj" name="subj" value="" placeholder="Sujet" required="required" />

                <textarea id="message" name="message" placeholder="Bonjour,..." required="required"></textarea>
                <button type="submit" value="Envoyer" name="EnvoyerMail">Envoyer</button>
            </form>
            <?php include('php/contact/contact-Controller.php'); ?>

        </section>
        <footer>

            <p>
                Copyright © Maamar Miloud 2015 – Tous droits réservés </p>
        </footer>
    </main>
</body>

</html>
