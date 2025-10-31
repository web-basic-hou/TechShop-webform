// adminProduct.js
// Responsive behaviors for AdminProduct.aspx:
// - sidebar toggle on mobile
// - overlay click close
// - confirm delete handler for .action-delete
// - client-side search debounce (demo)

(function () {
    'use strict';

    var BODY_CLASS = 'sidebar-open';
    var sidebarToggle, overlay, body;

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
        if (body.classList.contains(BODY_CLASS)) closeSidebar();
        else openSidebar();
    }

    function onKeyDown(e) {
        if (e.key === 'Escape' || e.key === 'Esc') {
            closeSidebar();
        }
    }

    function initElements() {
        body = document.body;
        sidebarToggle = q('sidebarToggle');
        overlay = document.querySelector('.sidebar-overlay');
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

        // delete confirm (delegate)
        document.addEventListener('click', function (ev) {
            var a = ev.target.closest && ev.target.closest('.action-delete');
            if (a) {
                ev.preventDefault();
                var ok = confirm('Bạn có chắc muốn xóa sản phẩm này?');
                if (ok) {
                    var href = a.getAttribute('href');
                    if (href && href !== '#') window.location.href = href;
                    else {
                        // If you want server postback, implement __doPostBack or AJAX here.
                        console.warn('Delete link has no href — implement server-side delete (postback/AJAX) here.');
                    }
                }
            }
        });

        // client-side search debounce + filter table
        var searchInput = q('searchInput');
        if (searchInput) {
            var timer = null;
            searchInput.addEventListener('input', function () {
                clearTimeout(timer);
                timer = setTimeout(function () {
                    var qv = searchInput.value.trim().toLowerCase();
                    filterTableBy(qv);
                }, 280);
            });
        }

        // close sidebar when resizing to desktop
        window.addEventListener('resize', function () {
            if (window.innerWidth > 767) {
                body.classList.remove(BODY_CLASS);
            }
        });
    }

    function filterTableBy(qv) {
        var rows = document.querySelectorAll('.data-table tbody .table-row');
        if (!rows) return;
        rows.forEach(function (tr) {
            var nameCell = tr.querySelector('.product-name');
            var txt = nameCell ? nameCell.textContent.toLowerCase() : '';
            tr.style.display = (txt.indexOf(qv) !== -1 || qv === '') ? '' : 'none';
        });
    }

    // Rebind after ASP.NET AJAX partial postback (UpdatePanel) if present
    function attachPartial() {
        try {
            if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
                var prm = Sys.WebForms.PageRequestManager.getInstance();
                prm.add_endRequest(function () {
                    initElements();
                    bindEvents();
                });
            }
        } catch (e) { /* ignore if not present */ }
    }

    function init() {
        initElements();
        bindEvents();
        attachPartial();
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();
