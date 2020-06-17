function open(event, tabName) {
    var i, tabcontent, tabbutton;
    tabcontent = document.getElementsByClassName("content");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tabbutton = document.getElementsByClassName("menu");
    for (i = 0; i < tablinks.length; i++) {
        tabbutton[i].className = tabbutton[i].className.replace(" active", "");
    }
    document.getElementById(tabName).style.display = "block";
    event.currentTarget.className += " active";
}
document.getElementById("default").click();