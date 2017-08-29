<div class="main"><div class="shell">
<?php
$formBase = new FormBase();
echo $formBase->create('system/runquery',array('ajax'=>_getBaseName('List')));
?>
<div id="error_display">

</div>
<div class="w500">

    <div class="section ">
        <label>
            <?php echo __("Query");?>
        </label>
        <div>
            <?php echo $formBase->textarea('q',array('class'=>'span6','rows'=>'10'))?>
        </div>
    </div>

    <div class="actions ">

        <?php
        echo $formBase->submit('BTN_SUBMIT');
        ?>


    </div> <!-- End of .content -->


</div>

<?php echo $formBase->end();?>
</div></div>
			
<script>
    function queryCallback(data){
        $('#error_display').html(data);
    }
</script>