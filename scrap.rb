# Reference for console commands:
# http://documentcloud.github.com/backbone/
#
# Commands incase Server won't run!
# rm <path_name>/server.pid
# ps aux | grep rails
# kill -9 <rails_pid>




# fetch() grabs the default set of models from the server
@collection.fetch()

# reset() replaces a collection with a new list of models (refreshes/updates collection)
@collection.reset()




// Works exactly like Backbone.Collection.
BackboneBlog.Collection.Posts()
  # url: "https://api.github.com/search/issues",

  state: { pageSize: 10 }

  queryParams: {
    totalPages: null
    totalRecords: null
    sortKey: "sort"
    # q: "state:closed repo:jashkenas/backbone"
  }

  parseState: (resp, queryParams, state, options) ->
    x = { totalRecords: resp.total_count}
    x 


  parseRecords: (resp, options) ->
    y = { resp.items; }
    y

var issues = new BackboneBlog();






# var log = function(txt) { $("div#log").append("<p>"+ ( typeof txt === 'string' ? txt : JSON.stringify(txt) ) +"</p>") };

var C = Backbone.Collection.extend({
    
    model: Backbone.Model,
    
    pagination : function(perPage, page) {
       page = page-1;
       var collection = this;
       collection = _(collection.rest(perPage*page));
       collection = _(collection.first(perPage));    
       return collection.map( function(model) { return model.toJSON() } ); 
    }
});
        
var c = new C([
    {name: 'one'},
    {name: 'two'},
    {name: 'three'},
    {name: 'four'},
    {name: 'five'},
    {name: 'six'},
    {name: 'seven'}]);

log("page 1");
log(c.pagination(3,1)); 
log("page 2");
log(c.pagination(3,2));
log("page 3");
log(c.pagination(3,3));   
