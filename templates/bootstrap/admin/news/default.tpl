<script src="{$PATH}/js/cleditor/jquery.cleditor.min.js"></script>
<link rel="stylesheet" href="{$PATH}/js/cleditor/jquery.cleditor.css">
<script type="text/javascript">
  $(document).ready(function () { $(".cleditor").cleditor(); });
</script>
<div class="row">
  <form class="col-lg-12" method="POST" action="{$smarty.server.SCRIPT_NAME}" role="form">
    <div class="panel panel-info">
      <div class="panel-heading">
        <i class="fa fa-edit fa-fw"></i> {t}Write News{/t} 
        <br>
        <font size="1px">{t}News posts support the Markdown syntax{/t}</font>
      </div>
      <div class="panel-body">
        <div class="row">
          <div class="col-lg-12">
            <input type="hidden" name="page" value="{$smarty.request.page|escape}">
            <input type="hidden" name="action" value="{$smarty.request.action|escape}">
            <input type="hidden" name="do" value="add">
            <input type="hidden" name="ctoken" value="{$CTOKEN|escape|default:""}" />
            <div class="form-group">
              <label>{t}Active{/t}</label>
              <input type="checkbox" class="switch" data-size="mini" name="data[active]" value="1" checked>
            </div>
            <div class="form-group">
              <label>{t}Header{/t}</label>
              <input class="form-control" size="30" type="text" name="data[header]" required />
            </div>
            <div class="form-group">
              <label>{t}Content{/t}</label>
              <textarea class="form-control cleditor" name="data[content]" rows="5" required></textarea>
            </div>
          </div>
        </div>
      </div>
      <div class="panel-footer">
        <input type="submit" value="{t}Add{/t}" class="btn btn-success btn-sm">
      </div>
    </div>
  </form>
</div>

<div class="row">
{nocache}
{section name=news loop=$NEWS}
  <div class="col-lg-12">
    <div class="panel panel-info">
      <div class="panel-heading">
        <i class="fa fa-info fa-fw"></i> {$NEWS[news].header}</a>
        <br />
        <font size="1px">{t news_date=$NEWS[news].time|date_format:$GLOBAL.config.date}posted %1{/t}{if $HIDEAUTHOR|default:"0" == 0} {t escape=no news_author=$NEWS[news].author}by <b>%1</b>{/t}{/if}</font>
      </div>

      <div class="panel-body">
        {$NEWS[news].content nofilter}
      </div>
      <div class="panel-footer">
        <div style="text-align:right">
          <a href='{$smarty.server.SCRIPT_NAME}?page={$smarty.request.page|escape}&action=news_edit&id={$NEWS[news].id}'><i class="fa fa-wrench fa-fw"></i></a>&nbsp;
          <a href='{$smarty.server.SCRIPT_NAME}?page={$smarty.request.page|escape}&action={$smarty.request.action|escape}&do=delete&id={$NEWS[news].id}&ctoken={$CTOKEN|escape|default:""}'><i class="fa fa-trash-o fa-fw"></i></a>
        </div>
      </div>
    </div>
  </div>
{/section}
{/nocache}
</div>
