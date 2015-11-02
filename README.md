## dragable-window

Fully customizable draggable window

-----------------------------------

## Markup

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
        {{/with}}
    </div>
    <div class="dragable-window-footer">
        <button class="btn btn-success btn-sm">Ok</button>
        <button class="btn btn-default btn-sm">Cancel</button>
    </div>
</template>
```

## Coffee

```
Template.Home.helpers
  dragableConfig: ->
    template = Template.instance()
    context: {}
    windowClass: 'dragable-medium'
    onInitialize: (modalInstance) ->
      template.modal = modalInstance

Template.ModalDemoTemplate.events
  'dragable.window.hide .dragable-window-body': (e, tmpl) ->
    console.log 'modal window show event'
```


Made by [![Professional Meteor Development Studio](http://s30.postimg.org/jfno1g71p/jss_xs.png)](http://jssolutionsdev.com?utm_campaign=Package_Development&utm_medium=github.com&utm_source=Dragable-window) - [Professional Meteor Development Company](http://jssolutionsdev.com?utm_campaign=Package_Development&utm_medium=github.com&utm_source=Dragable-window)
