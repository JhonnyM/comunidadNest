class @ProyectosForm
  constructor:() ->
    @saveButton = $('#js-save-proyecto')
    @spinner    = $('#js-proyecto-spinner')

  initialize:() ->
    @_apply_click_behavior(@)

  _apply_click_behavior:(el) ->
    el.saveButton.click ->
      el.spinner.show()

  hide_spinner: ->
    @spinner.hide(2000)

  $ ->
    new ProyectosForm().initialize()
