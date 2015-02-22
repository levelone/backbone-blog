class BackboneBlog.Views.Attachment extends Backbone.View
  template: JST['attachments/attachment']
  tagName: 'li'

  events:
    'click #remove_attachment': 'removeAttachment'

  initialize: (options) ->
    @attachment = options.model
    @router     = options.router

    @attachment.on 'remove', @reloadAttachmentList, this

  render: ->
    @$el.html @template(attachment: @attachment)
    @

  removeAttachment: (e) ->
    e.preventDefault()

    if confirm('Are you sure?') == true
      $('.notification-box').removeAttr('hidden')
      $('.notification-box').html("'#{@attachment.get('title')}' has been successfully deleted!")
      @el.remove()
      @attachment.destroy()
    else
      console.log 'You pressed Cancel!'
