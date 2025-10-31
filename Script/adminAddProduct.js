// adminAddProduct.js (robust for WebForms)
// Uses window.__CLIENT_IDS and window.__INITIAL_PREVIEW injected by server

(function () {
    if (typeof window === 'undefined') return;

    var CID = window.__CLIENT_IDS || {};
    function byId(name) {
        if (!name) return null;
        var id = CID[name] || name;
        return document.getElementById(id);
    }

    function formatNumber(n) {
        if (n == null) return '0';
        var s = ('' + n).replace(/[^\d.-]/g, '');
        if (s === '') return '0';
        return Number(s).toLocaleString('en-US');
    }

    document.addEventListener('DOMContentLoaded', function () {
        var fu = byId('fuImage');
        var txtImageUrl = byId('txtImageUrl');
        var txtName = byId('txtName');
        var txtPrice = byId('txtPrice');
        var txtCapacity = byId('txtCapacity');
        var txtQuantity = byId('txtQuantity');

        var previewImg = document.getElementById((CID.previewImage) || 'previewImage');
        var previewTitle = document.getElementById((CID.previewTitle) || 'previewTitle');
        var previewPrice = document.getElementById((CID.previewPrice) || 'previewPrice');
        var previewStock = document.getElementById((CID.previewStock) || 'previewStock');
        var previewSold = document.getElementById((CID.previewSold) || 'previewSold');

        function safeSet(el, text) { if (!el) return; el.textContent = text; }

        function updateTitle() {
            safeSet(previewTitle, (txtName && txtName.value.trim()) || (window.__INITIAL_PREVIEW && window.__INITIAL_PREVIEW.title) || 'Tên sản phẩm');
        }
        function updatePrice() {
            if (!previewPrice) return;
            var v = (txtPrice && txtPrice.value) || '';
            v = v.trim();
            if (!v) {
                safeSet(previewPrice, (window.__INITIAL_PREVIEW && window.__INITIAL_PREVIEW.price) || '0₫');
                return;
            }
            var cleaned = v.replace(/[^\d.]/g, '');
            safeSet(previewPrice, formatNumber(cleaned) + '₫');
        }
        function updateStockSold() {
            safeSet(previewStock, (txtCapacity && txtCapacity.value) || (window.__INITIAL_PREVIEW && window.__INITIAL_PREVIEW.stock) || '0');
            safeSet(previewSold, (txtQuantity && txtQuantity.value) || (window.__INITIAL_PREVIEW && window.__INITIAL_PREVIEW.sold) || '0');
        }

        function updateImageFromUrl(url) {
            if (!previewImg) return;
            if (!url) { previewImg.src = ''; previewImg.style.objectFit = 'contain'; previewImg.alt = 'No image'; return; }
            previewImg.src = url;
            previewImg.style.objectFit = 'cover';
            previewImg.alt = 'Product image';
        }

        function handleFile(file) {
            if (!file) return;
            var fr = new FileReader();
            fr.onload = function (e) { updateImageFromUrl(e.target.result); };
            fr.readAsDataURL(file);
        }

        if (fu) fu.addEventListener('change', function (e) { var f = e.target.files && e.target.files[0]; if (f) handleFile(f); });
        if (txtImageUrl) txtImageUrl.addEventListener('input', function (e) { var v = e.target.value.trim(); if (v) updateImageFromUrl(v); else if (!(fu && fu.files && fu.files.length)) updateImageFromUrl((window.__INITIAL_PREVIEW && window.__INITIAL_PREVIEW.img) || ''); });
        if (txtName) txtName.addEventListener('input', updateTitle);
        if (txtPrice) txtPrice.addEventListener('input', function (e) { var raw = e.target.value.replace(/[^\d]/g, ''); if (raw === '') { e.target.value = ''; updatePrice(); return; } e.target.value = Number(raw).toLocaleString('en-US'); updatePrice(); });
        if (txtCapacity) txtCapacity.addEventListener('input', updateStockSold);
        if (txtQuantity) txtQuantity.addEventListener('input', updateStockSold);

        (function init() {
            if (window.__INITIAL_PREVIEW) {
                var ip = window.__INITIAL_PREVIEW;
                safeSet(previewTitle, ip.title || 'Tên sản phẩm');
                safeSet(previewPrice, ip.price || '0₫');
                safeSet(previewStock, ip.stock || '0');
                safeSet(previewSold, ip.sold || '0');
                if (ip.img) updateImageFromUrl(ip.img);
            } else {
                updateTitle(); updatePrice(); updateStockSold();
                if (txtImageUrl && txtImageUrl.value.trim()) updateImageFromUrl(txtImageUrl.value.trim());
            }
        })();
    });
})();
