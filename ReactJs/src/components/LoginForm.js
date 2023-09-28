import Cookies from 'js-cookie';
import React, { useState } from 'react';

function LoginForm() {
  const [formData, setFormData] = useState({
    email: '',
    password: '',
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  };

  const handleLogin = async (e) => {
    e.preventDefault();

    try {
        const response = await fetch('https://localhost:7296/api/account/SignIn', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(formData),
        });
      
        if (response.ok) {
          const data = await response.json();
          console.log('Phản hồi từ API:', data); // In ra dữ liệu từ API để kiểm tra
        //   const token = data.token;
          
        //   // Lưu token vào local storage hoặc trạng thái ứng dụng
        //   localStorage.setItem('token', token);
      
        const token = data.token;
  
        // Lưu token vào cookie với một tên và thời gian sống (expires) tùy chọn
        Cookies.set('token_user', token, { expires: 7 }); // expires: 7 là thời gian sống trong 7 ngày


          // Chuyển hướng hoặc hiển thị thông báo đăng nhập thành công
        } else {
          console.error('Đăng nhập không thành công.');
          // Xử lý khi đăng nhập thất bại
        }
      } catch (error) {
        console.error('Lỗi khi đăng nhập:', error);
        // Xử lý khi xảy ra lỗi
      }
      
  };

  return (
    <div>
      <h2>Đăng nhập</h2>
      <form onSubmit={handleLogin}>
        <div>
          <label htmlFor="email">Email:</label>
          <input type="email" name="email" id="email" value={formData.email} onChange={handleChange} />
        </div>
        <div>
          <label htmlFor="password">Mật khẩu:</label>
          <input type="password" name="password" id="password" value={formData.password} onChange={handleChange} />
        </div>
        <button type="submit">Đăng nhập</button>
      </form>
    </div>
  );
}

export default LoginForm;
