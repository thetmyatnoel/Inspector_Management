document.getElementById('sidebarToggle').addEventListener('click', function() {
    var sidebar = document.getElementById('sidebar');
    var mainPanels = document.querySelectorAll('.main-panel');

    sidebar.classList.toggle('active');
    mainPanels.forEach(function(panel) {
        panel.classList.toggle('shrunk');
    });
});
$(document).ready(function() {
    fetchInspectorTableData();
    $('#formSubmit').click(function() {

        var formData = {
            username: $('input[name="name"]').val(),
            password: $('input[name="phone"]').val(),
            email: $('input[name="email"]').val(),
        };
        console.log(JSON.stringify(formData))

        $.ajax({
            url: '/data/inspector',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(formData),
            success: function(response) {
                console.log('Form submitted successfully',response);
                location.reload();

            },
            error: function(xhr, status, error) {
                console.error('Error occurred: ' + error);
            }
        });
    });
});
function fetchInspectorTableData() {
    $.ajax({
        url: '/data/inspector-list',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            appendToTable(data);
        },
        error: function(error) {
            console.error('Error fetching data:', error);
        }
    });
}
function appendToTable(data) {
    var inspectorTable = $('#inspectorTable');

    data.forEach(function(item) {
        var row = $('<tr>');
        row.append($('<td>').text(item.id));
        row.append($('<td>').text(item.username));
        row.append($('<td>').text(item.workCount));
        row.append($('<td>').text(item.register_date));
        inspectorTable.append(row);
    });

}