# Keywords to search
# ----------------------
# Using Template | Checkbox | Event | Sample View | jQuery vs Backbone | REST | Collection
#
#
# Model Events in Collection
# ----------------------
# change | change:<attr> | destroy | sync | error | all
#
#
# Iteration Functions
# ----------------------
# forEach | reduce | reduceRight | find | filter | reject | every | all | some | include | invoke | max |
# min | sortBy | groupBy | sortedIndex | shuffle | toArray | size | first | initial | rest | last | chain |
# without | indexOf | lastIndexOf | isEmpty


# Sample Model:
# ----------------------
var FoobarItem = Backbone.Model.extend({});

var foobarItem = new FoobarItem({description: 'Pick up milk', status: 'incomplete'});
foobarItem.get('description');
foobarItem.set({status: 'complete'});
foobarItem.save();

# Data From Server:
# ----------------------
var foobarItem = new FoobarItem();
foobarItem.url = '/foobar';
foobarItem.fetch();
foobarItem.get('description');

var FoobarItem = new Backbone.Modal.extend({urlRoot: '/foobars'});

var foobarItem = new FoobarItem({id: 1});
foobarItem.fetch();
foobarItem.set({description: 'blabla'});
foobarItem.save();


# Sample Create
# ----------------------
var foobarItem = new FoobarItem();
foobarItem.set...
foobarItem.save();

# Sample Destroy
# ----------------------
foobarItem.get('id');
foobarItem.destroy;

foobarItem.toJSON();


# Sample View:
# ----------------------
var FooBar = Backbone.View.extend({});

# Default Values
# ----------------------
var FoobarItem = Backbone.Model.extend({defaults: {description: 'Empty ...', status: 'incomplete'} });

var foobarItem = new FoobarItem();
foobarItem.get('description');
foobarItem.get('status');

# Event Based
# ----------------------
foobarItem.on('event-name', function(){
  alert('event-name');
}):

foobarItem.on(event-name, method);
foobarItem.set({description: 'bla'}, {silent: true});

# Advanced Sample View
# ----------------------
var FooBarView = Backbone.View.extend({tagName: 'article', id: 'foobar-view', className: 'foobar'});

var foobarView = new FoobarView();
console.log (foobarView.el); 
# <article id="foobar-view" class="foobar"></article>
# $('#foobar-view').html();
# $(foobar-view.el).html();
# foobar-view.$el.html();

var foobarView = new FoobarView({model: fooBar});
foobarView.render();
console.log(foobarView.el);
# <div>
#   <h3>Pick up milk</h3>
# </div>

# El Attributes
# ----------------------
var FooBar = new Backbone.View.extend({
  tagName: 'article',
  id: 'foobar-view',
  className: 'foobar',
  render: function(){
    var html = '<h1>' + this.model.get('description') + '</h1>';
    this.$el.html(html);
  }
});

var fooBar = new FooBar({ model: fooBar });
fooBar.render();
console.log(fooBar.el);

# Output ...
# <article id="foobar-view" class="foobar">
#   <h1>Pick up milk</h1>
# </article>


# Using Template
# --------------
var FooBar = Backbone.View.extend({
  ...
  template: _.template('<h3><%= description %></h3>'),
  # underscore library
  render: function(){
    var attributes = this.model.toJSON();
    this.$el.html(this.template(attributes));
  }
});

var fooBar = new FooBar({ model: fooBar });
fooBar.render();
console.log(fooBar.el);

# Output ...
# <article id="foobar-view" class="foobar">
#   <h1>Pick up milk</h1>
# </article>


# jQuery vs. Backbone
# ----------------------
# $("h3").click(method);
# function method(e){
#   alert('clicked h3');
# }
#
# var FooBar = new Backbone.View.extend({
#   events: {
#     "click h3": "method"
#   },
#   method: function(e){
#     alert('clicked h3');
#   }
# })
#
#
# Selector scoped to el
# ---------------------
# this.$el.deligate('h3', 'click', method);


# Event Options
# ---------------------
var FooBar = Backbone.View.extend({
  events: {
    # Can have multiple events..
    # "<event> <selector>": "<method",
    "dblclick" : "open", # open anywhere on EL if no selector indicated
    "click .icon.doc" : "select"
  },
  ...
});


# Review On Model View Using Temnplate
# ----------------------
var FooBar = Foobar.View.extend({
  template: _.template('<h3><%= description %></h3>'),

  render: function(){
    this.$el.html(this.template(this.model.toJSON()));
  }
});

var fooBar = new FooBar({ model: fooBar });
fooBar.render();
console.log(fooBar.el);

# <div>
#   <h3>Pick up milk</h3>
# </div>


# Checkbox Using Template
# ----------------------
var FoobarView = Backbone.View.extend({
  template: _.template("<h3>" +
    "<input type=checkbox " +
    "<% if(status === 'complete') print('checked') %>/>" +
    "<%= description %></h3>"),

  render: function(){
    this.$el.html(this.template(this.model.toJSON()));
  }
});


# Update Sample Model On UI Event
# ----------------------
var FoobarView = Backbone.View.extend({
  events: {
    "change input": "toggleStatus"
  },

  toggleStatus: function(){
    this.modal.toggleStatus();
  }
});

var FoobarItem = Backbone.Model.extend({
  toggleStatus: function(){
    if(this.get("status") === "incomplete"){
      this.set({"status": "complete"});
    }else{
      this.set({"status": "incomplete"});
    }
  }
});


# REST -- PUT
# ----------------------
var FoobarItem = Backbone.Model.extend({
  toggleStatus: function(){
    if(this.get("status") === "incomplete"){
      ...
    }else{
      ...
    }
    this.save(); # PUT /foobars/1
  }
});


# REST
# ----------------------
var FoobarView = Backbone.View.extend({
  initalize: function(){
    # this.model.on(event, this.method, this);
    this.model.on("change", this.render, this);
    this.model.on("destroy", this.remove, this);
  },

  render: function(){
    this.$el.html(this.template(this.modal.toJSON()));
  },

  remove: function(){
    this.$el.remove();
  }
});

## Collection List
# ----------------------
# var item1 = new Item();
# var item2 = new Item();
# Accurate output below!
var FoobarList = Backbone.Collection.extend({
  model: FoobarItem
})
var foobarList = new FoobarList();

# Collection - Commands
# [ Add | Remove | Get ]
foobarList.length;
foobarList.add(foobarItem1);
foobarList.at(0);
foobarList.get(1);
foobarList.remove(foobarItem1);

# Collection - Bulk Population
var foobars = [
  {description: 'Pick up milk', status: 'incomplete'},
  {description: 'Get a car wash', status: 'incomplete'},
  {description: 'Learn Backbone', status: 'incomplete'}
];
foobarList.reset(foobars);

# Collection - URL to get JSON data
var FoobarList = Backbone.Collection.extend({
  url: '/foobars'
});

foobarList.fetch();
# Output
# [
#   {description: 'Pick up milk', status: 'incomplete', id: 1},
#   {description: 'Get a car wash', status: 'incomplete', id: 2}
# ]
foobarList.length; # 2

## Collection - Events Option 1
foobarList.on("event-name", function(){
  alert("event-name happened!");
});
foobarList.trigger("event-name");

## Collection - Events Option 2
foobarList.on("event-name", method);

# Event triggered on reset & fetch
foobarList.fetch();
foobarList.reset();

# without notification
foobarList.fetch({silent: true});
foobarList.reset({silent: true});

# Remove event listener
foobarList.off("reset", method);

## Collection Setup - Iteration
foobarList.reset([
  {description: "Pick up milk", status: "incomplete", id: 1},
  {description: "Get a car wash", status: "incomplete", id: 2}
]);

# Alert model description
foobarList.forEach(function(foobarItem){
  alert(foobarItem.get("description"));
}

# Array of description
foobarList.map(function(foobarItem){
  return foobarItem.get("description");
});

# Filter model by criteria
foobarList.filter(function(foobarItem){
  return foobarItem.get("status") === "incomplete";
}

## Review Model
var foobarView = Backbone.View.extend({
  render: function(){
    this.$el.html(this.template(this.model.toJSON()));
  }
  ....
});

var foobarItem = new FoobarItem();
var foobarView = new FoobarView({model: foobarItem});
console.log(foobarView.render().el);

# Define and Render
var FoobarListView = Backbone.View.extend({});
var foobarListView = new FoobarListView({collection: foobarList});

render: function(){
  this.collection.forEach(this.addOne, this);
}

addOne: function(){
  var foobarView = new FoobarView({model: foobarItem});
  this.$el.append(foobarView.render().el);
}

var foobarListView = new FoobarListView({collection: foobarList});
foobarListView.render();
console.log(foobarListView.el);

# Add new models
var FoobarListView = Backbone.View.extend({
  initialize: function(){
    this.collection.on('add', this.addOne, this);
    this.collection.on('reset', this.addAll, this);
  },
  addOne: function(foobarItem){
    var foobarView = new FoobarView({model: foobarItem});
    this.$el.append(foobarView.render().el);
  },
  addAll: function(){
    this.collection.forEach(this.addOne, this);
  },
  render: function(){
    this.addAll();
  }
});

# Listen to add Event
var newFoobarItem = new FoobarItem({
  description: 'Take out trash',
  status: 'incomplete'
});
foobarList.add(newFoobarItem);

# Reset Event
var foobarList = new FoobarList();
var foobarListView = new FoobarList({
  collection: foobarList
});
foobarList.fetch(); # calls reset upon fetching

# Remove Event
foobarList.remove(foobarItem);

# Remove/Hide Event Sample Collection (Model)
initalize: function(){
  this.on('remove', this.hideModel);
}
hideModel: function(model){
  model.trigger('hide')
}

# Remove/Hide Event Sample View
initalize: function(){
  this.on('hide', this.remove, this);
}


# The Router
var router = new Backbone.Router({
  routes: { "foobars/:id": "show" }

  show: function(id) { ... }
})

# pushState on
Backbone.history.start({pushState: true});
router.navigate("foobars/1");

# Define router class
var FoobarRouter = Backbone.Router.extend({
  routes: { 
    "": "index",
    "foobars/:id": "show"
  },
  index: function(){
    this.foobarList.fetch();
  },
  show: function(id){
    this.foobarList.focusOnFoobarItem(id);
  },
  initialize: function(options){
    this.foobarList = options.foobarList;
  }
});

# Application Organization
var FoobarApp = new Backbone.Router.extend({
  routes: { "" : "index", "foobars/:id", "show" }),
  initialize: function(){
    this.foobarList = new FoobarList();
    this.foobarView = new FoobarView({collection: this.foobarListl});
    # $(".#app").append(this.foobarView/el);
    start: function(){
      Backbone.history.start({pushState: true});
    },
    index: function({
      this.foobarList.fetch();
    },
    show: function(id)
      this.foobarList.focusOnFoobarItem
    }
  }
}));

# Call to start using..
# $(function(){ FoobarApp.start) })


