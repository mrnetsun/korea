<div class="topMenuWrap">
    <div class="container">
        <div class="nav no-print">
            <?php
                $htmlMenu = frontMenu();
                echo $htmlMenu;
            ?>
        </div>
    </div>
</div>
<div class="container">
    <div class="breadcrumbWrap"><?php echo $this->breadcrumbs->show();?></div>
</div>

