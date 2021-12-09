$(function(){
  $('body').on('change', '#variants :input', function () {
    var form = $('form.js-oxWidgetReload');
    var data = form.serialize() + "&" + $('#variants :input').serialize();

    $.ajax({
      url: form.attr('action'),
      data: data,
      success: function (result) {
        $('#details_container').replaceWith($(result));
        $('body').trigger('variants:reloaded');
      }
    })
  });
});