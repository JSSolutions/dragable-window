Template.DragableWindow.onCreated ->
  @windowContext = new ReactiveVar(@data?.context)
  @windowPosition = new ReactiveVar(@data?.windowPosition)

  #public method for changing context
  @setContext = (newContext) => @windowContext.set newContext

Template.DragableWindow.onRendered ->
  windowElement = @$('.dragable-window')

  #init window
  windowElement.draggable {handle: '.dragable-window-header'}

  triggerEventOnWindowBody = (eventName, params) =>
    @$('.dragable-window-body').trigger $.Event(eventName, params)

  getElementSize = (element) -> {width: element.width(), height: element.height()}

  tmpl = @
  onShowInternal = -> #center window
    bodySize = getElementSize $(tmpl.firstNode).parent()
    windowSize = getElementSize $(tmpl.firstNode)
    calculateCenter = (dimensionName) -> (bodySize[dimensionName] - windowSize[dimensionName]) / 2
    position = tmpl.windowPosition.get()
    if !position then position = {left: calculateCenter('width'), top: 100}
    windowElement.css position

  #initialize control methods for parent view
  @show = (newContext) =>
    if newContext then @windowContext.set newContext
    onShowInternal()
    triggerEventOnWindowBody('dragable.window.show', {})
    windowElement.fadeIn('fast')
    if @data.backdrop then @$('.backdrop').fadeIn('fast')
    triggerEventOnWindowBody('dragable.window.shown', {})

  @hide = =>
    windowElement.fadeOut('fast')
    if @data.backdrop then @$('.backdrop').fadeOut('fast')
    triggerEventOnWindowBody('dragable.window.hide', {})

  @isVisible = -> windowElement.css('display') isnt 'none'

  #pass modal instance to parent
  @data.onInitialize(@)


Template.DragableWindow.helpers
  windowContext: -> Template.instance().windowContext.get()
  windowClass: -> Template.instance()?.data?.windowClass || 'dragable-small' #or default class
  instance: -> Template.instance()


Template.DragableWindowCloseButton.events
  'click .close-dragable-window-button': (event, tmpl) ->
    tmpl.data.instance.hide()
