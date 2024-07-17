using CloudinaryDotNet;
using CloudinaryDotNet.Actions;
using Microsoft.AspNetCore.Components.Forms;

namespace CodeFirst.Service
{
    public class CloudinaryService
    {
        private readonly Cloudinary _cloudinary;

        public CloudinaryService()
        {
            // Cấu hình trực tiếp thông tin tài khoản Cloudinary
            Account account = new Account(
                "dl3hvap4a",
                "834354428788744",
                "lv7zI6VPru0YhHwUPQsru318SOE");

            _cloudinary = new Cloudinary(account);
        }
        public async Task<string> UploadImageByString(string imageUrl)
        {
            try
            {
                if (string.IsNullOrEmpty(imageUrl))
                {
                    throw new ArgumentException("Đường dẫn hình ảnh không hợp lệ.");
                }

                string rootPath = Directory.GetCurrentDirectory();
                string absolutePath = Path.Combine(rootPath, "wwwroot", imageUrl.TrimStart('/'));

                var uploadParams = new ImageUploadParams
                {
                    File = new FileDescription(absolutePath),
                };

                var uploadResult = await _cloudinary.UploadAsync(uploadParams);

                if (uploadResult.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    return uploadResult.SecureUri.AbsoluteUri;
                }
                else
                {
                    throw new Exception("Failed to upload image to Cloudinary.");
                }
            }
            catch (Exception ex)
            {
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
                    memoryStream.Position = 0;

                    var fileDescription = new FileDescription(imageFile.Name, memoryStream);

                    var uploadParams = new ImageUploadParams
                    {
                        File = fileDescription,
                    };

                    var uploadResult = await _cloudinary.UploadAsync(uploadParams);

                    if (uploadResult.StatusCode == System.Net.HttpStatusCode.OK)
                    {
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
                Console.WriteLine("Error uploading image to Cloudinary: " + ex.Message);
                return null;
            }
        }


        public async Task<string> UploadImageAsyncStream(MemoryStream imageStream)
        {
            try
            {
                if (imageStream == null || imageStream.Length == 0)
                {
                    throw new ArgumentException("Không có hình ảnh hoặc ảnh không tồn tại.");
                }

                // Đặt lại vị trí đầu của stream để đảm bảo rằng toàn bộ nội dung được đọc
                imageStream.Position = 0;

                var uploadParams = new ImageUploadParams
                {
                    File = new FileDescription("uploaded_image.jpg", imageStream),
                };

                var uploadResult = await _cloudinary.UploadAsync(uploadParams);

                if (uploadResult.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    return uploadResult.SecureUri.AbsoluteUri;
                }
                else
                {
                    throw new Exception("Failed to upload image to Cloudinary.");
                }
            }
            catch (Exception ex)
            {
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
                Console.WriteLine("Error uploading image to Cloudinary: " + ex.Message);
                return null;
            }
        }
    }
}
