##Description
Fully customizable dragable window

##Example
###Markup
```
<template name="Home">
    <div class="container">
        <h4>Home page here</h4>
        <button class="showHideModal">show/hide</button>
        {{#DragableWindow dragableConfig}}
            {{> ModalDemoTemplate}}
        {{/DragableWindow}}
    </div>
</template>

<template name="ModalDemoTemplate">
    <div class="dragable-window-header">
        Example of window {{> DragableWindowCloseButton}}
    </div>
    <div class="dragable-window-body">
        {{#with context}}
            <div class="form-group">
                <label for="exampleInputEmail1">Email address</label>
                <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email"
                       value="{{name}}">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password"
                       value="{{password}}">
            </div>
            <div class="form-group">
                <label for="exampleInputFile">File input</label>
                <input type="file" id="exampleInputFile">

                <p class="help-block">Example block-level help text here.</p>
            </div>
            <div class="checkbox">
                <label>
                    <input type="checkbox"> Check me out
                </label>
            </div>
        {{/with}}
    </div>
    <div class="dragable-window-footer">
        <button class="btn btn-success btn-sm">Ok</button>
        <button class="btn btn-default btn-sm">Cancel</button>
    </div>
</template>
```
###Coffee
```
Template.Home.helpers
  dragableConfig: ->
    template = Template.instance()
    context:
      name: 'Some name',
      password: '12345'
    windowClass: 'dragable-medium'
    onInitialize: (modalInstance) ->
      template.modal = modalInstance

Template.Home.events
  'click .showHideModal': (e, tmpl) ->
    tmpl.count ?= 0;

    if tmpl.modal
      if tmpl.modal.isVisible() then tmpl.modal.hide() else tmpl.modal.show
        name: 'Some name ' + (tmpl.count++)
        password: '12345'

Template.ModalDemoTemplate.events
  'dragable.window.hide .dragable-window-body': (e, tmpl) ->
    console.log 'modal window show event'
```
##License MIT