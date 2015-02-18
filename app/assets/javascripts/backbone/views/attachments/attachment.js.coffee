class BackboneBlog.Views.Attachment extends Backbone.View
  template: JST['attachments/attachment']
  tagName: 'li'

  events: {
    'click #remove_attachment': 'removeAttachment'
  }

  render: ->
    console.log 'render!'
    $(@el).html @template(attachment: @model)
    @

  removeAttachment: (e) ->
    e.preventDefault()
    debugger

    # if confirm('Are you sure') == true
    #   $('.notification-box').removeAttr('hidden')
    #   $('.notification-box').html("'#{@model.get('title')}' has been successfully deleted!")
    #   # this.el.remove()
    #   @model.destroy()
    # else
    #   # Do nothing
    #   # console.log @model.get('title')
    #   # console.log @model.get('id')
    #   console.log 'You pressed Cancel!'
