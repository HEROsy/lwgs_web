function fh() {

    var ifm = document.getElementById("fc");

    var subWeb = document.frames ? document.frames["fc"].document :ifm.contentDocument;

    if (ifm != null && subWeb != null) {
        ifm.height = subWeb.body.scrollHeight;

    }

}