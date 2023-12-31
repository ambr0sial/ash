var sf = new Snowflakes({
    color: "#d054fa",
    count: 40
});

document.addEventListener("DOMContentLoaded", function () {
    var scriptLinks = document.querySelectorAll("#scripts a");

    scriptLinks.forEach(function (link) {
        link.setAttribute("target", "_blank");
    });
});

document.getElementById("dark-mode-toggle").addEventListener("click", function() {
    document.body.classList.toggle("dark-mode");
});