### 
Messages
  message: String,
  name: String,
  good: Number,
  bad: Number,
  timestamp: Number
###

Messages = new Meteor.Collection "messages";

Meteor.publish 'messages', () ->
  Messages.find()
