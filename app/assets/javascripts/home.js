$(document).ready(loadChart);
$(document).on('page:load', loadChart);

function loadChart(){
  $.ajax({
    url: "home/graph_data",
    success: function(data){
      plotGraph(data);
    }
  });
}

var plotGraph = function (data){

    var chart;

    nv.addGraph(function() {
      chart = nv.models.lineChart()
      .options({
        margin: {left: 100, bottom: 100},
        x: function(d,i) {
          return i
        },
        showXAxis: true,
        showYAxis: true,
        transitionDuration: 250
      });

      // tickValues = ["FA1", "FA2", "SA1"];
      chart.xAxis
        .axisLabel("Tests")
        // .tickValues(tickValues)
        // .staggerLabels(true)
        // .tickFormat(function (val, i) { return tickValues[i] });

      chart.yAxis
        .axisLabel('Percentage (%)')
        .tickFormat(d3.format(',.2f'))
        ;

      d3.select('#chart svg')
        .datum(data)
        .call(chart);

      nv.utils.windowResize(chart.update);

      chart.dispatch.on('stateChange', function(e) { nv.log('New State:', JSON.stringify(e)); });

      return chart;
    });
  }

var redrawGraph = function (data){
  $("#chart svg").empty();
  plotGraph(data);
}