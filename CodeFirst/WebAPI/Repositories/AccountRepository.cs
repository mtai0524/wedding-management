using CodeFirst.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.IdentityModel.Tokens;
using WebAPI.Models;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Web.Http.ModelBinding;
using CloudinaryDotNet;
using CodeFirst.Service;
using CloudinaryDotNet.Actions;

namespace WebAPI.Repositories
{
    public class AccountRepository : IAccountRepository
    {
        private readonly UserManager<ApplicationUser> userManager;
        private readonly SignInManager<ApplicationUser> signInManager;
        private readonly IConfiguration configuration;
        private readonly CloudinaryService _cloud;


        public AccountRepository(UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager, IConfiguration configuration, CloudinaryService cloud)
        {
            this.userManager = userManager;
            this.signInManager = signInManager;
            this.configuration = configuration;
            this._cloud = cloud;
        }

        public async Task<string> SignInAsync(SignInModel model) // đăng nhập
        {
            var result = await signInManager.PasswordSignInAsync(model.Email, model.Password, false, false);

            if (!result.Succeeded)
            {
                return string.Empty;
            }

            var user = await userManager.FindByEmailAsync(model.Email);

            if (user == null)
            {
                // Xử lý lỗi nếu không tìm thấy người dùng
                return string.Empty;
            }

            // Lấy FirstName từ thông tin người dùng
            var userId = user.Id;
            var firstName = user.FirstName;
            var lastName = user.LastName;
            var avatar = user.Avatar;
            var phone = user.PhoneNumber;
            // Thêm thông tin username và email vào danh sách claims
            var authClaims = new List<Claim> // jwt.io
            {
                new Claim(ClaimTypes.NameIdentifier, userId),
                new Claim(ClaimTypes.Email, model.Email),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                new Claim(ClaimTypes.Name, firstName),
                new Claim(ClaimTypes.Surname, lastName),
                new Claim(ClaimTypes.Country, avatar),
            };


            if (!string.IsNullOrEmpty(phone))
            {
                // Chỉ thêm Claim cho số điện thoại nếu nó không null hoặc rỗng
                authClaims.Add(new Claim(ClaimTypes.MobilePhone, phone));
            }

            var authenKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(configuration["JWT:Secret"]));

            var token = new JwtSecurityToken(
                issuer: configuration["JWT:ValidIssuer"],
                audience: configuration["JWT:ValidAudience"],
                expires: DateTime.Now.AddMinutes(20),
                claims: authClaims,
                signingCredentials: new SigningCredentials(authenKey, SecurityAlgorithms.HmacSha512Signature)
            );

            return new JwtSecurityTokenHandler().WriteToken(token);
        }


        public async Task<IdentityResult> SignUpAsync(SignUpModel model) // đăng kí
        {
            if (model.Password != model.ConfirmPassword)
            {
                // Xử lý khi mật khẩu và xác nhận mật khẩu không khớp
                return IdentityResult.Failed(new IdentityError { Description = "Password and confirmation password do not match." });
            }

            var user = new ApplicationUser
            {
                FirstName = model.FirstName,
                LastName = model.LastName,
                Email = model.Email,
                UserName = model.Email,
                PhoneNumber = model.PhoneNumber
            };
            user.EmailConfirmed = true;

            // Khởi tạo Cloudinary
            Account account = new Account(
                "dl3hvap4a",
                "834354428788744",
                "lv7zI6VPru0YhHwUPQsru318SOE"
            );
            Cloudinary cloudinary = new Cloudinary(account);
            string imageFormat = "";
            if (model.Avatar.Contains("data:image/jpeg;base64,"))
            {
                imageFormat = "data:image/jpeg;base64,";
            }
            else if (model.Avatar.Contains("data:image/png;base64,"))
            {
                imageFormat = "data:image/png;base64,";
            }
            var base64Image = model.Avatar.Replace(imageFormat, "");

            // Giải mã chuỗi base64 thành mảng byte
            var imageBytes = Convert.FromBase64String(base64Image);

            // Tạo MemoryStream từ mảng byte
            var imageStream = new MemoryStream(imageBytes);

            // Tải lên hình ảnh lên Cloudinary
            var uploadParams = new ImageUploadParams()
            {
                File = new FileDescription("avatar", imageStream)
            };
            var uploadResult = cloudinary.Upload(uploadParams);

            // Lấy URL của hình ảnh từ kết quả tải lên
            user.Avatar = uploadResult.SecureUri.ToString();

            var result = await userManager.CreateAsync(user, model.Password);

            if (result.Succeeded)
            {
                // Gán quyền mặc định cho user khi đăng kí bên react
                await userManager.AddToRoleAsync(user, "user");
            }

            return result;
        }
    }
}