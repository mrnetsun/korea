<?php 
	$formBase = new FormBase();
	echo $formBase->create('system/config/update',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));
	$formBase->fillData($fillData);
    $data_before = json_decode( $fillData->data_before );
    $data_after = json_decode( $fillData->data_after );
?>
        <div class="section ">
            <?php

            echo $formBase->view("LBL_CONFIG_NAME",isset($data_after->configName)? $data_after->configName:$data_before->configName );
            if( isset($data_after->configName) && strcmp($data_after->configName,$data_before->configName ) ){
            echo $formBase->view('',$data_before->configName,'',array('class'=>'line-through-old') );
            }

            echo $formBase->view("LBL_CONFIG_CODE",isset($data_after->configCode)? $data_after->configCode:$data_before->configCode );
            if( isset($data_after->configCode) && strcmp($data_after->configCode,$data_before->configCode ) ){
                echo $formBase->view('',$data_before->configCode,'',array('class'=>'line-through-old') );
            }

            switch( $data_before->type ){
                case 'json':
                    $params_before = json_decode($data_before->params);
                    $configValue_before = json_decode($data_before->configValue);
                    $configValue_before = $configValue_before['0'];

                    $params_after = json_decode($data_after->params);
                    $configValue_after = json_decode($data_after->configValue);
                    $configValue_after = $configValue_after['0'];
                    if( !empty( $params_before ) ){
                        foreach( $params_before as $key=>$value ){
                              echo $formBase->view( $value, isset( $configValue_after[$key] ) ? $configValue_after[$key]:'' );
                              if( (isset( $configValue_after[$key] ) && isset( $configValue_before[$key] ) ) && ( $configValue_after[$key] !== $configValue_before[$key]  ) ){
                                  echo $formBase->view('', isset( $configValue_before[$key] ) ? $configValue_before[$key]:'','',array('class'=>'line-through-old') );
                              }
                        }
                    }
                    break;
                case 'upload_image':
                    echo json_img($data_after->configValue,array('width'=>'40','height'=>'40','style'=>'width:100px; height:auto;'));
                    if( $data_before->configValue !== $data_after->configValue ){
                        echo json_img($data_before->configValue,array('width'=>'40','height'=>'40','style'=>'width:100px; opacity: 0.4; height:auto;'));
                    }
                    break;
                case 'yesno':
                    echo $formBase->yesno('LBL_CONFIG_CODE',array('label'=>"Value",'rules'=>"required"));
                    break;
                case 'status':
                    echo $formBase->status('LBL_STARTUS',array('label'=>"Value",'rules'=>"required"));
                    break;
                default:
                    echo $formBase->view( 'LBL_CONFIG_VALUE' , isset( $data_after->configValue ) ? $data_after->configValue : $data_before->configValue );
                    if( $data_after->configValue !== $data_before->configValue ){
                        echo $formBase->view( '' , $data_before->configValue , '', array('class'=>'line-through-old') );
                    }
                    break;
            }
            ?>
        </div>
	<div class="clear"></div>
<?php echo $formBase->end();?>