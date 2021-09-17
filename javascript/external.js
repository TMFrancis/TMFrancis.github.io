// Task 1: document.write("Where is my JS code?");
// Task 2: window.alert(5+6);
// Task 3: document.write('<h1 style="color: #2c7bb6;">A heading</h1>');
// Task 3: document.write('<p>A sentence.</p>');
/* Task 3:
const x = "web";
const y = "mapping";
const out = x + y;
document.write(out);

// A prompt box is used to prompt users to input a value before entering a page
user_name = window.prompt("Please enter your name", "Type your name here");
document.write(user_name);
// there are many ways to use the prompt feature
sign = window.prompt();     // open the blank prompt window
sign = prompt();            // open the blank prompt window
sign = window.prompt('Are you feeling lucky');  // open w prompt text
sign = window.prompt('Are you feeling lucky', 'sure'); // open prompt w text
                                                       // and default value

x = 22;
const y = 33;
document.writeln(x + y);
document.writeln("<br>");
document.writeln(x += 33);
*/
document.writeln("<button onclick='condition()'>Conditional Test</button>")

function condition()
{
  x = confirm("Are you sure you want to proceed?");
  if(x)
  {
    document.writeln("You chose Okay!");
  }
  else
  {
    document.writeln("You chose Cancel!");
  }
}
