_ = require "lodash"

Events =
	EventBufferReset   : "eventbufferreset"
	EventBufferUpdated : "eventbufferupdated"

# TODO: Replace Date.now() with Utils.getTime()

module.exports = class EventBuffer

	constructor: (options = {}) ->
		@options = _.defaults options,
			velocityTimeout: 100
		@_events = []

	push: (event) ->
		@_events.push event
		@emit Events.EventBufferUpdated, event

	reset: ->
		@_events.length = 0
		@emit Events.EventBufferReset

	Object.defineProperties @prototype,

		length:
			get: -> @_events.length

		first:
			get: -> @_events[0]

		offset:
			get: ->
				return {x:0, y:0} if events.length < 2
				current = events[events.length - 1]
				first   = events[0]
				offset =
					x: current.x - first.x
					y: current.y - first.y
				return offset

		events:
			get: ->
				timeout = Date.now() - @options.velocityTimeout
				return _.filter @_events, (event) => event.t > timeout

		angle:
			get: ->
				events = @events
				return 0 if events.length < 2
				p1 = events[0]
				p2 = events[1]
				return Math.atan2(p2.y - p1.y, p2.x - p1.x) * 180 / Math.PI;

		velocity:
			get: ->
				events = @events

				return {x:0, y:0} if events.length < 2

				current = events[events.length - 1]
				first   = events[0]
				time    = current.t - first.t

				velocity =
					x: (current.x - first.x) / time
					y: (current.y - first.y) / time

				velocity.x = 0 if velocity.x is Infinity
				velocity.y = 0 if velocity.y is Infinity
				return velocity
