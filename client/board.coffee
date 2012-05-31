
Messages = new Meteor.Collection "messages";

Meteor.subscribe 'message', () ->

Template.messages.lists = () ->
  Messages.find()

Template.form.events =
  'click form button': (evt)->
    Messages.insert(
      name   : $('form #name').val()
      message: $('form #message').val()
      timestamp: Date()
    )
    $('form #name').val ''
    $('form #message').val ''

Template.messages.events =
  'click .good': (evt)->
    message = Messages.findOne(this._id)
    Messages.update(this._id, {
      $set:
        good: message.good + 1
    })

  'click .bad': (evt)->
    message = Messages.findOne(this._id)
    Messages.update(this._id, {
      $set:
        bad: message.bad + 1
    })
