using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using TechShop.App_Code.Models;

namespace TechShop
{
    public partial class AddOrEditProduct : Page
    {
        protected int? EditingId => int.TryParse(Request.QueryString["id"], out int v) ? (int?)v : null;

        protected void Page_Init(object sender, EventArgs e)
        {
            // Register jquery mapping if needed
            try
            {
                var existing = System.Web.UI.ScriptManager.ScriptResourceMapping.GetDefinition("jquery");
                if (existing == null)
                {
                    System.Web.UI.ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new System.Web.UI.ScriptResourceDefinition
                    {
                        Path = "~/Scripts/jquery-3.6.0.min.js",
                        DebugPath = "~/Scripts/jquery-3.6.0.js",
                        CdnPath = "https://code.jquery.com/jquery-3.6.0.min.js",
                        CdnDebugPath = "https://code.jquery.com/jquery-3.6.0.js"
                    });
                }
            }
            catch { }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (EditingId.HasValue)
                {
                    // Edit mode
                    LoadProductForEdit(EditingId.Value);
                    btnDelete.Visible = true;
                }
                else
                {
                    btnDelete.Visible = false;
                }

                // prepare preview initial values
                PrepareInitialPreview();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        private void LoadProductForEdit(int id)
        {
            var products = Application["Products"] as List<TechShop.App_Code.Models.Products> ?? new List<TechShop.App_Code.Models.Products>();
            var p = products.FirstOrDefault(x => x.id == id);
            if (p == null)
            {
                Response.Redirect("AdminProduct.aspx");
                return;
            }

            txtName.Text = p.productName ?? "";
            txtImageUrl.Text = p.imageUrl ?? "";
            txtPrice.Text = p.value.ToString("N0");
            txtColor.Text = p.color ?? "";
            txtCapacity.Text = p.capacity.ToString();
            txtQuantity.Text = p.quantity.ToString();
            txtDescribe.Text = p.describe ?? "";
            txtSpecification.Text = p.specification ?? "";
        }

        private void PrepareInitialPreview()
        {
            string img = "";
            string title = "";
            string price = "0₫";
            string stock = "0";
            string sold = "0";

            if (EditingId.HasValue)
            {
                var products = Application["Products"] as List<TechShop.App_Code.Models.Products> ?? new List<TechShop.App_Code.Models.Products>();
                var p = products.FirstOrDefault(x => x.id == EditingId.Value);
                if (p != null)
                {
                    // imageUrl trong dữ liệu nếu là đường dẫn server (~/Uploads/...) -> ResolveUrl
                    img = string.IsNullOrEmpty(p.imageUrl) ? "" : ResolveUrl(p.imageUrl);
                    title = p.productName ?? "";
                    price = (p.value).ToString("N0") + "₫";
                    stock = p.capacity.ToString();
                    sold = p.quantity.ToString();
                }
            }

            var script = $@"
                window.__INITIAL_PREVIEW = {{
                  img: '{HttpUtility.JavaScriptStringEncode(img)}',
                  title: '{HttpUtility.JavaScriptStringEncode(title)}',
                  price: '{HttpUtility.JavaScriptStringEncode(price)}',
                  stock: '{HttpUtility.JavaScriptStringEncode(stock)}',
                  sold: '{HttpUtility.JavaScriptStringEncode(sold)}'
                }};
            ";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "initPreview", script, true);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminProduct.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (!EditingId.HasValue) return;

            var products = Application["Products"] as List<TechShop.App_Code.Models.Products> ?? new List<TechShop.App_Code.Models.Products>();
            var existing = products.FirstOrDefault(x => x.id == EditingId.Value);
            if (existing != null)
            {
                try
                {
                    Application.Lock();
                    products.Remove(existing);
                    Application["Products"] = products;
                }
                finally
                {
                    Application.UnLock();
                }
            }

            Response.Redirect("AdminProduct.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            try
            {
                var products = Application["Products"] as List<TechShop.App_Code.Models.Products> ?? new List<TechShop.App_Code.Models.Products>();

                var name = (txtName.Text ?? "").Trim();
                var color = (txtColor.Text ?? "").Trim();
                var describe = (txtDescribe.Text ?? "").Trim();
                var specification = (txtSpecification.Text ?? "").Trim();

                var priceRaw = (txtPrice.Text ?? "").Trim().Replace(",", "");
                float price = 0f;
                float.TryParse(priceRaw, out price);

                int capacity = 0;
                int.TryParse((txtCapacity.Text ?? "").Trim(), out capacity);

                int quantity = 0;
                int.TryParse((txtQuantity.Text ?? "").Trim(), out quantity);

                // XỬ LÝ ẢNH: ưu tiên fuImage upload
                string imageUrl = (txtImageUrl.Text ?? "").Trim();

                // Nếu có file upload -> lưu file
                if (fuImage.HasFile)
                {
                    try
                    {
                        imageUrl = SavePostedFileToUploads(fuImage.FileName, fuImage.PostedFile.InputStream);
                    }
                    catch (Exception ex)
                    {
                        ValidationSummary1.HeaderText = "Lỗi khi lưu file ảnh: " + ex.Message;
                        return;
                    }
                }
                else if (!string.IsNullOrEmpty(imageUrl))
                {
                    // Kiểm tra xem người dùng có nhập đường dẫn local (C:\ hoặc file://) hay không
                    bool looksLikeLocalPath = IsLocalPathString(imageUrl);

                    if (looksLikeLocalPath)
                    {
                        // Server không thể truy cập file cục bộ của client -> bắt người dùng upload
                        ValidationSummary1.HeaderText = "Không chấp nhận đường dẫn ảnh cục bộ (ví dụ C:\\...). Vui lòng dùng nút 'Chọn file' để upload ảnh từ máy.";
                        return;
                    }

                    // Nếu là URL http/https -> cố gắng tải về và lưu vào ~/Uploads/
                    if (Uri.TryCreate(imageUrl, UriKind.Absolute, out Uri uri) && (uri.Scheme == Uri.UriSchemeHttp || uri.Scheme == Uri.UriSchemeHttps))
                    {
                        try
                        {
                            using (var wc = new WebClient())
                            {
                                byte[] data = wc.DownloadData(imageUrl);

                                var ext = Path.GetExtension(uri.LocalPath);
                                if (string.IsNullOrEmpty(ext) || ext.Length > 5) ext = ".jpg"; // fallback
                                var safeName = $"{DateTime.Now:yyyyMMddHHmmss}_{Path.GetFileNameWithoutExtension(Path.GetRandomFileName())}{ext}";
                                var uploadsFolder = Server.MapPath("~/Uploads/");
                                if (!Directory.Exists(uploadsFolder)) Directory.CreateDirectory(uploadsFolder);
                                var savePath = Path.Combine(uploadsFolder, safeName);
                                File.WriteAllBytes(savePath, data);

                                imageUrl = ResolveUrl($"~/Uploads/{safeName}");
                            }
                        }
                        catch (Exception ex)
                        {
                            ValidationSummary1.HeaderText = "Không thể tải ảnh từ URL đã cung cấp: " + ex.Message;
                            return;
                        }
                    }
                    else
                    {
                        // Không phải URL hợp lệ -> từ chối ghi trực tiếp chuỗi (tránh lưu đường dẫn cục bộ)
                        ValidationSummary1.HeaderText = "Đường dẫn ảnh không hợp lệ. Vui lòng upload ảnh hoặc nhập URL http/https hợp lệ.";
                        return;
                    }
                }
                else
                {
                    // Không có ảnh => để trống hoặc giữ ảnh cũ khi edit (xử lý phía cập nhật bên dưới)
                    imageUrl = "";
                }

                Application.Lock();
                try
                {
                    if (EditingId.HasValue)
                    {
                        var id = EditingId.Value;
                        var existing = products.FirstOrDefault(x => x.id == id);
                        if (existing != null)
                        {
                            existing.productName = name;
                            // Nếu imageUrl rỗng giữ nguyên image cũ (nếu muốn), còn nếu có giá trị mới thì cập nhật
                            if (!string.IsNullOrEmpty(imageUrl))
                                existing.imageUrl = imageUrl;
                            existing.value = price;
                            existing.color = color;
                            existing.capacity = capacity;
                            existing.quantity = quantity;
                            existing.describe = describe;
                            existing.specification = specification;
                            if (existing.rateList == null) existing.rateList = new List<Rates>();
                        }
                    }
                    else
                    {
                        int newId = 1;
                        if (products.Any()) newId = products.Max(x => x.id) + 1;

                        var newProduct = new TechShop.App_Code.Models.Products
                        {
                            id = newId,
                            productName = name,
                            imageUrl = imageUrl,
                            value = price,
                            color = color,
                            capacity = capacity,
                            quantity = quantity,
                            describe = describe,
                            specification = specification,
                            rateList = new List<Rates>()
                        };
                        products.Add(newProduct);
                    }

                    Application["Products"] = products;
                }
                finally
                {
                    Application.UnLock();
                }

                Response.Redirect("AdminProduct.aspx");
            }
            catch (Exception ex)
            {
                ValidationSummary1.HeaderText = "Lỗi khi lưu sản phẩm: " + ex.Message;
            }
        }

        /// <summary>
        /// Lưu stream file upload vào ~/Uploads/ và trả về đường dẫn ResolveUrl (ví dụ ~/Uploads/xxxx.jpg)
        /// </summary>
        private string SavePostedFileToUploads(string originalFileName, System.IO.Stream inputStream)
        {
            var ext = Path.GetExtension(originalFileName);
            if (string.IsNullOrEmpty(ext)) ext = ".jpg";
            var safeName = $"{DateTime.Now:yyyyMMddHHmmss}_{Path.GetFileName(originalFileName)}";
            var uploadsFolder = Server.MapPath("~/Uploads/");
            if (!Directory.Exists(uploadsFolder)) Directory.CreateDirectory(uploadsFolder);
            var savePath = Path.Combine(uploadsFolder, safeName);

            // Lưu stream
            using (var fs = new FileStream(savePath, FileMode.Create, FileAccess.Write))
            {
                inputStream.CopyTo(fs);
            }

            return ResolveUrl($"~/Uploads/{safeName}");
        }

        /// <summary>
        /// Kiểm tra chuỗi có khả năng là đường dẫn cục bộ của Windows (C:\...) hoặc file://
        /// </summary>
        private bool IsLocalPathString(string s)
        {
            if (string.IsNullOrEmpty(s)) return false;
            s = s.Trim();

            // file://
            if (s.StartsWith("file://", StringComparison.OrdinalIgnoreCase)) return true;

            // C:\ or D:\  (Windows absolute)
            if (s.Length >= 2 && char.IsLetter(s[0]) && s[1] == ':') return true;

            // UNC path \\server\share
            if (s.StartsWith(@"\\") || s.StartsWith("//")) return true;

            // Path rooted on server side would return true, nhưng ta muốn phát hiện chuỗi local client
            try
            {
                if (Path.IsPathRooted(s) && (s.Contains(":\\") || s.StartsWith("\\\\"))) return true;
            }
            catch { }

            return false;
        }
    }
}
