<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddOrEditProduct.aspx.cs" Inherits="TechShop.AddOrEditProduct" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Thêm / Sửa sản phẩm - TechShop Admin</title>

  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="<%= ResolveUrl("~/Styles/AddOrEditProduct.css") %>" />
</head>
<body>
  <form id="form1" runat="server">
    <div class="body_container">
      <!-- MAIN -->
      <div class="main-container">
        <header class="header">
          <div class="header-content">
            <h1 class="header-title">Thêm / Sửa Sản Phẩm</h1>
            <div class="user-info">
              <span class="welcome-text">Xin chào, <asp:Literal ID="litAdminName" runat="server" Text="Admin" /></span>
            </div>
          </div>
        </header>

        <main class="content-area">
          <div class="card panel">
            <!-- Validation -->
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="validation-summary" HeaderText="" />

            <div class="form-grid">
              <!-- LEFT: form fields -->
              <div>
                <div class="field">
                  <label for="txtName">Tên sản phẩm</label>
                  <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                  <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Tên sản phẩm bắt buộc." Display="Dynamic" />
                </div>

                <div class="field">
                  <label for="txtImageUrl">URL hình (hoặc upload bên dưới)</label>
                  <asp:TextBox ID="txtImageUrl" runat="server" CssClass="form-control" />
                  <div class="small-muted">Ví dụ: ~/Uploads/2025... hoặc /Uploads/...</div>
                </div>

                <div class="field">
                  <label for="fuImage">Upload hình (tùy chọn)</label>
                  <asp:FileUpload ID="fuImage" runat="server" />
                  <div class="small-muted">File sẽ lưu vào ~/Uploads/ và đường dẫn sẽ được ghi vào imageUrl.</div>
                </div>

                <div class="field">
                  <label for="txtPrice">Giá (VNĐ)</label>
                  <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" />
                </div>

                <div class="field">
                  <label for="txtColor">Màu</label>
                  <asp:TextBox ID="txtColor" runat="server" CssClass="form-control" />
                </div>

                <div class="field">
                  <label for="txtCapacity">Dung lượng / Tồn kho (capacity)</label>
                  <asp:TextBox ID="txtCapacity" runat="server" CssClass="form-control" />
                </div>

                <div class="field">
                  <label for="txtQuantity">Đã bán / Số lượng (quantity)</label>
                  <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" />
                </div>

                <div class="field">
                  <label for="txtDescribe">Mô tả ngắn</label>
                  <asp:TextBox ID="txtDescribe" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" />
                </div>

                <div class="field">
                  <label for="txtSpecification">Thông số kỹ thuật / chi tiết</label>
                  <asp:TextBox ID="txtSpecification" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" />
                </div>

                <div class="actions">
                  <asp:Button ID="btnSave" runat="server" Text="Lưu" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                  <asp:Button ID="btnCancel" runat="server" Text="Hủy" CssClass="btn btn-secondary" OnClick="btnCancel_Click" CausesValidation="False" />
                  <asp:Button ID="btnDelete" runat="server" Text="Xóa" CssClass="btn btn-danger" OnClick="btnDelete_Click" OnClientClick="return confirm('Bạn có chắc muốn xóa sản phẩm này?');" Visible="false" />
                </div>
              </div>

              <!-- RIGHT: preview -->
              <div class="preview panel" aria-live="polite">
                <h3>Xem trước sản phẩm</h3>
                <div id="previewCard">
                  <img id="previewImage" src="" alt="Hình sản phẩm" style="max-width:320px; max-height:320px; display:block; margin:0 auto 12px;" />
                  <div id="previewTitle" style="font-weight:700; margin-bottom:6px;">Tên sản phẩm</div>
                  <div id="previewPrice" style="font-size:1.1rem; margin-bottom:6px;">0₫</div>
                  <div class="small-muted">Tồn kho: <span id="previewStock">0</span></div>
                  <div class="small-muted">Đã bán: <span id="previewSold">0</span></div>
                </div>
              </div>
            </div>

            <!-- hidden fields / helpers -->
            <asp:HiddenField ID="hfProductId" runat="server" />

          </div>
        </main>
      </div>
    </div>
  </form>

  <script src="<%= ResolveUrl("~/Scripts/jquery-3.6.0.min.js") %>"></script>
  <script>
    // Khởi tạo preview dựa trên window.__INITIAL_PREVIEW (được server tạo)
    (function () {
      function setPreview(data) {
        if (!data) return;
        var img = data.img || '';
        var title = data.title || 'Tên sản phẩm';
        var price = data.price || '0₫';
        var stock = data.stock || '0';
        var sold = data.sold || '0';

        var $img = document.getElementById('previewImage');
        var $title = document.getElementById('previewTitle');
        var $price = document.getElementById('previewPrice');
        var $stock = document.getElementById('previewStock');
        var $sold = document.getElementById('previewSold');

        if (img) {
          $img.src = img;
          $img.style.display = '';
        } else {
          $img.src = '';
          $img.style.display = 'none';
        }
        $title.textContent = title;
        $price.textContent = price;
        $stock.textContent = stock;
        $sold.textContent = sold;
      }

      // set từ server (Page_Load) nếu có
      if (window.__INITIAL_PREVIEW) {
        setPreview(window.__INITIAL_PREVIEW);
      }

      // live update preview khi user thay đổi form
      function formatNumber(n) {
        if (!n) return '0₫';
        var num = n.replace(/,/g, '').trim();
        if (isNaN(num)) return n;
        return Number(num).toLocaleString('en-US') + '₫';
      }

      $('#txtName').on('input', function () {
        $('#previewTitle').text($(this).val() || 'Tên sản phẩm');
      });
      $('#txtPrice').on('input', function () {
        $('#previewPrice').text(formatNumber($(this).val()));
      });
      $('#txtImageUrl').on('input', function () {
        var v = $(this).val().trim();
        if (v) {
          $('#previewImage').attr('src', v).show();
        } else {
          $('#previewImage').hide();
        }
      });
      $('#txtCapacity').on('input', function () {
        $('#previewStock').text($(this).val() || '0');
      });
      $('#txtQuantity').on('input', function () {
        $('#previewSold').text($(this).val() || '0');
      });

      // khi upload file thành công (tại client trước khi submit, chỉ hiển thị thumbnail tạm nếu browser hỗ trợ)
      $('#<%= fuImage.ClientID %>').on('change', function (e) {
              var file = this.files && this.files[0];
              if (!file) return;
              var reader = new FileReader();
              reader.onload = function (ev) {
                  $('#previewImage').attr('src', ev.target.result).show();
              };
              reader.readAsDataURL(file);
          });
      })();
  </script>
</body>
</html>
