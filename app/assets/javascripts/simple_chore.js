$(document).on('ready', function(){

    // General template function for running AJAX calls through Vue.JS
  run_ajax = function(method, data, link, callback){
    $.ajax({
      method: method,
      data: data,
      url: link,
      success: function(res) {
        callback(res);
        vm.$forceUpdate();
      },
      error: function(res) {
        that.errors = res.responseJSON.errors
      }
    })
  }

  var chore_row = Vue.component('chore-row', {
    // Defining where to look for the HTML template
    template: '#chore-row',

    // Passed elements to the component from the Vue instance
    props: {
      chore: Object,
      name: String,
      completed: Boolean
    },    
    // Behaviors associated with this component
    methods: {
      toggle_complete: function (chore){
        chore['completed'] = !(chore['completed']);
        run_ajax('PATCH', {simple_chore: chore}, '/simple_chores/'.concat(chore['id'], '.js'), function(res){vm.get_chores()});
      },
    }
  })

  var vm = new Vue({
    el: '#chores_list',
    data() {
      return {
        chores: []
      }
    },
    mounted: function(){
      this.get_chores();
    },
    methods: {
      get_chores: function(){
        run_ajax('GET', {}, '/simple_chores.json', function(res){vm.chores = res}.bind(this));
      },      
    } 
  })

})
