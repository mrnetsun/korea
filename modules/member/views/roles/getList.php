<?php
//localTime
//img_status($item->status,site_url('member/role/dataSwitch/'.$item->roleId.'/status'));

$formBase = new FormBase();
echo $formBase->create('member/role/saveAll');
echo $formBase->loadListUrl();

if (is_array($sort)) {
    list($sort_key, $sort_dir) = each($sort);
}

?>
<div class="boxin">
    <div style="display: block;"><!-- content box 1 for tab switching -->

        <fieldset>
            <table>
                <thead><!-- universal table heading -->
                <tr>
                    <td class="tc first w20"><input type="checkbox" value="true" class="checkAll"
                                                    onclick="Common.checkAll(this)"></td>

                    <th class="tl">
                        <div class="sortable <?php echo ($sort_key == 'roleName') ? $sort_dir : ''; ?>"
                             onclick="Common.sort(this,'roleName')"><?php echo __("LBL_ROLE"); ?></div>
                    </th>
                    <th class="tc w80">
                        <div class="sortable <?php echo ($sort_key == 'status') ? $sort_dir : ''; ?>"
                             onclick="Common.sort(this,'status')"><?php echo __("LBL_STATUS"); ?></div>
                    </th>
                    <th class="tc w100">
                        <div class=" "><?php echo __("LBL_PERMISSION"); ?></div>
                    </th>
                    <th class="tc span2">
                        <div class="sortable <?php echo ($sort_key == 'createdTime') ? $sort_dir : ''; ?>"
                             onclick="Common.sort(this,'createdTime')"><?php echo __("LBL_CREATEDTIME"); ?></div>
                    </th>
                    <td class="tc last w90">&nbsp;<span class='action-setting'></span></td>
                </tr>
                </thead>
                <tfoot><!-- table foot - what to do with selected items -->
                <tr>
                    <td colspan="15" class="first last">
                        <?php
                        $currentController = strtolower($this->router->fetch_class());
                        $viewdefs = $this->config->item($currentController . '_viewdefs');

                        $curentToolbar = $viewdefs['getList'];

                        if (!empty($curentToolbar['dropdownTask'])) {
                            ?>
                            <label>
                                <?php
                                echo __("With selected do:");
                                //array of action.
                                $aryOption = $curentToolbar['dropdownTask'];
                                echo $formBase->dropdown('doAction', array('options' => $aryOption, 'onchange' => 'Common.submitSelect(this)'));
                                ?>
                            </label>
                        <?php } ?>
                        <div class="pagination">
                            <?php echo $pagination->pagingInfo(); ?>
                            <div class="numberListShowing" style="float: left; margin-left: 10px;">
                                <?php
                                echo $formBase->dropdown('numberListShowing',
                                    array('options' => $this->config->item('paging_select'), 'selected' => $pagingConfig['per_page'], 'onchange' => 'Common.changeNumberListShowing(this)')); ?>
                            </div>
                            <?php echo $pagination->create_links($start); ?>
                        </div>
                    </td>
                </tr>
                </tfoot>
                <tbody>
                <?php if (!empty($aryData)) {
                    $i = 0;

                    foreach ($aryData as $item) {
                        $i++;
                        $first = ($i == 1) ? 'LBL_FIRST' : '';
                        $even = ($i % 2 == 0) ? 'even' : '';
                        ?>
                        <tr class="<?php echo $first . ' ' . $even; ?>">
                            <td class="tc first">
                                <?php if ($item->locked) {
                                    echo img_lock();
                                } else {
                                    echo $formBase->checkbox('cid[]', array('value' => $item->roleId, 'onclick' => "Common.isCheckAll(this)"));
                                } ?>
                            </td>


                            <td class="tl">
                                <div><?php echo $item->roleName ?></div>
                            </td>
                            <td class="tc">
                                <div><?php if ($item->locked) {
                                        echo img_lock();
                                    } else {
                                        echo img_status($item->status, site_url('member/role/dataSwitch/' . $item->roleId . '/status'));
                                    } ?></div>
                            </td>
                            <td class="tc">
                                <div>
                                    <?php if ($item->locked) {
                                        echo img_lock();
                                    } else {
                                        echo anchor('member/role/listItem/' . $item->roleId, __('LBL_UPDATE_PERMISSION'));
                                    } ?></div>
                            </td>
                            <td class="tc">
                                <div><?php echo formatDate($item->createdTime) ?></div>
                            </td>

                            <td class="tc last ">

                                <div class="settings-button">
                                    <div class="toolbar-icons">
                                        <?php echo ajax_link('member/role/detail/' . $item->roleId, '<i class="action-icon-eye-open" rel="tooltip" title=' . __("LBL_VIEW") . '></i>', array('overlay' => 'LBL_VIEW')); ?>
                                        <?php if ($item->locked) {
                                            echo img_lock();
                                        } else { ?>
                                            <?php
                                            if (checkPermissionUser(array('task' => 'edit'), $LoginData->permission)):
                                                echo ajax_link('member/role/edit/' . $item->roleId, '<i class="action-icon-edit" rel="tooltip" title=' . __("LBL_EDIT") . '></i>', array('overlay' => 'LBL_EDIT'));
                                            endif;
                                            ?>
                                            <?php
                                            if (checkPermissionUser(array('task' => 'delete'), $LoginData->permission)):
                                                echo ajax_link('member/role/delete/' . $item->roleId, '<i class="action-icon-trash" rel="tooltip" title=' . __("LBL_DELETE") . '></i>', array('callBack' => 'reload'));
                                            endif;
                                            ?>
                                        <?php } ?>
                                    </div>
                                </div>


                            </td>
                        </tr>
                        <?php

                    }

                } else {
                    ?>
                    <tr>
                        <td colspan="15"> <?php echo __('LBL_NO_RECORD'); ?></td>
                    </tr>
                    <?php
                }
                ?>

                </tbody>
            </table>
        </fieldset>

    </div><!-- .content#box-1-holder -->
</div>
<?php echo $formBase->end(); ?>
