<?php 
  include("../Commons/header.php")
?>
<div class="p-2 text-center"> 
  <?PHP
    $txt = 'Attention le chocolat est extrèmement <span class="badge badge-danger">dangereux</span> pour les chiens et chats !';
    echo styleTitreNiveau1($txt, COLOR_CONSEIL);
  ?>
  <img class="img-fluid img-thumbnail" src="../../sources/images/Autres/Articles/Chocolat.jpg" alt="chocolat">
</div>
<?php 
  include("../Commons/footer.php")
?>