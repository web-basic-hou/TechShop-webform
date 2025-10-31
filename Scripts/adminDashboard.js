// adminDashboard.js
// Responsive sidebar toggle + accessibility + partial postback support

(function () {
    'use strict';

    // selectors (IDs are static in markup)
    var BODY_CLASS = 'sidebar-open';
    var sidebarToggle = null;
    var overlay = null;
    var body = document.body;

    function q(id) { return document.getElementById(id); }

    function openSidebar() {
        body.classList.add(BODY_CLASS);
        // focus first link in sidebar for keyboard users
        var firstLink = document.querySelector('.sidebar .nav-item');
        if (firstLink) firstLink.focus();
    }

    function closeSidebar() {
        if (body.classList.contains(BODY_CLASS)) {
            body.classList.remove(BODY_CLASS);
            // return focus to toggle button
            if (sidebarToggle) sidebarToggle.focus();
        }
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

        // close sidebar when clicking outside on wider screens (optional)
        window.addEventListener('resize', function () {
            if (window.innerWidth > 767) {
                // ensure sidebar is visible in desktop layout and class removed
                body.classList.remove(BODY_CLASS);
            }
        });
    }

    // If page uses ASP.NET AJAX UpdatePanel, rebind after partial requests
    function attachPartialPostbackHandler() {
        try {
            if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
                var prm = Sys.WebForms.PageRequestManager.getInstance();
                prm.add_endRequest(function () {
                    // re-init (elements may be re-rendered)
                    initElements();
                    // unbind then bind to avoid duplicate handlers (simple approach)
                    bindEvents();
                });
            }
        } catch (e) {
            // ignore if Sys not present
        }
    }

    // public init
    function init() {
        initElements();
        bindEvents();
        attachPartialPostbackHandler();
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();
