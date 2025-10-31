// adminCustomerManages.js
// Sidebar toggle, overlay, client-side search, UpdatePanel rebind support

(function () {
    'use strict';

    var BODY_CLASS = 'sidebar-open';
    var sidebarToggle, overlay, body, searchInput;

    function q(id) { return document.getElementById(id); }

    function openSidebar() {
        body.classList.add(BODY_CLASS);
        var first = document.querySelector('.sidebar .nav-item');
        if (first) first.focus();
    }
    function closeSidebar() {
        body.classList.remove(BODY_CLASS);
        if (sidebarToggle) sidebarToggle.focus();
    }
    function toggleSidebar(e) {
        if (e) e.preventDefault();
        if (body.classList.contains(BODY_CLASS)) closeSidebar(); else openSidebar();
    }
    function onKeyDown(e) {
        if (e.key === 'Escape' || e.key === 'Esc') closeSidebar();
    }

    function initElements() {
        body = document.body;
        sidebarToggle = q('sidebarToggle');
        overlay = document.querySelector('.sidebar-overlay');
        searchInput = q('customerSearch');

        if (!overlay) {
            overlay = document.createElement('div');
            overlay.className = 'sidebar-overlay';
            document.body.appendChild(overlay);
        }
    }

    function bindEvents() {
        if (sidebarToggle) sidebarToggle.addEventListener('click', toggleSidebar);
        if (overlay) overlay.addEventListener('click', closeSidebar);
        document.addEventListener('keydown', onKeyDown);

        if (searchInput) {
            var timer = null;
            searchInput.addEventListener('input', function () {
                clearTimeout(timer);
                timer = setTimeout(function () {
                    var qv = searchInput.value.trim().toLowerCase();
                    filterCustomers(qv);
                }, 280);
            });
        }

        window.addEventListener('resize', function () {
            if (window.innerWidth > 767) body.classList.remove(BODY_CLASS);
        });

        // delegate .view-detail clicks (example: open modal or navigate)
        document.addEventListener('click', function (ev) {
            var a = ev.target.closest && ev.target.closest('.view-detail');
            if (a) {
                // prevent default for demo. Implement navigation/modal as needed.
                ev.preventDefault();
                // Example: show alert (replace with modal)
                var tr = a.closest('.table-row');
                var name = tr ? (tr.querySelector('.customer-name') || {}).textContent : '';
                alert('Xem chi tiết: ' + (name || 'khách hàng'));
            }
        });
    }

    function filterCustomers(qv) {
        var rows = document.querySelectorAll('.data-table tbody .table-row');
        if (!rows) return;
        rows.forEach(function (tr) {
            var name = (tr.querySelector('.customer-name') || {}).textContent || '';
            var email = (tr.querySelector('.customer-email') || {}).textContent || '';
            var phone = (tr.querySelector('.customer-phone') || {}).textContent || '';
            var combined = (name + ' ' + email + ' ' + phone).toLowerCase();
            tr.style.display = (qv === '' || combined.indexOf(qv) !== -1) ? '' : 'none';
        });
    }

    function attachPartial() {
        try {
            if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
                var prm = Sys.WebForms.PageRequestManager.getInstance();
                prm.add_endRequest(function () {
                    initElements();
                    bindEvents();
                });
            }
        } catch (e) {/*ignore*/ }
    }

    function init() {
        initElements();
        bindEvents();
        attachPartial();
    }

    if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
    else init();

})();
