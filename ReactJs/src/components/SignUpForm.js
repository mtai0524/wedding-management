import React, { useState } from 'react';

function SignUpForm() {
  const [formData, setFormData] = useState({
    firstName: '',
    lastName: '',
    email: '',
    password: '',
    confirmPassword: '',
    avatar: '', // Thêm trường avatar
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      const response = await fetch('https://localhost:7296/api/account/SignUp', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(formData),
      });

      if (response.ok) {
        console.log('Đăng ký thành công.');
        // Xử lý sau khi đăng ký thành công, ví dụ: chuyển hướng người dùng hoặc hiển thị thông báo
      } else {
        console.error('Lỗi khi đăng ký.');
        // Xử lý khi đăng ký thất bại
      }
    } catch (error) {
      console.error('Lỗi khi đăng ký:', error);
      // Xử lý khi xảy ra lỗi
    }
  };

  return (
    <div>
      <h2>Đăng ký</h2>
      <form onSubmit={handleSubmit}>
        {/* Các trường form đăng ký */}
        <div>
          <label htmlFor="firstName">Họ:</label>
          <input type="text" name="firstName" id="firstName" value={formData.firstName} onChange={handleChange} />
        </div>
        <div>
          <label htmlFor="lastName">Tên:</label>
          <input type="text" name="lastName" id="lastName" value={formData.lastName} onChange={handleChange} />
        </div>
        <div>
          <label htmlFor="email">Email:</label>
          <input type="email" name="email" id="email" value={formData.email} onChange={handleChange} />
        </div>
        <div>
          <label htmlFor="password">Mật khẩu:</label>
          <input type="password" name="password" id="password" value={formData.password} onChange={handleChange} />
        </div>
        <div>
          <label htmlFor="confirmPassword">Xác nhận mật khẩu:</label>
          <input type="password" name="confirmPassword" id="confirmPassword" value={formData.confirmPassword} onChange={handleChange} />
        </div>
        <div>
          <label htmlFor="avatar">Avatar:</label>
          <input type="text" name="avatar" id="avatar" value={formData.avatar} onChange={handleChange} />
        </div>
        <button type="submit">Đăng ký</button>
      </form>
    </div>
  );
}

export default SignUpForm;
