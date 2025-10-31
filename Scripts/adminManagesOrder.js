// adminManagesOrder.js
// - Sidebar toggle (mobile)
// - Overlay to close
// - Client-side search (filter by order id or customer name)
// - Rebind after partial postback (UpdatePanel) if present

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
        searchInput = q('orderSearch');

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

        // search filter (debounce)
        if (searchInput) {
            var timer = null;
            searchInput.addEventListener('input', function () {
                clearTimeout(timer);
                timer = setTimeout(function () {
                    var qv = searchInput.value.trim().toLowerCase();
                    filterOrders(qv);
                }, 250);
            });
        }

        // ensure sidebar closed on wide screens
        window.addEventListener('resize', function () {
            if (window.innerWidth > 767) body.classList.remove(BODY_CLASS);
        });
    }

    function filterOrders(qv) {
        var rows = document.querySelectorAll('.data-table tbody .table-row');
        if (!rows) return;
        rows.forEach(function (tr) {
            var id = tr.querySelector('.order-id') ? tr.querySelector('.order-id').textContent.toLowerCase() : '';
            var name = tr.querySelector('.customer-name') ? tr.querySelector('.customer-name').textContent.toLowerCase() : '';
            var txt = id + ' ' + name;
            tr.style.display = (qv === '' || txt.indexOf(qv) !== -1) ? '' : 'none';
        });
    }

    // rebind for UpdatePanel partial postback
    function attachPartial() {
        try {
            if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
                var prm = Sys.WebForms.PageRequestManager.getInstance();
                prm.add_endRequest(function () {
                    initElements();
                    bindEvents();
                });
            }
        } catch (e) { /* ignore if MS AJAX not present */ }
    }

    function init() {
        initElements();
        bindEvents();
        attachPartial();
    }

    if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
    else init();

})();
