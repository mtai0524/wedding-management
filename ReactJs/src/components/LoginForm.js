import Cookies from 'js-cookie';
import React, { useState } from 'react';
import jwt_decode from 'jwt-decode';

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

        const token = data.token;

        Cookies.set('token_user', token, { expires: 7 }); // expires: 7 là thời gian sống trong 7 ngày

        const decodedToken = jwt_decode(token);

        const username = decodedToken.name; // Lấy tên người dùng từ token
        const email = decodedToken['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress'];
        console.log('Tên người dùng:', username);
        console.log('Email:', email);
      } else {
        console.error('Đăng nhập không thành công.');
      }
    } catch (error) {
      console.error('Lỗi khi đăng nhập:', error);
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
