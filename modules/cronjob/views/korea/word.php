<h2>Cập nhật word</h2>
<button type="button" onclick="btnUpdateWord()">Cập nhật</button>
<button type="button" onclick="btnStop()">Stop</button>
<div id="results"></div>

<script>
    var  abort;

    function  btnUpdateWord(){
        abort = $.ajax({
            url: '<?php echo site_url("cronjob/korea/updateWord")?>',
            type: "POST",
            dataType:"json",
            success:function(data){
                 $('#results').append(data.text+'<br>'+data.image+'<br>');
                 btnUpdateWord();
            }
        });
    }

    function btnStop(){
        abort.abort();
    }

</script>