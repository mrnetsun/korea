<div class="dialog-wrapper">
    <div class="block-dialog block-dialog-alert">
        <div class="dialog-header">
            <div class="header-title">
                <span class="dialog-title"><?php echo __('CONFIRM-DELETE'); ?></span>
            </div>
            <div class="header-close">
                <div class="button-close">
                    <span onclick="Common.closeDialog()">x</span>
                </div>
            </div>
        </div>
        <div class="dialog-body">
            <span class="dialog-message"><?php echo __('LBL_CONFIRM_DELETE'); ?></span>
        </div>
        <div class="dialog-footer">
            <div class="box-button">
                <button data-bb-handler="success" type="button" class="btn btn-confirm btn-confirm-yes"><?php echo __('LBL_YES'); ?></button>
                <button data-bb-handler="success" type="button" class="btn btn-confirm" onclick="Common.closeDialog()"><?php echo __('LBL_NO'); ?></button>
            </div>
        </div>
    </div>
</div>