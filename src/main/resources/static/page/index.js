document.getElementById('sidebarToggle').addEventListener('click', function() {
    var sidebar = document.getElementById('sidebar');
    var mainPanels = document.querySelectorAll('.main-panel');

    sidebar.classList.toggle('active');
    mainPanels.forEach(function(panel) {
        panel.classList.toggle('shrunk');
    });
});

$(document).ready(function() {
    fetchInspectTableData();
    $('#formSubmit').click(function() {

        var formData = {
            apartName: $('input[name="apartmentName"]').val(),
            address: $('#address').val() + ' ' + $('#de_address').val(),
            customer_name: $('input[name="name"]').val(),
            inspection_date: $('input[name="inspectionDate"]').val(),
            area: $('input[name="area"]').val(),
            cus_phone: $('input[name="phone"]').val(),
            email: $('input[name="email"]').val(),
            status: 'pending'
        };
        console.log(JSON.stringify(formData))

        $.ajax({
            url: '/data/waitingApart',
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

    //assigning inspector
    $(document).on('change', 'select', function() {
        var waitingApartId = $(this).closest('tr').data('waitingApartId');
        var inspectorId = $(this).val();
        $.ajax({
            url: '/data/waiting-apart/assign-inspector',
            type: 'POST',
            data: { waitingApartId: waitingApartId, inspectorId: inspectorId },
            success: function() {
                console.log('Inspector assigned successfully');
                location.reload();
            },
            error: function(error) {
                console.error('Error assigning inspector:', error);
            }
        });
    });

});
function fetchInspectTableData() {
    $.ajax({
        url: '/data/waiting-apart-list',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            fetchInspectors().then(function(inspectors) {
                appendToTable(data, inspectors);
            });
        },
        error: function(error) {
            console.error('Error fetching data:', error);
        }
    });
}
function fetchInspectors() {
    return $.ajax({
        url: '/data/inspectors',
        type: 'GET',
        dataType: 'json'
    });
}
function appendToTable(data, inspectors) {
    var inspectTable = $('#inspectTable');

    data.forEach(function(item) {
        var row = $('<tr>').data('waitingApartId', item.id);
        row.append($('<td>').text(item.id));
        row.append($('<td>').text(item.register_date));
        row.append($('<td>').text(item.inspection_date));
        row.append($('<td>').text(item.customer_name));
        row.append($('<td>').text(item.apartName));
        row.append($('<td>').text(item.address));
        row.append($('<td>').text(item.cus_phone));
        row.append($('<td>').text(item.email));
        var statusCell = $('<td>');
        switch (item.status) {
            case 'pending':
                statusCell.text('대기');
                break;
            case 'progress':
                statusCell.text('진행');
                break;
            case 'complete':
                statusCell.text('완료');
                break;
            case 'final':
                var viewReportButton = $('<button>', {
                    text: '리포트생성 완료',
                    click: function() {
                        viewReport(item.id);
                    }
                });
                statusCell.append(viewReportButton);
                break;
            default:
                statusCell.text('N/A');
        }

        row.append(statusCell);
        var inspectorCell = $('<td>');
        if (item.loginInspector) {
            inspectorCell.text(item.loginInspector.username);
        } else {
            var select = $('<select>');
            select.append($('<option>').val('').text('담당자 정하기'));
            inspectors.forEach(function(inspector) {
                select.append($('<option>').val(inspector.id).text(inspector.username));
            });
            inspectorCell.append(select);
        }
        row.append(inspectorCell);
        inspectTable.append(row);
    });
    function viewReport(waitingApartId) {
        window.open('/data/reports/waitingApart/' + waitingApartId + '/view', '_blank');
    }


}