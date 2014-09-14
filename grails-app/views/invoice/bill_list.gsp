

<html>
<head>
    <meta name="layout" content="panels" />
    
    
<style>
		body {
			font: 10px sans-serif;
		}

		.bar rect:hover { 
				fill: grey;
		}

		.bar rect {
			fill: steelblue;
			shape-rendering: crispEdges;
		}

		.bar text {
			fill: #fff;
		}

		.axis path, .axis line {
			fill: none;
			stroke: #000;
			shape-rendering: crispEdges;
		}
</style>
    
</head>
<body>
    <content tag="column1">
        <p style="font-size: large; color: green;">Usages report</p>
   
   
   <div style="width: 1200px; height: auto; margin-left: 100px;">     
   		<script src="http://d3js.org/d3.v3.min.js"></script>
	
			<script>	

		// Generate a Bates distribution of 10 random variables.
		var values = d3.range(1000).map(d3.random.bates(10));

		// A formatter for counts.
		var formatCount = d3.format(",.0f");

		var margin = {top: 0, right: 30, bottom: 30, left: 100},
				width = 950 - margin.left - margin.right,
				height = 450 - margin.top - margin.bottom;

		var x = d3.scale.linear()
				.domain([0, 1])
				.range([0, width]);

		// Generate a histogram using twenty uniformly-spaced bins.
		var data = d3.layout.histogram()
				.bins(x.ticks(20))
				(values);

		var y = d3.scale.linear()
				.domain([0, d3.max(data, function(d) { return d.y; })])
				.range([height, 0]);

		var xAxis = d3.svg.axis()
				.scale(x)
				.orient("bottom");

		var svg = d3.select("body").append("svg")
				.attr("width", width + margin.left + margin.right)
				.attr("height", height + margin.top + margin.bottom)
			  .append("g")
				.attr("transform", "translate(" + margin.left + "," + margin.top + ")");

		var bar = svg.selectAll(".bar")
				.data(data)
			  .enter().append("g")
				.attr("class", "bar")
				.attr("transform", function(d) { return "translate(" + x(d.x) + "," + y(d.y) + ")"; });

		bar.append("rect")
				.attr("x", 1)
				.attr("width", x(data[0].dx) - 1)
				.attr("height", function(d) { return height - y(d.y); });

		bar.append("text")
				.attr("dy", ".75em")
				.attr("y", 6)
				.attr("x", x(data[0].dx) / 2)
				.attr("text-anchor", "middle")
				.text(function(d) { return formatCount(d.y); });

		svg.append("g")
				.attr("class", "x axis")
				.attr("transform", "translate(0," + height + ")")
				.call(xAxis);

		</script>
	</div>
</content>

   
</body>
</html>