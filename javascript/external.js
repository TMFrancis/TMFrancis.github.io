// webmaps variable defines the data used by webmap_table function
var webmaps =
  [
    ["Strava Global Heat Map",
    "https://www.strava.com/heatmap#8.98/-72.28045/42.31237/hot/all",
    "Strava Global Heatmap is developed and maintained by Strava, Inc."
    ],
    ["Wandrer.earth",
    "https:/wandrer.earth/",
    "Wandrer.earth is developed and maintained by Craig Durkin."
    ]
  ];

// welcome prompt that asks user for name upon loading index.html
function welcome()
{
let a = "Please enter your name.";
let b = "Type your name here.";

// A prompt box is used to prompt users to input a value before entering the page.
user_name = window.prompt(a,b);

message = "<h1>Hello, welcome to my webpage " + user_name + "!</h1>";
return message
}

// the function which creates a table using webmaps variable declared above
function webmap_table()
{
  document.write("<table width=100%>");
  for (var row=0; row < webmaps.length; row++)
  {
    document.write("<tr>");
    for (var column=0; column < webmaps[0].length; column++)
    {
      if(row%2 > 0)
        {
          document.write("<td style='background-color: #ffffe0'>" + webmaps[row][column] + "</td>");
        } else {
          document.write("<td style='background-color: #ffff8a'>" + webmaps[row][column] + "</td>");
        }
    }
    document.write("</tr>");
  }
  document.write("</table>");
}

// function to calculate area of a rectangle used in <form>
function calculate_area(){
  var l = document.getElementById("rec_len").value;
  var w = document.getElementById("rec_wid").value;
  area = w * l;
  let answer = document.getElementById("demo").innerHTML = "The area of the rectangle is: " + area;
  }
