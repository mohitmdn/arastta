<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
		<a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-success"><i class="fa fa-plus"></i></a>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-stock-status">
          <div class="table-responsive">
            <table class="table table-hover">
              <thead>
                <tr>
                  <td style="width: 70px;" class="text-center">
				  <div class="bulk-action">
                    <input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" />
                    <span class="bulk-caret"><i class="fa fa-caret-down"></i></span>
					<span class="item-selected"></span>
					<span class="bulk-action-button">
					  <a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<b><?php echo $text_bulk_action; ?></b>
						<span class="caret"></span>
					  </a>
					  <ul class="dropdown-menu dropdown-menu-left alerts-dropdown">
						<li class="dropdown-header"><?php echo $text_bulk_action; ?></li>
						<li><a onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-stock-status').submit() : false;"><i class="fa fa-trash-o"></i> <?php echo $button_delete; ?></a></li>
					  </ul>
					</span>
                  </div></td>
                  <td class="text-left"><?php if ($sort == 'name') { ?>
                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                    <?php } ?></td>
                </tr>
              </thead>			  
              <tbody>
                <?php if ($stock_statuses) { ?>
                <?php foreach ($stock_statuses as $stock_status) { ?>
                <tr>
                  <td class="text-center"><?php if (in_array($stock_status['stock_status_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $stock_status['stock_status_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $stock_status['stock_status_id']; ?>" />
                    <?php } ?></td>
                  <td class="text-left">
					<a href="<?php echo $stock_status['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>"><i class="fa fa-pencil"></i></a>
					<?php echo $stock_status['name']; ?></td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="3"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$(document).ready(function() {
  $('input[type=\'checkbox\']').click (function() {
    var checkboxes = $('#form-stock-status input[type=\'checkbox\']');
    var selected = 0;

    $.each(checkboxes, function( index, value ) {
      var thisCheck = $(value);

      if (thisCheck.is(':checked')) {
        selected = selected + 1;
      }
    });

    if (selected) {
      $('.bulk-caret').hide();
      $('.bulk-action').addClass('bulk-action-activate');
      $('.bulk-action-activate').removeClass('bulk-action');
	  
      $('thead td:not(:first)').hide();
      $('.item-selected').css('display', 'inline');
      $('.bulk-action-button').css('display', 'inline');
      $('.item-selected').html(selected + ' <?php echo $text_selected; ?>');
    } else {
	  $('thead td').show();
      $('.item-selected').css('display', 'none');
      $('.bulk-action-button').css('display', 'none');
	  $('.bulk-caret').show();
	  $('.bulk-action-activate').addClass('bulk-action');
      $('.bulk-action').removeClass('bulk-action-activate');
    }
  });  
});
//--></script>
<?php echo $footer; ?>
<link href="view/theme/basic/stylesheet/basic.css" type="text/css" rel="stylesheet" />