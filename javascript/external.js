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

function welcome()
{
let a = "Please enter your name.";
let b = "Type your name here.";

// A prompt box is used to prompt users to input a value before entering the page.
user_name = window.prompt(a,b);

message = "<h1>Hello, welcome to my webpage " + user_name + "!</h1>";
return message
}

function webmap_table()
{
  document.write("<table width=100%>");
  for (var row=0; row < webmaps.length; row++)
  {
    document.write("<tr>");
    for (var column=0; column < webmaps[0].length; column++)
    {
      document.write("<td>" + webmaps[row][column] + "</td>");
    }
    document.write("</tr>");
  }
  document.write("</table>");
}
