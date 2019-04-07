<script src="./resources/jquery-3.1.0.min.js" type="text/javascript"></script>
<script src="./resources/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="./resources/Chart.js" type="text/javascript"></script>
<script>
    $(document).ready(function () {
        
        $('#datatable').dataTable();
    });
    
    
    // Get the Sidebar
    var mySidebar = document.getElementById("mySidebar");

    // Get the DIV with overlay effect
    var overlayBg = document.getElementById("myOverlay");

    // Toggle between showing and hiding the sidebar, and add overlay effect
    function w3_open() {
        if (mySidebar.style.display === 'block') {
            mySidebar.style.display = 'none';
            overlayBg.style.display = "none";
        } else {
            mySidebar.style.display = 'block';
            overlayBg.style.display = "block";
        }
    }

    // Close the sidebar with the close button
    function w3_close() {
        mySidebar.style.display = "none";
        overlayBg.style.display = "none";
    }

</script>
