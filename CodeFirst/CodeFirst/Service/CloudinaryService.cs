using CloudinaryDotNet;
using CloudinaryDotNet.Actions;
using Microsoft.AspNetCore.Components.Forms;

namespace CodeFirst.Service
{
    public class CloudinaryService
    {
        private readonly Cloudinary _cloudinary;

        public CloudinaryService(Cloudinary cloudinary)
        {
            _cloudinary = cloudinary;
        }
        public async Task<string> UploadImageByString(string imageUrl)
        {
            try
            {
                if (string.IsNullOrEmpty(imageUrl))
                {
                    throw new ArgumentException("Đường dẫn hình ảnh không hợp lệ.");
                }

                // Lấy đường dẫn tuyệt đối của thư mục gốc
                string rootPath = Directory.GetCurrentDirectory();
                string absolutePath = Path.Combine(rootPath, "wwwroot", imageUrl.TrimStart('/'));

                var uploadParams = new ImageUploadParams
                {
                    File = new FileDescription(absolutePath),
                };

                var uploadResult = await _cloudinary.UploadAsync(uploadParams);

                if (uploadResult.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    // Trả về đường dẫn tới ảnh đã tải lên
                    return uploadResult.SecureUri.AbsoluteUri;
                }
                else
                {
                    throw new Exception("Failed to upload image to Cloudinary.");
                }
            }
            catch (Exception ex)
            {
                // Xử lý lỗi tải ảnh lên Cloudinary
                Console.WriteLine("Error uploading image to Cloudinary: " + ex.Message);
                return null;
            }
        }

        public async Task<string> UploadImageAsyncBlazor(IBrowserFile imageFile)
        {
            try
            {
                if (imageFile == null)
                {
                    throw new ArgumentException("Không có hình ảnh hoặc ảnh không tồn tại.");
                }

                using (var memoryStream = new MemoryStream())
                {
                    await imageFile.OpenReadStream(maxAllowedSize: 1024 * 300000).CopyToAsync(memoryStream);
                    memoryStream.Position = 0; // Đảm bảo vị trí đọc của MemoryStream được đặt lại về đầu

                    var fileDescription = new FileDescription(imageFile.Name, memoryStream);

                    var uploadParams = new ImageUploadParams
                    {
                        File = fileDescription,
                    };

                    // Tải ảnh lên Cloudinary
                    var uploadResult = await _cloudinary.UploadAsync(uploadParams);

                    if (uploadResult.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        // Trả về đường dẫn tới ảnh đã tải lên
                        return uploadResult.SecureUri.AbsoluteUri;
                    }
                    else
                    {
                        throw new Exception("Failed to upload image to Cloudinary.");
                    }
                }
            }
            catch (Exception ex)
            {
                // Xử lý lỗi tải ảnh lên Cloudinary
                Console.WriteLine("Error uploading image to Cloudinary: " + ex.Message);
                return null;
            }
        }




        public async Task<string> UploadImageAsync(IFormFile imageFile)
        {
            try
            {
                if (imageFile == null || imageFile.Length == 0)
                {
                    throw new ArgumentException("Không có hình ảnh hoặc ảnh không tồn tại.");
                }

                using (var stream = imageFile.OpenReadStream())
                {
                    var uploadParams = new ImageUploadParams
                    {
                        File = new FileDescription(imageFile.FileName, stream),
                    };

                    var uploadResult = await _cloudinary.UploadAsync(uploadParams);

                    if (uploadResult.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        // Trả về đường dẫn tới ảnh đã tải lên
                        return uploadResult.SecureUri.AbsoluteUri;
                    }
                    else
                    {
                        throw new Exception("Failed to upload image to Cloudinary.");
                    }
                }
            }
            catch (Exception ex)
            {
                // Xử lý lỗi tải ảnh lên Cloudinary
                Console.WriteLine("Error uploading image to Cloudinary: " + ex.Message);
                return null;
            }
        }
    }
}
