$( document ).ready(function() {
    console.log( "ready!" );
    alert()
});

$("tr[data-link]").click(function() {
    window.location = this.data("link")
})
