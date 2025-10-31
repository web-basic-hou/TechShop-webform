// adminAddProduct.js
(function () {
    'use strict';

    function q(id) { return document.getElementById(id); }
    var fu = q('<%= fuImage.ClientID %>');
    // but fu is server control — to keep script static, use selector by input[type=file]
    var fileInput = document.querySelector('input[type="file"]');
    var img = document.getElementById('imgPreview');
    var btnCancel = document.getElementById('<%= btnCancel.ClientID %>');

    // helper: read file and preview
    function previewFile(file) {
        if (!file) return;
        var reader = new FileReader();
        reader.onload = function (e) {
            img.src = e.target.result;
        };
        reader.readAsDataURL(file);
    }

    // wire events once DOM loaded
    document.addEventListener('DOMContentLoaded', function () {
        var input = document.querySelector('input[type="file"]');
        if (input) {
            input.addEventListener('change', function (e) {
                var file = input.files && input.files[0];
                if (file) {
                    // small client validation: size <=5MB and extension
                    var allowed = ['image/jpeg', 'image/png', 'image/webp'];
                    if (file.size > 5 * 1024 * 1024) {
                        alert('Ảnh quá lớn (tối đa 5MB).');
                        input.value = '';
                        return;
                    }
                    if (allowed.indexOf(file.type) === -1) {
                        // allow extension fallback
                        var ext = file.name.split('.').pop().toLowerCase();
                        if (['jpg', 'jpeg', 'png', 'webp'].indexOf(ext) === -1) {
                            alert('Định dạng ảnh không được hỗ trợ.');
                            input.value = '';
                            return;
                        }
                    }
                    previewFile(file);
                }
            });
        }

        // cancel resets preview (simple)
        var btnCancelServer = document.querySelector('input[id$="btnCancel"]') || document.getElementById('btnCancel');
        if (btnCancelServer) {
            btnCancelServer.addEventListener('click', function () {
                var placeholder = '<%= ResolveUrl("~/Images/placeholder.png") %>';
                if (img) img.src = placeholder;
            });
        }
    });
})();
