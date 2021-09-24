// code to write dynamic copyright to HTML doc
// assign default date format for current time using new Date()
var today = new Date();
// assign the four digit year to year using getFullYear() method
var year = today.getFullYear();
// write copyright string to page using HTML symbol entity and year variable
document.writeln("Copyright &copy; " + year);
