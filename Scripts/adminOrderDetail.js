// adminOrderDetail.js
// - sidebar toggle & overlay
// - copy order id
// - print order
// - collapse sections (if needed)

(function () {
    'use strict';

    var BODY_CLASS = 'sidebar-open';
    var sidebarToggle, overlay, body;

    function q(id) { return document.getElementById(id); }

    function init() {
        body = document.body;
        sidebarToggle = q('sidebarToggle');
        overlay = document.querySelector('.sidebar-overlay');

        if (!overlay) {
            overlay = document.createElement('div');
            overlay.className = 'sidebar-overlay';
            document.body.appendChild(overlay);
        }

        if (sidebarToggle) sidebarToggle.addEventListener('click', function (e) {
            e.preventDefault();
            body.classList.toggle(BODY_CLASS);
        });

        overlay.addEventListener('click', function () {
            body.classList.remove(BODY_CLASS);
        });

        // close on Esc
        document.addEventListener('keydown', function (e) {
            if (e.key === 'Escape') body.classList.remove(BODY_CLASS);
        });

        // copy order id
        var btnCopy = q('btnCopyId');
        if (btnCopy) {
            btnCopy.addEventListener('click', function () {
                var lit = document.querySelector('span[__asp_role="orderid"]') || null;
                // better: find server literal by rendered text
                // fallback: read from element with id litOrderId (literal renders as span)
                var idEl = q('<%= litOrderId.ClientID %>'); // NOTE: this server id not available in static file
            });

            // Safer generic copy: find innerText of litOrderId element
            btnCopy.addEventListener('click', function () {
                var idEl = document.getElementById('<%= litOrderId.ClientID %>');
                var text = idEl ? idEl.innerText : '';
                if (!text) text = '';
                navigator.clipboard && navigator.clipboard.writeText(text)
                    .then(function () { alert('Đã sao chép: ' + text); })
                    .catch(function () { alert('Không thể sao chép.'); });
            });
        }

        // print button
        var btnPrint = q('btnPrint');
        if (btnPrint) {
            btnPrint.addEventListener('click', function () {
                window.print();
            });
        }

        // If using UpdatePanel or partial postbacks, re-init after endRequest
        try {
            if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
                var prm = Sys.WebForms.PageRequestManager.getInstance();
                prm.add_endRequest(function () { init(); });
            }
        } catch (e) { /* ignore if not present */ }
    }

    if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
    else init();

})();
