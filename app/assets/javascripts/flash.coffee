class flash
  @notice: (level) -> (message) ->
    flash = $("""
<div class="alert alert-#{level} alert-dismissible fade in">
  <button class="close" type="button" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
  #{message}
</div>
""")
    flash.append $('#flash')
    window.setTimeout () ->
      flash.alert 'close'
    , 5000
  @info:    @notice('info')
  @danger:  @notice('danger')
  @success: @notice('success')
  @warning: @notice('warning')

@flash = flash

remove_flash = () ->
  window.setTimeout () ->
    $('.alert.alert-dismissible').alert('close')
  , 5000

$(document).on 'turbolinks:load', remove_flash
